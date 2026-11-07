pragma ComponentBehavior: Bound

import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property real tileSize: 2
    property int stage: 0
    property real flicker: 0
    readonly property real torchHeight: 1.9

    function buildTorches() {
        const decor = Level.decor
        const entries = []
        for (let i = 0; i < decor.length; i++) {
            entries.push(torchEntry.createObject(torchList, {
                position: Qt.vector3d(decor[i].x * root.tileSize, root.torchHeight, decor[i].y * root.tileSize),
                eulerRotation: Qt.vector3d(0, decor[i].yaw, 0),
                scale: Qt.vector3d(0.8, 0.8, 0.8)
            }))
        }
        torchList.instances = entries
    }

    function torchLight(entry: var): vector3d {
        const yaw = entry.yaw * Math.PI / 180
        return Qt.vector3d(entry.x * root.tileSize + Math.sin(yaw) * 0.44, root.torchHeight + 0.68, entry.y * root.tileSize + Math.cos(yaw) * 0.44)
    }

    Component.onCompleted: root.buildTorches()

    NumberAnimation on flicker {
        running: root.visible
        loops: Animation.Infinite
        from: 0
        to: Math.PI * 2
        duration: 1700
    }

    Component {
        id: torchEntry

        InstanceListEntry {}
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
            baseColorMap: Texture {
                source: Assets.url + "textures/dungeon/wall_diffuse.jpg"
                scaleU: Level.size
                scaleV: Level.size
            }
            normalMap: Texture {
                source: Assets.url + "textures/dungeon/wall_normal.jpg"
                scaleU: Level.size
                scaleV: Level.size
            }
            roughness: 1
            specularAmount: 0
        }
    }

    Node {
        visible: root.stage >= 4

        TorchModel {
            instancing: InstanceList {
                id: torchList
            }
        }

        Repeater3D {
            model: Level.decor

            delegate: Node {
                id: torch

                required property var modelData
                required property int index
                readonly property real wave: Math.sin(root.flicker * 3 + torch.modelData.phase) * 0.6 + Math.sin(root.flicker * 7 + torch.index) * 0.4

                position: root.torchLight(torch.modelData)

                PointLight {
                    color: "#ff9a4a"
                    brightness: 2.6 + torch.wave * 0.4
                    quadraticFade: 6000
                }

                Model {
                    source: "#Sphere"
                    y: -0.3
                    scale: Qt.vector3d(0.0013, 0.0034 + torch.wave * 0.0003, 0.0013)
                    castsShadows: false
                    receivesShadows: false
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                        baseColor: "#ffe08a"
                    }
                }

                Model {
                    source: "#Sphere"
                    y: -0.28
                    scale: Qt.vector3d(0.0024, 0.0056 + torch.wave * 0.0005, 0.0024)
                    castsShadows: false
                    receivesShadows: false
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                        alphaMode: PrincipledMaterial.Blend
                        baseColor: "#ff8a24"
                        opacity: 0.75
                    }
                }
            }
        }
    }
}
