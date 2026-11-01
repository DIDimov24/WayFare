pragma ComponentBehavior: Bound

import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D
import wayfare.presentation

Node {
    id: root

    property real tileSize: 2
    property int stage: 0
    property real sway: 0

    readonly property var shafts: root.decorOf("shaft")
    readonly property var vents: root.decorOf("vent")
    readonly property var glows: root.decorOf("glow")

    function decorOf(kind: string): var {
        const decor = Level.decor
        const list = []
        for (let i = 0; i < decor.length; i++) {
            if (decor[i].kind === kind) {
                list.push(decor[i])
            }
        }
        return list
    }

    function buildDecor() {
        const decor = Level.decor
        const seaweed = []
        const orange = []
        const fan = []
        for (let i = 0; i < decor.length; i++) {
            const entry = decor[i]
            const position = Qt.vector3d(entry.x * root.tileSize, 0, entry.y * root.tileSize)
            if (entry.kind === "seaweed") {
                const size = seaweedModel.meshScale * entry.scale
                position.y = seaweedModel.meshLift * size * 1.1
                seaweed.push(swayingEntry.createObject(seaweedList, {
                    position: position,
                    scale: Qt.vector3d(size, size * 1.1, size),
                    yaw: entry.yaw,
                    phase: entry.phase
                }))
            }
            if (entry.kind === "orange_coral") {
                const size = orangeModel.meshScale * entry.scale
                position.y = orangeModel.meshLift * size
                orange.push(fixedEntry.createObject(orangeList, {
                    position: position,
                    scale: Qt.vector3d(size, size, size),
                    eulerRotation: Qt.vector3d(0, entry.yaw, 0)
                }))
            }
            if (entry.kind === "fan_coral") {
                const size = fanModel.meshScale * entry.scale
                position.y = fanModel.meshLift * size
                fan.push(fixedEntry.createObject(fanList, {
                    position: position,
                    scale: Qt.vector3d(size, size, size),
                    eulerRotation: Qt.vector3d(0, entry.yaw, 0)
                }))
            }
        }
        seaweedList.instances = seaweed
        orangeList.instances = orange
        fanList.instances = fan
    }

    Component.onCompleted: root.buildDecor()

    NumberAnimation on sway {
        running: root.visible
        loops: Animation.Infinite
        from: 0
        to: Math.PI * 2
        duration: 5200
    }

    Component {
        id: fixedEntry

        InstanceListEntry {}
    }

    Component {
        id: swayingEntry

        InstanceListEntry {
            property real yaw: 0
            property real phase: 0

            eulerRotation: Qt.vector3d(Math.sin(root.sway + phase) * 4, yaw, Math.cos(root.sway + phase) * 3)
        }
    }

    DirectionalLight {
        eulerRotation: Qt.vector3d(-70, 25, 0)
        color: "#7fd6e0"
        brightness: 0.45
        ambientColor: "#143c46"
    }

    DirectionalLight {
        eulerRotation: Qt.vector3d(-35, 200, 0)
        color: "#2a6f7d"
        brightness: 0.25
    }

    Repeater3D {
        model: root.shafts

        delegate: PointLight {
            required property var modelData

            position: Qt.vector3d(modelData.x * root.tileSize, 2.8, modelData.y * root.tileSize)
            color: "#8ff0ff"
            brightness: 3
            quadraticFade: 1100
        }
    }

    Repeater3D {
        model: root.glows

        delegate: PointLight {
            required property var modelData

            position: Qt.vector3d(modelData.x * root.tileSize, 2.6, modelData.y * root.tileSize)
            color: "#5fc8d4"
            brightness: 1.2
            quadraticFade: 600
        }
    }

    Model {
        visible: root.stage >= 6
        source: "#Rectangle"
        position: Qt.vector3d(Level.size * root.tileSize / 2, 3, Level.size * root.tileSize / 2)
        eulerRotation.x: 90
        scale: Qt.vector3d(Level.size * root.tileSize / 100, Level.size * root.tileSize / 100, 1)
        castsShadows: false
        receivesShadows: false
        materials: PrincipledMaterial {
            baseColor: "#6f8f95"
            baseColorMap: Texture {
                source: Assets.url + "textures/temple/wall_diffuse.jpg"
                scaleU: Level.size
                scaleV: Level.size
            }
            normalMap: Texture {
                source: Assets.url + "textures/temple/wall_normal.jpg"
                scaleU: Level.size
                scaleV: Level.size
            }
            roughness: 1
        }
    }

    Node {
        visible: root.stage >= 4

        SeaweedModel {
            id: seaweedModel

            instancing: InstanceList {
                id: seaweedList
            }
        }

        CoralModel {
            id: orangeModel

            variant: 0
            instancing: InstanceList {
                id: orangeList
            }
        }

        CoralModel {
            id: fanModel

            variant: 1
            instancing: InstanceList {
                id: fanList
            }
        }
    }

    Node {
        visible: root.stage >= 5

        Model {
            source: "#Rectangle"
            position: Qt.vector3d(Level.size * root.tileSize / 2, 0.01, Level.size * root.tileSize / 2)
            eulerRotation.x: -90
            scale: Qt.vector3d(Level.size * root.tileSize / 100, Level.size * root.tileSize / 100, 1)
            castsShadows: false
            receivesShadows: false
            materials: PrincipledMaterial {
                lighting: PrincipledMaterial.NoLighting
                blendMode: PrincipledMaterial.Multiply
                baseColor: "#9cc8cc"
                depthDrawMode: Material.NeverDepthDraw
            }
        }

        Model {
            source: "#Rectangle"
            position: Qt.vector3d(Level.size * root.tileSize / 2, 0.02, Level.size * root.tileSize / 2)
            eulerRotation.x: -90
            scale: Qt.vector3d(Level.size * root.tileSize / 100, Level.size * root.tileSize / 100, 1)
            castsShadows: false
            receivesShadows: false
            materials: PrincipledMaterial {
                lighting: PrincipledMaterial.NoLighting
                alphaMode: PrincipledMaterial.Blend
                baseColor: "#7fe3ef"
                opacity: 0.22
                opacityChannel: Material.R
                depthDrawMode: Material.NeverDepthDraw
                opacityMap: Texture {
                    source: Assets.url + "textures/temple/caustics/caust00.png"
                    tilingModeHorizontal: Texture.Repeat
                    tilingModeVertical: Texture.Repeat
                    scaleU: Level.size * 0.5
                    scaleV: Level.size * 0.5

                    NumberAnimation on positionU {
                        running: root.visible
                        loops: Animation.Infinite
                        from: 0
                        to: 1
                        duration: 23000
                    }

                    NumberAnimation on positionV {
                        running: root.visible
                        loops: Animation.Infinite
                        from: 0
                        to: 1
                        duration: 31000
                    }
                }
            }
        }

        Model {
            source: "#Rectangle"
            position: Qt.vector3d(Level.size * root.tileSize / 2, 0.03, Level.size * root.tileSize / 2)
            eulerRotation.x: -90
            scale: Qt.vector3d(Level.size * root.tileSize / 100, Level.size * root.tileSize / 100, 1)
            castsShadows: false
            receivesShadows: false
            materials: PrincipledMaterial {
                lighting: PrincipledMaterial.NoLighting
                alphaMode: PrincipledMaterial.Blend
                baseColor: "#7fe3ef"
                opacity: 0.18
                opacityChannel: Material.R
                depthDrawMode: Material.NeverDepthDraw
                opacityMap: Texture {
                    source: Assets.url + "textures/temple/caustics/caust00.png"
                    tilingModeHorizontal: Texture.Repeat
                    tilingModeVertical: Texture.Repeat
                    scaleU: Level.size * 0.37
                    scaleV: Level.size * 0.37

                    NumberAnimation on positionU {
                        running: root.visible
                        loops: Animation.Infinite
                        from: 1
                        to: 0
                        duration: 29000
                    }

                    NumberAnimation on positionV {
                        running: root.visible
                        loops: Animation.Infinite
                        from: 1
                        to: 0
                        duration: 19000
                    }
                }
            }
        }

        ParticleSystem3D {
            id: bubbles

            running: root.visible && root.stage >= 5

            ModelParticle3D {
                id: bubble

                maxAmount: 240
                color: "#b4e6f0"
                colorVariation: Qt.vector4d(0.05, 0.05, 0.05, 0.3)
                fadeInDuration: 400
                fadeOutDuration: 700
                delegate: Model {
                    source: "#Sphere"
                    scale: Qt.vector3d(0.0004, 0.0004, 0.0004)
                    castsShadows: false
                    receivesShadows: false
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                        alphaMode: PrincipledMaterial.Blend
                        baseColor: "#ffffff"
                        opacity: 0.55
                    }
                }
            }

            ParticleEmitter3D {
                particle: bubble
                position: Qt.vector3d(Level.playerX * root.tileSize, 0.2, Level.playerY * root.tileSize)
                shape: ParticleShape3D {
                    type: ParticleShape3D.Cube
                    extents: Qt.vector3d(1.4, 0.1, 1.4)
                }
                emitRate: 9
                lifeSpan: 4200
                lifeSpanVariation: 800
                particleScale: 1
                particleScaleVariation: 0.6
                velocity: VectorDirection3D {
                    direction: Qt.vector3d(0, 0.62, 0)
                    directionVariation: Qt.vector3d(0.1, 0.15, 0.1)
                }
            }

            Repeater3D {
                model: root.vents

                delegate: ParticleEmitter3D {
                    required property var modelData

                    system: bubbles
                    particle: bubble
                    position: Qt.vector3d(modelData.x * root.tileSize, 0.08, modelData.y * root.tileSize)
                    shape: ParticleShape3D {
                        type: ParticleShape3D.Sphere
                        extents: Qt.vector3d(0.2, 0.04, 0.2)
                    }
                    emitRate: 4
                    lifeSpan: 4600
                    lifeSpanVariation: 600
                    particleScale: 1.1
                    particleScaleVariation: 0.6
                    velocity: VectorDirection3D {
                        direction: Qt.vector3d(0, 0.7, 0)
                        directionVariation: Qt.vector3d(0.06, 0.12, 0.06)
                    }
                }
            }

            Wander3D {
                uniqueAmount: Qt.vector3d(0.18, 0, 0.18)
                uniquePace: Qt.vector3d(0.8, 0, 0.8)
                uniqueAmountVariation: 0.4
                uniquePaceVariation: 0.4
            }
        }
    }
}
