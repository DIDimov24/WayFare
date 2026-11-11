import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.Particles3D
import QtQuick.Timeline
import wayfare.presentation

Cutscene {
    id: root

    readonly property real prologue: 19200
    readonly property real kneelAt: 5200
    readonly property real dive: Math.max(0, root.time - root.prologue)
    readonly property bool above: root.time < root.prologue

    lastStage: 5
    length: 35200
    heroReady: hero.ready
    title: "The Underwater Temple"
    titleAtBottom: true
    lines: [
        { start: 500, end: 5100, text: "She was right behind me. I only looked away for a moment.", voice: "intro_1" },
        { start: 7000, end: 11000, text: "Her footprints end right here, at the edge of the ice.", voice: "intro_2" },
        { start: 11500, end: 15400, text: "It dragged her under, the same way it took the other children.", voice: "intro_3" },
        { start: 15600, end: 19600, text: "Hold on, Mila. I'm coming down to get you.", voice: "intro_4" },
        { start: 29500, end: 35100, text: "I can't hold my breath much longer. There has to be air somewhere inside.", voice: "intro_5" }
    ]

    readonly property bool diving: root.started && !root.above

    onDivingChanged: {
        if (root.diving) {
            music.play()
        }
    }
    onSkipRequested: Game.startLevel()
    onEnded: Game.startLevel()

    MediaPlayer {
        id: music
        source: Assets.url + "audio/intro_music.ogg"
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * Math.min(1, (root.length - root.time) / 1200)
        }
    }

    Timeline {
        startFrame: 0
        endFrame: root.prologue
        currentFrame: root.time
        enabled: root.above

        KeyframeGroup {
            target: camera
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(5.8, 102.3, 6.4) }
            Keyframe { frame: 5199; value: Qt.vector3d(4.6, 101.9, 5.2) }
            Keyframe { frame: 5200; value: Qt.vector3d(1.9, 100.8, 0.6) }
            Keyframe { frame: 11199; value: Qt.vector3d(1.6, 100.9, 0.3) }
            Keyframe { frame: 11200; value: Qt.vector3d(-0.3, 100.3, 3.4) }
            Keyframe { frame: 19200; value: Qt.vector3d(-0.15, 100.4, 2.9) }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 101.1, -0.6) }
            Keyframe { frame: 5199; value: Qt.vector3d(0, 101.1, -0.8) }
            Keyframe { frame: 5200; value: Qt.vector3d(0.1, 100.6, -0.7) }
            Keyframe { frame: 11199; value: Qt.vector3d(0.1, 100.8, -0.8) }
            Keyframe { frame: 11200; value: Qt.vector3d(0, 100.85, -1) }
            Keyframe { frame: 19200; value: Qt.vector3d(0, 100.9, -1) }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 100, -1.1) }
            Keyframe { frame: 19200; value: Qt.vector3d(0, 100, -1.1) }
        }

        KeyframeGroup {
            target: root
            property: "fadeOpacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1400; value: 0 }
            Keyframe { frame: 18500; value: 0 }
            Keyframe { frame: 19200; value: 1 }
        }
    }

    Timeline {
        startFrame: 0
        endFrame: 16000
        currentFrame: root.dive
        enabled: !root.above

        KeyframeGroup {
            target: camera
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(6, 3.2, -1) }
            Keyframe { frame: 6000; value: Qt.vector3d(4.5, 2.6, -14) }
            Keyframe { frame: 6001; value: Qt.vector3d(4.5, 1.6, -19.5) }
            Keyframe { frame: 11030; value: Qt.vector3d(3.2, 1.8, -20.8) }
            Keyframe { frame: 11031; value: Qt.vector3d(0.9, 2.9, -22.2) }
            Keyframe { frame: 16000; value: Qt.vector3d(0.3, 2.7, -25.2) }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(-2, 1.9, -9) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 3.4, -21) }
            Keyframe { frame: 6001; value: Qt.vector3d(0, 1, -24.5) }
            Keyframe { frame: 11030; value: Qt.vector3d(0, 1.8, -25.5) }
            Keyframe { frame: 11031; value: Qt.vector3d(0, 1.9, -27.5) }
            Keyframe { frame: 16000; value: Qt.vector3d(0, 2.6, -30) }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(-2, 1.2, -6) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 1.2, -18) }
            Keyframe { frame: 6001; value: Qt.vector3d(0, 0, -23.4) }
            Keyframe { frame: 11030; value: Qt.vector3d(0, 0, -23.4) }
            Keyframe { frame: 11031; value: Qt.vector3d(0, 1.2, -25.6) }
            Keyframe { frame: 15200; value: Qt.vector3d(0, 1.2, -29.8) }
            Keyframe { frame: 16000; value: Qt.vector3d(0, 1.2, -29.8) }
        }

        KeyframeGroup {
            target: root
            property: "titleOpacity"

            Keyframe { frame: 0; value: 0 }
            Keyframe { frame: 6500; value: 0 }
            Keyframe { frame: 7500; value: 1 }
            Keyframe { frame: 9800; value: 1 }
            Keyframe { frame: 10800; value: 0 }
        }

        KeyframeGroup {
            target: root
            property: "fadeOpacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1200; value: 0 }
            Keyframe { frame: 14400; value: 0 }
            Keyframe { frame: 16000; value: 1 }
        }
    }

    component TempleBlock: Model {
        id: block

        property vector3d size: Qt.vector3d(1, 1, 1)
        property real top: 100

        source: "#Cube"
        scale: size.times(0.01)
        materials: TempleWallMaterial {
            wallTop: block.top
            uvScale: Qt.vector2d(block.size.x / 2, block.size.y / 2)
        }
    }

    component Drum: Model {
        id: drum

        property real radius: 0.42
        property real length: 2

        source: "#Cylinder"
        scale: Qt.vector3d(drum.radius / 50, drum.length / 100, drum.radius / 50)
        materials: TempleWallMaterial {
            wallTop: 100
            uvScale: Qt.vector2d(1.5, drum.length / 2)
        }
    }

    component Column: Node {
        id: column

        property real shaft: 5.25
        property real radius: 0.42
        property bool capital: true

        TempleBlock {
            y: 0.1
            size: Qt.vector3d(column.radius * 2.6, 0.2, column.radius * 2.6)
        }

        Drum {
            y: 0.2 + column.shaft / 2
            radius: column.radius
            length: column.shaft
        }

        Drum {
            visible: column.capital
            y: 0.3 + column.shaft
            radius: column.radius * 1.3
            length: 0.2
        }

        TempleBlock {
            visible: column.capital
            y: 0.525 + column.shaft
            size: Qt.vector3d(column.radius * 2.9, 0.25, column.radius * 2.9)
        }
    }

    component LyingDrum: Node {
        id: lying

        property real radius: 0.42
        property real length: 2

        Drum {
            y: lying.radius * 0.85
            eulerRotation.z: 90
            radius: lying.radius
            length: lying.length
        }
    }

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.Color
            clearColor: root.above ? "#10151f" : "#082d35"
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            fog: Fog {
                enabled: true
                color: root.above ? "#10151f" : "#082d35"
                density: 1
                depthEnabled: true
                depthNear: 3
                depthFar: root.above ? 26 : 30
                depthCurve: 1.2
                heightEnabled: !root.above
                mostIntenseY: 16
                leastIntenseY: 6
                heightCurve: 1.5
            }
        }

        Node {
            id: focusPoint
        }

        PerspectiveCamera {
            id: camera

            lookAtNode: focusPoint
            fieldOfView: 55
            clipNear: 0.05
            clipFar: 200
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-70, 25, 0)
            color: root.above ? "#9fb4d8" : "#7fd6e0"
            brightness: root.above ? 0.7 : 0.55
            ambientColor: root.above ? "#20283a" : "#143c46"
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-35, 200, 0)
            color: "#2a6f7d"
            brightness: 0.3
        }

        PointLight {
            position: Qt.vector3d(0, 6, -21)
            color: "#5fc8d4"
            brightness: 2
            quadraticFade: 150
        }

        Node {
            visible: root.stage >= 5 && root.above

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, 100, 0)
                eulerRotation.x: -90
                scale: Qt.vector3d(1.2, 1.2, 1)
                materials: PrincipledMaterial {
                    baseColorMap: Texture {
                        source: Assets.url + "textures/village/floor_diffuse.jpg"
                        scaleU: 40
                        scaleV: 40
                    }
                    normalMap: Texture {
                        source: Assets.url + "textures/village/floor_normal.jpg"
                        scaleU: 40
                        scaleV: 40
                    }
                    normalStrength: 1.6
                    roughnessMap: Texture {
                        source: Assets.url + "textures/village/floor_roughness.jpg"
                        scaleU: 40
                        scaleV: 40
                    }
                    roughnessChannel: Material.R
                }
            }

            Model {
                source: "#Cylinder"
                position: Qt.vector3d(0.1, 100.004, 0.9)
                scale: Qt.vector3d(0.046, 0.0002, 0.04)
                materials: PrincipledMaterial {
                    baseColor: "#8fa9bd"
                    roughness: 0.2
                    specularAmount: 1
                }
            }

            Model {
                source: "#Cylinder"
                position: Qt.vector3d(0.1, 100.012, 0.9)
                scale: Qt.vector3d(0.033, 0.0002, 0.027)
                materials: PrincipledMaterial {
                    baseColor: "#dfeaf2"
                    roughness: 0.5
                }
            }

            Model {
                source: "#Cylinder"
                position: Qt.vector3d(0.1, 100.024, 0.9)
                scale: Qt.vector3d(0.03, 0.0002, 0.024)
                materials: PrincipledMaterial {
                    baseColor: "#123c4a"
                    roughness: 0.08
                    specularAmount: 1
                }
            }

            Model {
                source: "#Cylinder"
                position: Qt.vector3d(0.1, 100.03, 0.9)
                scale: Qt.vector3d(0.0296, 0.0001, 0.0236)
                castsShadows: false
                receivesShadows: false
                materials: PrincipledMaterial {
                    alphaMode: PrincipledMaterial.Blend
                    baseColor: "#000000"
                    emissiveFactor: Qt.vector3d(0.45, 0.8, 0.9)
                    specularAmount: 0
                    opacity: 0.5
                    opacityChannel: Material.R
                    depthDrawMode: Material.NeverDepthDraw
                    opacityMap: Texture {
                        source: Assets.url + "textures/temple/caustics/caust00.png"
                        tilingModeHorizontal: Texture.Repeat
                        tilingModeVertical: Texture.Repeat
                        scaleU: 2
                        scaleV: 2

                        NumberAnimation on positionU {
                            loops: Animation.Infinite
                            from: 0
                            to: 1
                            duration: 14000
                        }

                        NumberAnimation on positionV {
                            loops: Animation.Infinite
                            from: 0
                            to: 1
                            duration: 19000
                        }
                    }
                }
            }

            Repeater3D {
                model: [
                    Qt.vector4d(-1.4, 0.7, 25, 0.5), Qt.vector4d(1.7, 1.2, -18, 0.6), Qt.vector4d(0.5, 2.3, 40, 0.45),
                    Qt.vector4d(-1.1, 1.9, -30, 0.55), Qt.vector4d(1.5, 0.1, 12, 0.4), Qt.vector4d(-0.6, -0.3, -22, 0.35)
                ]

                delegate: Model {
                    required property vector4d modelData

                    source: "#Cube"
                    position: Qt.vector3d(modelData.x, 100.04, modelData.y)
                    eulerRotation: Qt.vector3d(modelData.z * 0.4, modelData.z * 3, modelData.z)
                    scale: Qt.vector3d(modelData.w * 0.012, 0.0012, modelData.w * 0.008)
                    materials: PrincipledMaterial {
                        baseColor: "#b9cbdc"
                        roughness: 0.25
                    }
                }
            }

            PointLight {
                position: Qt.vector3d(-1.6, 100.5, -0.4)
                color: "#ffb870"
                brightness: 1.3 + Math.sin(root.time * 0.013) * 0.15
                quadraticFade: 500
            }

            ParticleSystem3D {
                running: root.started && root.above

                ModelParticle3D {
                    id: snowflake

                    maxAmount: 320
                    color: "#ffffff"
                    fadeInDuration: 300
                    fadeOutDuration: 400
                    delegate: Model {
                        source: "#Sphere"
                        scale: Qt.vector3d(0.0003, 0.0003, 0.0003)
                        castsShadows: false
                        receivesShadows: false
                        materials: PrincipledMaterial {
                            lighting: PrincipledMaterial.NoLighting
                            baseColor: "#ffffff"
                        }
                    }
                }

                ParticleEmitter3D {
                    particle: snowflake
                    position: Qt.vector3d(1, 106, 1.5)
                    shape: ParticleShape3D {
                        type: ParticleShape3D.Cube
                        extents: Qt.vector3d(9, 0.5, 9)
                    }
                    emitRate: 60
                    lifeSpan: 5000
                    particleScale: 1
                    particleScaleVariation: 0.5
                    velocity: VectorDirection3D {
                        direction: Qt.vector3d(0.2, -1.25, 0.05)
                        directionVariation: Qt.vector3d(0.15, 0.2, 0.15)
                    }
                }
            }

            RockModel {
                position: Qt.vector3d(-4.2, 100, -3.4)
                eulerRotation.y: 40
            }

            RockModel {
                position: Qt.vector3d(5.4, 100, -5.5)
                eulerRotation.y: 210
                variant: 1
            }

            StumpModel {
                position: Qt.vector3d(3.6, 100, -2.2)
                scale: Qt.vector3d(1.4, 1.4, 1.4)
            }

            FenceModel {
                position: Qt.vector3d(-6.5, 100, -1)
                eulerRotation.y: 75
            }

            PineModel {
                position: Qt.vector3d(-9, 100, -7)
            }

            PineModel {
                position: Qt.vector3d(7, 100, -10)
                variant: 1
            }

            PineModel {
                position: Qt.vector3d(-4, 100, -14)
                variant: 2
            }

            PineModel {
                position: Qt.vector3d(12, 100, -3)
                variant: 3
            }

            PineModel {
                position: Qt.vector3d(1, 100, -19)
                variant: 3
            }
        }

        HeroModel {
            id: hero

            eulerRotation.y: root.above ? 0 : 180
            clip: root.above ? (root.time < root.kneelAt ? "looking_around" : "pick_up_ice") : (root.dive < 6000 ? "swimming" : (root.dive < 11030 ? "swimming_to_edge" : "walking"))
            loop: clip === "swimming" || clip === "walking"
            time: root.above ? (root.time < root.kneelAt ? root.time : root.time - root.kneelAt) : (root.dive < 6000 ? root.dive : Math.max(0, root.dive - (root.dive < 11030 ? 6001 : 11031)))
        }

        Model {
            source: "#Sphere"
            position: Qt.vector3d(0, 0, -15)
            scale: Qt.vector3d(1.4, 1.4, 1.4)
            castsShadows: false
            receivesShadows: false
            materials: PrincipledMaterial {
                lighting: PrincipledMaterial.NoLighting
                baseColor: "#082d35"
                cullMode: Material.FrontFaceCulling
            }
        }

        Model {
            visible: root.stage >= 1
            source: "#Rectangle"
            position: Qt.vector3d(0, 0, -10)
            eulerRotation.x: -90
            scale: Qt.vector3d(1.6, 1.6, 1)
            materials: PrincipledMaterial {
                baseColorMap: Texture {
                    source: Assets.url + "textures/temple/floor_diffuse.jpg"
                    scaleU: 40
                    scaleV: 40
                }
                roughness: 1
            }
        }

        Node {
            visible: root.stage >= 2

            TempleBlock {
                position: Qt.vector3d(0, 0.15, -30.54)
                size: Qt.vector3d(19.6, 0.3, 11)
                top: 0.3
            }

            TempleBlock {
                position: Qt.vector3d(0, 0.3, -30.02)
                size: Qt.vector3d(18, 0.6, 10)
                top: 0.6
            }

            TempleBlock {
                position: Qt.vector3d(0, 0.6, -29.5)
                size: Qt.vector3d(16, 1.2, 9)
                top: 1.2
            }

            Repeater3D {
                model: [-7.2, -4.6, -1.9, 1.9, 4.6, 7.2]

                delegate: Column {
                    required property real modelData

                    position: Qt.vector3d(modelData, 1.2, -26.2)
                }
            }

            TempleBlock {
                position: Qt.vector3d(0, 5.05, -29.5)
                size: Qt.vector3d(11, 7.7, 1)
                top: 8.9
            }

            TempleBlock {
                position: Qt.vector3d(-1.45, 2.9, -28.85)
                size: Qt.vector3d(0.5, 3.4, 0.4)
            }

            TempleBlock {
                position: Qt.vector3d(1.45, 2.9, -28.85)
                size: Qt.vector3d(0.5, 3.4, 0.4)
            }

            TempleBlock {
                position: Qt.vector3d(0, 4.75, -28.82)
                size: Qt.vector3d(3.5, 0.5, 0.46)
            }

            TempleBlock {
                position: Qt.vector3d(0, 7.5, -27.25)
                size: Qt.vector3d(16.6, 0.8, 3.5)
            }

            TempleBlock {
                position: Qt.vector3d(0, 8.25, -27.35)
                size: Qt.vector3d(16.6, 0.7, 3.3)
            }

            Repeater3D {
                model: 12

                delegate: TempleBlock {
                    required property int index

                    position: Qt.vector3d(-7.7 + index * 1.4, 8.25, -25.62)
                    size: Qt.vector3d(0.5, 0.7, 0.16)
                }
            }

            TempleBlock {
                position: Qt.vector3d(0, 8.75, -27.2)
                size: Qt.vector3d(17.4, 0.3, 4)
                top: 8.9
            }

            Node {
                position: Qt.vector3d(0, 8.9, -26.2)
                scale: Qt.vector3d(11.74, 2.47, 1)

                Model {
                    source: "#Cube"
                    eulerRotation.z: 45
                    scale: Qt.vector3d(0.01, 0.01, 0.006)
                    materials: TempleWallMaterial {
                        wallTop: 100
                        uvScale: Qt.vector2d(4, 1)
                    }
                }
            }

            TempleBlock {
                position: Qt.vector3d(-4.15, 9.775, -25.95)
                eulerRotation.z: 11.9
                size: Qt.vector3d(8.6, 0.25, 0.7)
            }

            TempleBlock {
                position: Qt.vector3d(4.15, 9.775, -25.95)
                eulerRotation.z: -11.9
                size: Qt.vector3d(8.6, 0.25, 0.7)
            }

            TempleBlock {
                position: Qt.vector3d(0, 9.05, -30.25)
                size: Qt.vector3d(16.6, 0.3, 7.5)
            }

            Model {
                source: "#Cube"
                position: Qt.vector3d(0, 2.8, -28.95)
                scale: Qt.vector3d(0.0242, 0.032, 0.002)
                materials: PrincipledMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    baseColor: "#020608"
                }
            }
        }

        Node {
            visible: root.stage >= 3

            Column {
                position: Qt.vector3d(-6.5, 0, -8)
                shaft: 2.6
                capital: false
            }

            Column {
                position: Qt.vector3d(-9, 0, -14)
                shaft: 1.4
                capital: false
            }

            Column {
                position: Qt.vector3d(9.5, 0, -12)
                shaft: 3.2
                capital: false
            }

            Column {
                position: Qt.vector3d(11, 0, -19)
                shaft: 2
                capital: false
            }

            Column {
                position: Qt.vector3d(-7.5, 0, -20)
                shaft: 3.6
            }

            TempleBlock {
                position: Qt.vector3d(-7.6, 0.18, -9.3)
                eulerRotation: Qt.vector3d(12, 30, 8)
                size: Qt.vector3d(1.2, 0.25, 1.2)
            }

            LyingDrum {
                position: Qt.vector3d(-8, 0, -5.5)
                eulerRotation.y: 20
                length: 1.8
            }

            LyingDrum {
                position: Qt.vector3d(-11, 0, -17)
                eulerRotation.y: 70
                length: 2.4
            }

            LyingDrum {
                position: Qt.vector3d(8.5, 0, -7)
                eulerRotation.y: -30
                length: 2
            }

            LyingDrum {
                position: Qt.vector3d(13, 0, -15)
                eulerRotation.y: 45
                length: 1.6
            }

            LyingDrum {
                position: Qt.vector3d(9.6, 0, -23)
                eulerRotation.y: 30
                length: 2.4
            }

            Node {
                position: Qt.vector3d(-13, 0, -11)
                eulerRotation.y: 10

                TempleBlock {
                    y: 0.7
                    size: Qt.vector3d(4, 1.4, 0.9)
                }

                TempleBlock {
                    position: Qt.vector3d(-0.8, 1.9, 0)
                    size: Qt.vector3d(2.4, 1, 0.9)
                }

                TempleBlock {
                    position: Qt.vector3d(1, 1.7, 0)
                    size: Qt.vector3d(1, 0.6, 0.9)
                }
            }

            Node {
                position: Qt.vector3d(14, 0, -9)
                eulerRotation.y: -20

                TempleBlock {
                    y: 1
                    size: Qt.vector3d(3.6, 2, 0.9)
                }

                TempleBlock {
                    position: Qt.vector3d(0.9, 2.45, 0)
                    size: Qt.vector3d(1.8, 0.9, 0.9)
                }
            }

            Node {
                position: Qt.vector3d(-10.5, 0, -24)
                eulerRotation.y: 15

                TempleBlock {
                    y: 1.3
                    size: Qt.vector3d(3, 2.6, 0.9)
                }

                TempleBlock {
                    position: Qt.vector3d(-0.8, 3, 0)
                    size: Qt.vector3d(1.4, 0.8, 0.9)
                }
            }

            TempleBlock {
                position: Qt.vector3d(-5.5, 0.2, -12)
                eulerRotation.y: 25
                size: Qt.vector3d(0.9, 0.6, 0.7)
            }

            TempleBlock {
                position: Qt.vector3d(-7, 0.25, -16.5)
                eulerRotation: Qt.vector3d(10, 60, 0)
                size: Qt.vector3d(1.2, 0.6, 0.8)
            }

            TempleBlock {
                position: Qt.vector3d(8.5, 0.2, -16)
                eulerRotation.y: 15
                size: Qt.vector3d(1, 0.5, 0.8)
            }

            TempleBlock {
                position: Qt.vector3d(10.5, 0.3, -5)
                eulerRotation: Qt.vector3d(0, -40, 8)
                size: Qt.vector3d(1.3, 0.7, 0.9)
            }

            TempleBlock {
                position: Qt.vector3d(12, 0.2, -22)
                size: Qt.vector3d(0.8, 0.5, 0.8)
            }

            TempleBlock {
                position: Qt.vector3d(-12, 0.25, -6)
                eulerRotation.y: 50
                size: Qt.vector3d(1.1, 0.6, 0.7)
            }

            TempleBlock {
                position: Qt.vector3d(-4.8, 0.2, -23)
                eulerRotation.y: 35
                size: Qt.vector3d(1, 0.5, 0.8)
            }

            TempleBlock {
                position: Qt.vector3d(9.2, 0.35, -26.5)
                eulerRotation: Qt.vector3d(6, 20, -10)
                size: Qt.vector3d(1.3, 0.7, 1)
            }
        }

        Node {
            visible: root.stage >= 3

            SeaweedModel {
                id: seaweedModel

                instancing: RandomInstancing {
                    instanceCount: 30
                    randomSeed: 26
                    position: InstanceRange {
                        from: Qt.vector3d(-18, seaweedModel.meshLift * seaweedModel.meshScale, -24)
                        to: Qt.vector3d(-4, seaweedModel.meshLift * seaweedModel.meshScale, 6)
                    }
                    scale: InstanceRange {
                        from: Qt.vector3d(seaweedModel.meshScale * 0.8, seaweedModel.meshScale * 0.8, seaweedModel.meshScale * 0.8)
                        to: Qt.vector3d(seaweedModel.meshScale * 1.2, seaweedModel.meshScale * 1.2, seaweedModel.meshScale * 1.2)
                        proportional: true
                    }
                    rotation: InstanceRange {
                        from: Qt.vector3d(0, 0, 0)
                        to: Qt.vector3d(0, 360, 0)
                    }
                }
            }

            SeaweedModel {
                id: seaweedRight

                instancing: RandomInstancing {
                    instanceCount: 30
                    randomSeed: 27
                    position: InstanceRange {
                        from: Qt.vector3d(4, seaweedRight.meshLift * seaweedRight.meshScale, -24)
                        to: Qt.vector3d(18, seaweedRight.meshLift * seaweedRight.meshScale, 6)
                    }
                    scale: InstanceRange {
                        from: Qt.vector3d(seaweedRight.meshScale * 0.8, seaweedRight.meshScale * 0.8, seaweedRight.meshScale * 0.8)
                        to: Qt.vector3d(seaweedRight.meshScale * 1.2, seaweedRight.meshScale * 1.2, seaweedRight.meshScale * 1.2)
                        proportional: true
                    }
                    rotation: InstanceRange {
                        from: Qt.vector3d(0, 0, 0)
                        to: Qt.vector3d(0, 360, 0)
                    }
                }
            }

            CoralModel {
                id: orangeCoral

                variant: 0
                instancing: RandomInstancing {
                    instanceCount: 24
                    randomSeed: 28
                    position: InstanceRange {
                        from: Qt.vector3d(-16, orangeCoral.meshLift * orangeCoral.meshScale, -24)
                        to: Qt.vector3d(16, orangeCoral.meshLift * orangeCoral.meshScale, 4)
                    }
                    scale: InstanceRange {
                        from: Qt.vector3d(orangeCoral.meshScale * 0.8, orangeCoral.meshScale * 0.8, orangeCoral.meshScale * 0.8)
                        to: Qt.vector3d(orangeCoral.meshScale * 1.3, orangeCoral.meshScale * 1.3, orangeCoral.meshScale * 1.3)
                        proportional: true
                    }
                    rotation: InstanceRange {
                        from: Qt.vector3d(0, 0, 0)
                        to: Qt.vector3d(0, 360, 0)
                    }
                }
            }

            CoralModel {
                id: fanCoral

                variant: 1
                instancing: RandomInstancing {
                    instanceCount: 16
                    randomSeed: 29
                    position: InstanceRange {
                        from: Qt.vector3d(-16, fanCoral.meshLift * fanCoral.meshScale, -24)
                        to: Qt.vector3d(16, fanCoral.meshLift * fanCoral.meshScale, 4)
                    }
                    scale: InstanceRange {
                        from: Qt.vector3d(fanCoral.meshScale * 0.8, fanCoral.meshScale * 0.8, fanCoral.meshScale * 0.8)
                        to: Qt.vector3d(fanCoral.meshScale * 1.3, fanCoral.meshScale * 1.3, fanCoral.meshScale * 1.3)
                        proportional: true
                    }
                    rotation: InstanceRange {
                        from: Qt.vector3d(0, 0, 0)
                        to: Qt.vector3d(0, 360, 0)
                    }
                }
            }
        }

        Node {
            visible: root.stage >= 4

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, 0.02, -10)
                eulerRotation.x: -90
                scale: Qt.vector3d(1.6, 1.6, 1)
                castsShadows: false
                receivesShadows: false
                materials: PrincipledMaterial {
                    alphaMode: PrincipledMaterial.Blend
                    baseColor: "#000000"
                    emissiveFactor: Qt.vector3d(0.5, 0.89, 0.94)
                    specularAmount: 0
                    opacity: 0.22
                    opacityChannel: Material.R
                    depthDrawMode: Material.NeverDepthDraw
                    opacityMap: Texture {
                        source: Assets.url + "textures/temple/caustics/caust00.png"
                        tilingModeHorizontal: Texture.Repeat
                        tilingModeVertical: Texture.Repeat
                        scaleU: 40
                        scaleV: 40

                        NumberAnimation on positionU {
                            loops: Animation.Infinite
                            from: 0
                            to: 1
                            duration: 23000
                        }

                        NumberAnimation on positionV {
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
                position: Qt.vector3d(0, 0.03, -10)
                eulerRotation.x: -90
                scale: Qt.vector3d(1.6, 1.6, 1)
                castsShadows: false
                receivesShadows: false
                materials: PrincipledMaterial {
                    alphaMode: PrincipledMaterial.Blend
                    baseColor: "#000000"
                    emissiveFactor: Qt.vector3d(0.5, 0.89, 0.94)
                    specularAmount: 0
                    opacity: 0.18
                    opacityChannel: Material.R
                    depthDrawMode: Material.NeverDepthDraw
                    opacityMap: Texture {
                        source: Assets.url + "textures/temple/caustics/caust00.png"
                        tilingModeHorizontal: Texture.Repeat
                        tilingModeVertical: Texture.Repeat
                        scaleU: 30
                        scaleV: 30

                        NumberAnimation on positionU {
                            loops: Animation.Infinite
                            from: 1
                            to: 0
                            duration: 29000
                        }

                        NumberAnimation on positionV {
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

                ModelParticle3D {
                    id: bubble

                    maxAmount: 200
                    color: "#b4e6f0"
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
                    enabled: !root.above
                    position: hero.position.plus(Qt.vector3d(0, 1, 0))
                    shape: ParticleShape3D {
                        type: ParticleShape3D.Sphere
                        extents: Qt.vector3d(0.4, 0.4, 0.4)
                    }
                    emitRate: 12
                    lifeSpan: 4000
                    lifeSpanVariation: 800
                    particleScale: 1
                    particleScaleVariation: 0.6
                    velocity: VectorDirection3D {
                        direction: Qt.vector3d(0, 0.8, 0)
                        directionVariation: Qt.vector3d(0.15, 0.2, 0.15)
                    }
                }

                ParticleEmitter3D {
                    particle: bubble
                    position: Qt.vector3d(-5, 0.1, -16)
                    shape: ParticleShape3D {
                        type: ParticleShape3D.Sphere
                        extents: Qt.vector3d(0.3, 0.05, 0.3)
                    }
                    emitRate: 5
                    lifeSpan: 6000
                    particleScale: 1.1
                    particleScaleVariation: 0.6
                    velocity: VectorDirection3D {
                        direction: Qt.vector3d(0, 0.8, 0)
                        directionVariation: Qt.vector3d(0.06, 0.12, 0.06)
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

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height * 0.45
        visible: !root.above
        gradient: Gradient {
            GradientStop { position: 0; color: "#2e3a9fb0" }
            GradientStop { position: 1; color: "#003a9fb0" }
        }
    }
}
