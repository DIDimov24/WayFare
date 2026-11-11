import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Timeline
import wayfare.presentation

Cutscene {
    id: root

    readonly property real kneelAt: 5000
    readonly property real handAt: 9000
    readonly property real faceAt: 12500
    readonly property real wideAt: 18000
    property real stone: 0
    property real dawn: 0
    readonly property bool rolling: root.time >= root.length
    property bool finished: false

    lastStage: 3
    length: 26000
    heroReady: hero.ready
    title: "The End"
    titleSize: 56
    titleSpacing: 3
    hint: root.rolling ? "Space to return to the menu" : "Space to skip"

    lines: [
        { start: 900, end: 6500, text: "No. They are all here. Every one of them.", voice: "ending_1" },
        { start: 7600, end: 10700, text: "Mila. I found you.", voice: "ending_2" },
        { start: 13000, end: 17700, text: "It's alright, sweetheart. I'm not going anywhere.", voice: "ending_3" }
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
        source: Assets.url + "audio/menu_music.ogg"
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * Math.max(0, Math.min(1, (root.time - root.wideAt) / 3000))
        }
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

            Keyframe { frame: 0; value: Qt.vector3d(3.4, 1.1, -5.2) }
            Keyframe { frame: 4999; value: Qt.vector3d(2.8, 1.3, -1.6) }
            Keyframe { frame: 5000; value: Qt.vector3d(2.3, 1.1, 1.5) }
            Keyframe { frame: 8999; value: Qt.vector3d(2, 0.95, 1.3) }
            Keyframe { frame: 9000; value: Qt.vector3d(1.9, 0.9, 1.6) }
            Keyframe { frame: 12499; value: Qt.vector3d(1.7, 0.88, 1.45) }
            Keyframe { frame: 12500; value: Qt.vector3d(-0.95, 1, 1.5) }
            Keyframe { frame: 17999; value: Qt.vector3d(-0.82, 1.03, 1.36) }
            Keyframe { frame: 18000; value: Qt.vector3d(4.2, 2.6, -4.8) }
            Keyframe { frame: 25500; value: Qt.vector3d(6.4, 4.8, -8.2); easing.type: Easing.InOutSine }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 1.1, -4.6) }
            Keyframe { frame: 4999; value: Qt.vector3d(0, 1.1, 0.2) }
            Keyframe { frame: 5000; value: Qt.vector3d(0, 1.1, 0.3) }
            Keyframe { frame: 8999; value: Qt.vector3d(0, 0.75, 0.4) }
            Keyframe { frame: 9000; value: Qt.vector3d(0.05, 0.72, 0.45) }
            Keyframe { frame: 12499; value: Qt.vector3d(0.05, 0.72, 0.45) }
            Keyframe { frame: 12500; value: Qt.vector3d(0, 1.1, 0.15) }
            Keyframe { frame: 17999; value: Qt.vector3d(0, 1.1, 0.15) }
            Keyframe { frame: 18000; value: Qt.vector3d(-0.1, 0.7, 0.6) }
            Keyframe { frame: 25500; value: Qt.vector3d(-0.4, 0.5, 1.6); easing.type: Easing.InOutSine }
        }

        KeyframeGroup {
            target: camera
            property: "fieldOfView"

            Keyframe { frame: 0; value: 50 }
            Keyframe { frame: 4999; value: 50 }
            Keyframe { frame: 5000; value: 42 }
            Keyframe { frame: 8999; value: 40 }
            Keyframe { frame: 9000; value: 34 }
            Keyframe { frame: 12499; value: 31 }
            Keyframe { frame: 12500; value: 32 }
            Keyframe { frame: 17999; value: 30 }
            Keyframe { frame: 18000; value: 50 }
            Keyframe { frame: 25500; value: 50 }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 0, -5) }
            Keyframe { frame: 5000; value: Qt.vector3d(0, 0, 0) }
        }

        KeyframeGroup {
            target: root
            property: "stone"

            Keyframe { frame: 11000; value: 0 }
            Keyframe { frame: 17500; value: 1 }
        }

        KeyframeGroup {
            target: root
            property: "dawn"

            Keyframe { frame: 18000; value: 0 }
            Keyframe { frame: 24500; value: 1 }
        }

        KeyframeGroup {
            target: root
            property: "fadeOpacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1500; value: 0 }
            Keyframe { frame: 24300; value: 0 }
            Keyframe { frame: 25500; value: 1 }
        }

        KeyframeGroup {
            target: root
            property: "titleOpacity"

            Keyframe { frame: 0; value: 0 }
            Keyframe { frame: 20500; value: 0 }
            Keyframe { frame: 21700; value: 1 }
            Keyframe { frame: 24300; value: 1 }
            Keyframe { frame: 25300; value: 0 }
        }
    }

    component Pair: Node {
        id: pair

        property string kind: "kneel"
        property real gap: 1

        StatueModel {
            kind: pair.kind
        }

        StatueModel {
            z: pair.gap
            eulerRotation.y: 180
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

            visible: root.stone < 1
            clip: root.time < root.kneelAt ? "walking" : "reach_hand"
            time: root.time < root.kneelAt ? root.time : root.time - root.kneelAt
            loop: root.time < root.kneelAt
            stone: root.stone
        }

        StatueModel {
            visible: found && root.stone > 0
            fade: root.stone
            grow: 1.015
            kind: "hold"
        }

        StatueModel {
            position: Qt.vector3d(0.02, 0, 0.86)
            eulerRotation.y: 180
        }

        Node {
            visible: root.stage >= 2

            Pair {
                position: Qt.vector3d(-2.4, 0, -3.6)
                eulerRotation.y: 70
                kind: "kneel"
                gap: 0.9
            }

            Pair {
                position: Qt.vector3d(3.6, 0, -2.6)
                eulerRotation.y: -110
                kind: "reach"
                gap: 0.8
            }

            Pair {
                position: Qt.vector3d(-3.1, 0, 0.9)
                eulerRotation.y: 30
                kind: "hold"
                gap: 1.02
            }

            Pair {
                position: Qt.vector3d(2.9, 0, 3.4)
                eulerRotation.y: -150
                kind: "look"
                gap: 0.7
            }

            Pair {
                position: Qt.vector3d(-1.6, 0, 5.2)
                eulerRotation.y: 160
                kind: "kneel"
                gap: 0.9
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
