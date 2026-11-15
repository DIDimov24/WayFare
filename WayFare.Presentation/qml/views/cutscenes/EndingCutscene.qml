import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Timeline
import wayfare.presentation

Cutscene {
    id: root

    readonly property real kneelAt: 7000
    readonly property real handAt: 11000
    readonly property real faceAt: 14500
    readonly property real wideAt: 20000
    property real stone: 0
    readonly property bool petrifying: root.started && root.time >= 13000
    property real dawn: 0
    readonly property bool rolling: root.time >= root.length
    property bool finished: false

    lastStage: 4
    length: 28000
    shots: [0, 7100, 11100, 14600, 20100, 24500]
    heroReady: hero.ready
    title: "The End"
    titleSize: 56
    titleSpacing: 3
    hint: root.rolling ? "Space to return to the menu" : "Space to skip"

    lines: [
        { start: 900, end: 6500, text: "No. They are all here. Every one of them.", voice: "ending_1" },
        { start: 9600, end: 12700, text: "Mila. I found you.", voice: "ending_2" },
        { start: 15000, end: 19700, text: "It's alright, sweetheart. I'm not going anywhere.", voice: "ending_3" }
    ]

    onSkipRequested: root.skip()

    function skip() {
        if (!root.started) {
            return
        }
        if (!root.rolling) {
            root.time = root.length
            return
        }
        root.finish()
    }

    function finish() {
        if (root.finished) {
            return
        }
        root.finished = true
        music.stop()
        Level.quitToMenu()
    }

    MediaPlayer {
        id: music
        source: Assets.url + "audio/ending_music.ogg"
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * Math.max(0, Math.min(1, (root.time - root.kneelAt) / 3000))
        }
    }

    onPetrifyingChanged: {
        if (root.petrifying) {
            stoneSound.play()
            crackSound.restart()
        }
    }

    SoundEffect {
        id: stoneSound
        source: Assets.url + "audio/troll_stone.wav"
        volume: Settings.sfxVolume / 100
    }

    Timer {
        id: crackSound
        interval: 4500
        onTriggered: stoneSound.play()
    }

    onStartedChanged: {
        if (root.started) {
            music.play()
        }
    }

    Timeline {
        startFrame: 0
        endFrame: root.length
        currentFrame: root.time
        enabled: true

        KeyframeGroup {
            target: camera
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(3, 1.5, -13.5) }
            Keyframe { frame: 6999; value: Qt.vector3d(2.6, 1.3, -1.6) }
            Keyframe { frame: 7000; value: Qt.vector3d(2.3, 1.1, 1.5) }
            Keyframe { frame: 10999; value: Qt.vector3d(2, 0.95, 1.3) }
            Keyframe { frame: 11000; value: Qt.vector3d(1.3, 0.55, 0.6) }
            Keyframe { frame: 14499; value: Qt.vector3d(1.2, 0.55, 0.55) }
            Keyframe { frame: 14500; value: Qt.vector3d(-0.95, 1, 1.5) }
            Keyframe { frame: 19999; value: Qt.vector3d(-0.82, 1.03, 1.36) }
            Keyframe { frame: 20000; value: Qt.vector3d(2.2, 0.9, 1.2) }
            Keyframe { frame: 27500; value: Qt.vector3d(6.5, 4.6, 7.5); easing.type: Easing.InOutSine }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 1.1, -17) }
            Keyframe { frame: 6999; value: Qt.vector3d(0, 1.1, -0.3) }
            Keyframe { frame: 7000; value: Qt.vector3d(0, 1.1, 0.3) }
            Keyframe { frame: 10999; value: Qt.vector3d(0, 0.75, 0.4) }
            Keyframe { frame: 11000; value: Qt.vector3d(0.05, 0.4, 0.6) }
            Keyframe { frame: 14499; value: Qt.vector3d(0.05, 0.4, 0.6) }
            Keyframe { frame: 14500; value: Qt.vector3d(0, 0.85, 0.15) }
            Keyframe { frame: 19999; value: Qt.vector3d(0, 0.85, 0.15) }
            Keyframe { frame: 20000; value: Qt.vector3d(0, 0.55, 0.45) }
            Keyframe { frame: 27500; value: Qt.vector3d(-0.2, 0.6, -0.5); easing.type: Easing.InOutSine }
        }

        KeyframeGroup {
            target: camera
            property: "fieldOfView"

            Keyframe { frame: 0; value: 50 }
            Keyframe { frame: 6999; value: 50 }
            Keyframe { frame: 7000; value: 42 }
            Keyframe { frame: 10999; value: 40 }
            Keyframe { frame: 11000; value: 34 }
            Keyframe { frame: 14499; value: 31 }
            Keyframe { frame: 14500; value: 32 }
            Keyframe { frame: 19999; value: 30 }
            Keyframe { frame: 20000; value: 45 }
            Keyframe { frame: 27500; value: 55 }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 0, -18) }
            Keyframe { frame: 6999; value: Qt.vector3d(0, 0, -0.3) }
            Keyframe { frame: 7000; value: Qt.vector3d(0, 0, 0) }
        }

        KeyframeGroup {
            target: root
            property: "stone"

            Keyframe { frame: 13000; value: 0 }
            Keyframe { frame: 24000; value: 1; easing.type: Easing.InOutQuad }
        }

        KeyframeGroup {
            target: root
            property: "dawn"

            Keyframe { frame: 20000; value: 0 }
            Keyframe { frame: 26500; value: 1 }
        }

        KeyframeGroup {
            target: root
            property: "fadeOpacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1500; value: 0 }
            Keyframe { frame: 26300; value: 0 }
            Keyframe { frame: 27500; value: 1 }
        }

        KeyframeGroup {
            target: root
            property: "titleOpacity"

            Keyframe { frame: 0; value: 0 }
            Keyframe { frame: 22500; value: 0 }
            Keyframe { frame: 23700; value: 1 }
            Keyframe { frame: 26300; value: 1 }
            Keyframe { frame: 27300; value: 0 }
        }
    }

    component StatueField: Repeater3D {
        delegate: StoneStatueModel {
            required property var modelData

            variant: modelData.v
            size: modelData.s
            position: Qt.vector3d(modelData.x, modelData.lift - modelData.sink, modelData.z)
            eulerRotation: Qt.vector3d(modelData.tilt, modelData.yaw, modelData.tip)
        }
    }

    View3D {
        anchors.fill: parent
        visible: !root.rolling

        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.Color
            clearColor: "#2a3342"
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            fog: Fog {
                enabled: true
                color: "#2a3342"
                density: 0.9
                depthEnabled: true
                depthNear: 6
                depthFar: 34
                depthCurve: 1
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
            clipFar: 120
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-40, 210, 0)
            color: "#a9bbdc"
            brightness: 1.1
            ambientColor: "#364256"
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-12, 60, 0)
            color: "#ffc9a0"
            brightness: root.dawn * 0.9
        }

        HeroModel {
            id: hero

            clip: root.time < root.kneelAt ? "running" : "kneeling_down"
            time: root.time < root.kneelAt ? root.time : root.time - root.kneelAt
            loop: root.time < root.kneelAt
            mitten: true
            stone: root.stone
        }

        StatueModel {
            position: Qt.vector3d(0.02, 0, 0.86)
            eulerRotation.y: 180
        }

        MittenModel {
            id: milaMitten

            upsideDown: true
            stone: true
            position: Qt.vector3d(0.22, 0.29, 0.71)
            eulerRotation: Qt.vector3d(180, -90, 0)
            scale: Qt.vector3d(0.7, 0.7, 0.7)
        }

        StatueField {
            visible: root.stage >= 2
            model: [
                    { v: "shield", x: -9.08, z: 0.02, yaw: 92, s: 0.76, tilt: 16, tip: 0, lift: 0.00, sink: 0.15 },
                    { v: "reach", x: 3.92, z: 3.44, yaw: -115, s: 0.80, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                    { v: "shield", x: -3.16, z: -4.72, yaw: 27, s: 0.82, tilt: -14, tip: 0, lift: 0.00, sink: 0.10 },
                    { v: "reach", x: 3.12, z: -3.26, yaw: -11, s: 0.74, tilt: 17, tip: 0, lift: 0.00, sink: 0.08 },
                    { v: "shield", x: 8.79, z: 0.22, yaw: -113, s: 0.80, tilt: 18, tip: 0, lift: 0.00, sink: 0.18 },
                    { v: "stand", x: -1.66, z: -11.06, yaw: 2, s: 0.88, tilt: 14, tip: 0, lift: 0.00, sink: 0.15 },
                    { v: "bend", x: -3.16, z: 0.12, yaw: 66, s: 0.80, tilt: -14, tip: 0, lift: 0.00, sink: 0.17 },
                    { v: "reach", x: 5.66, z: -1.78, yaw: -52, s: 0.83, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                    { v: "shield", x: 3.11, z: -6.37, yaw: -20, s: 0.84, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                    { v: "reach", x: -8.32, z: 3.38, yaw: 143, s: 0.42, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                    { v: "stand", x: 8.12, z: 4.76, yaw: -143, s: 0.43, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                    { v: "stand", x: 7.40, z: -6.23, yaw: -63, s: 0.45, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                    { v: "kneel", x: 6.77, z: 8.14, yaw: -149, s: 0.43, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 }
            ]
        }

        Node {
            visible: root.stage >= 4

            StatueField {
                model: [
                        { v: "recoil", x: 12.11, z: -4.41, yaw: -95, s: 0.41, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "kneel", x: 5.60, z: 0.64, yaw: -87, s: 0.44, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "recoil", x: 2.01, z: -11.48, yaw: -7, s: 0.42, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "sit", x: 8.42, z: -3.15, yaw: -64, s: 0.60, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "bend", x: -7.34, z: 0.99, yaw: 64, s: 0.80, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "bend", x: 3.77, z: 0.17, yaw: -101, s: 0.73, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "bend", x: 9.62, z: 1.98, yaw: -129, s: 0.72, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "lying", x: 5.85, z: -11.97, yaw: -23, s: 0.69, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "lying", x: -10.02, z: -7.38, yaw: 38, s: 0.83, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "lying", x: -5.09, z: -0.47, yaw: 108, s: 0.73, tilt: 0, tip: 0, lift: 0.00, sink: 0.00 },
                        { v: "recoil", x: -2.96, z: 9.20, yaw: 146, s: 0.65, tilt: 0, tip: -82, lift: 0.32, sink: 0.00 },
                        { v: "reach", x: 10.72, z: -2.91, yaw: -52, s: 0.83, tilt: 0, tip: -82, lift: 0.42, sink: 0.00 },
                        { v: "recoil", x: -9.78, z: 1.70, yaw: 82, s: 0.78, tilt: 0, tip: -82, lift: 0.39, sink: 0.00 }
                ]
            }

            Repeater3D {
                model: [
                        Qt.vector4d(-8.52, -0.01, 0.11, 55), Qt.vector4d(-10.0, 0.16, 0.08, 316), Qt.vector4d(-8.7, 0.14, 0.1, 277),
                        Qt.vector4d(-8.83, -0.85, 0.09, 50), Qt.vector4d(-2.67, -4.08, 0.08, 232), Qt.vector4d(-3.57, -4.11, 0.14, 256),
                        Qt.vector4d(-3.14, -5.34, 0.15, 93), Qt.vector4d(-3.49, -4.32, 0.08, 192), Qt.vector4d(-2.93, -5.47, 0.16, 65),
                        Qt.vector4d(-3.07, -5.35, 0.12, 87), Qt.vector4d(-3.03, -5.25, 0.16, 23), Qt.vector4d(2.8, -3.5, 0.1, 220),
                        Qt.vector4d(3.76, -3.41, 0.09, 317), Qt.vector4d(3.31, -4.24, 0.18, 219), Qt.vector4d(2.51, -3.72, 0.08, 196),
                        Qt.vector4d(2.75, -3.65, 0.16, 20), Qt.vector4d(2.81, -3.93, 0.2, 107), Qt.vector4d(3.67, -3.31, 0.08, 143),
                        Qt.vector4d(8.18, -0.28, 0.11, 258), Qt.vector4d(8.42, -0.58, 0.19, 114), Qt.vector4d(9.33, 0.59, 0.19, 262),
                        Qt.vector4d(8.57, -0.13, 0.17, 356), Qt.vector4d(9.18, -0.18, 0.12, 227), Qt.vector4d(8.36, 0.58, 0.17, 325),
                        Qt.vector4d(-1.51, -10.56, 0.09, 115), Qt.vector4d(-1.04, -11.82, 0.1, 339), Qt.vector4d(-2.07, -11.15, 0.15, 46),
                        Qt.vector4d(-2.18, -10.55, 0.09, 349), Qt.vector4d(-1.23, -10.7, 0.15, 279), Qt.vector4d(-2.11, -10.79, 0.1, 148),
                        Qt.vector4d(-2.59, 0.08, 0.19, 113), Qt.vector4d(-3.48, -0.76, 0.09, 224), Qt.vector4d(-2.83, 0.45, 0.09, 64),
                        Qt.vector4d(-2.81, -0.29, 0.12, 231), Qt.vector4d(-2.97, 0.71, 0.15, 338), Qt.vector4d(5.31, -12.47, 0.1, 6),
                        Qt.vector4d(5.52, -11.79, 0.11, 157), Qt.vector4d(5.32, -11.63, 0.1, 356), Qt.vector4d(5.61, -11.66, 0.16, 256),
                        Qt.vector4d(5.42, -11.17, 0.15, 345), Qt.vector4d(-9.78, -7.02, 0.18, 274), Qt.vector4d(-10.21, -6.98, 0.16, 200),
                        Qt.vector4d(-10.3, -7.8, 0.17, 41), Qt.vector4d(-10.67, -6.95, 0.14, 189), Qt.vector4d(-10.52, -7.85, 0.19, 247),
                        Qt.vector4d(-9.76, -6.43, 0.18, 337), Qt.vector4d(-5.36, 0.27, 0.18, 282), Qt.vector4d(-5.68, -0.48, 0.2, 6),
                        Qt.vector4d(-5.87, -0.38, 0.08, 149), Qt.vector4d(-5.11, 0.11, 0.17, 247), Qt.vector4d(-5.63, -0.91, 0.13, 246),
                        Qt.vector4d(-5.48, -0.38, 0.17, 299), Qt.vector4d(-4.62, -0.82, 0.1, 77), Qt.vector4d(-2.54, 8.36, 0.16, 332),
                        Qt.vector4d(-2.48, 10.03, 0.12, 17), Qt.vector4d(-3.06, 8.45, 0.18, 187), Qt.vector4d(-2.4, 9.7, 0.13, 225),
                        Qt.vector4d(-10.26, 0.86, 0.12, 142), Qt.vector4d(-10.62, 1.75, 0.12, 189), Qt.vector4d(-9.55, 1.2, 0.18, 69),
                        Qt.vector4d(-10.09, 2.05, 0.15, 226), Qt.vector4d(-10.31, 1.66, 0.11, 152), Qt.vector4d(-10.29, 1.57, 0.16, 283),
                        Qt.vector4d(-9.45, 2.38, 0.12, 4)
                ]

                delegate: Model {
                    required property vector4d modelData

                    source: "#Cube"
                    position: Qt.vector3d(modelData.x, modelData.z * 0.35, modelData.y)
                    eulerRotation: Qt.vector3d(modelData.w * 0.4, modelData.w, modelData.w * 0.25)
                    scale: Qt.vector3d(modelData.z * 0.011, modelData.z * 0.008, modelData.z * 0.009)
                    materials: PrincipledMaterial {
                        baseColor: "#84878d"
                        roughness: 0.95
                    }
                }
            }
        }

        Model {
            visible: root.stage >= 1
            source: "#Rectangle"
            eulerRotation.x: -90
            scale: Qt.vector3d(0.8, 0.8, 1)
            materials: PrincipledMaterial {
                roughness: 1
                baseColorMap: Texture {
                    source: Assets.url + "textures/village/floor_diffuse.jpg"
                    scaleU: 20
                    scaleV: 20
                }
            }
        }

        Node {
            visible: root.stage >= 2

            PineModel {
                position: Qt.vector3d(-7, 0, 9)
            }

            PineModel {
                position: Qt.vector3d(3.5, 0, 12)
                variant: 1
            }

            PineModel {
                position: Qt.vector3d(-12, 0, 2)
                variant: 2
            }

            PineModel {
                position: Qt.vector3d(9, 0, 6)
                variant: 3
            }

            PineModel {
                position: Qt.vector3d(-4, 0, 16)
                variant: 3
            }

            RockModel {
                position: Qt.vector3d(1.8, 0, 4.5)
                eulerRotation.y: 40
            }

            RockModel {
                position: Qt.vector3d(-5, 0, 5.5)
                eulerRotation.y: 200
                variant: 1
            }

            FenceModel {
                position: Qt.vector3d(5, 0, 2)
                eulerRotation.y: 70
            }

            StumpModel {
                position: Qt.vector3d(-3.2, 0, -1.5)
                scale: Qt.vector3d(1.4, 1.4, 1.4)
            }
        }

        ParticleSystem3D {
            visible: root.stage >= 3
            running: root.started

            ModelParticle3D {
                id: snowflake

                maxAmount: 220
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
                position: Qt.vector3d(0, 6, 1)
                shape: ParticleShape3D {
                    type: ParticleShape3D.Cube
                    extents: Qt.vector3d(8, 0.5, 8)
                }
                emitRate: 45
                lifeSpan: 4800
                particleScale: 1
                particleScaleVariation: 0.5
                velocity: VectorDirection3D {
                    direction: Qt.vector3d(0.15, -1.25, 0)
                    directionVariation: Qt.vector3d(0.15, 0.2, 0.15)
                }
            }
        }
    }

    overlay: CreditsRoll {
        anchors.fill: parent
        running: root.rolling
        onFinished: root.finish()
    }
}
