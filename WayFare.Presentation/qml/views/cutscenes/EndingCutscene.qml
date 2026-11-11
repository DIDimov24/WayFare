import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Timeline
import wayfare.presentation

Item {
    id: root

    readonly property int lastStage: 3
    readonly property real length: 11500
    readonly property real kneelStart: 900
    readonly property bool rolling: root.time >= root.length
    property int stage: 0
    property bool started: false
    property bool finished: false
    property int warmFrames: 0
    property real waited: 0
    property real time: 0

    focus: true

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

    Keys.onPressed: (event) => {
        if (event.key === Qt.Key_Space || event.key === Qt.Key_Escape) {
            root.skip()
        }
    }

    MediaPlayer {
        id: music
        source: Assets.url + "audio/menu_music.ogg"
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * Math.min(1, root.time / 3000)
        }
    }

    onStartedChanged: {
        if (root.started) {
            music.play()
        }
    }

    Connections {
        target: root.Window.window
        enabled: !root.started

        function onAfterAnimating() {
            if (root.stage < root.lastStage) {
                root.stage++
                return
            }
            if (hero.ready) {
                root.warmFrames++
            }
            if (root.warmFrames >= 10) {
                root.started = true
            }
        }
    }

    Timer {
        interval: 100
        repeat: true
        running: !root.started

        onTriggered: {
            root.waited = root.waited + 100
            if (root.waited >= 60000) {
                root.started = true
            }
        }
    }

    FrameAnimation {
        running: root.started && root.time < root.length

        onTriggered: {
            root.time = Math.min(root.length, root.time + Math.min(frameTime, 0.05) * 1000)
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

            Keyframe { frame: 0; value: Qt.vector3d(2.2, 1.3, -2.6) }
            Keyframe { frame: 10500; value: Qt.vector3d(4.6, 3.6, -6.8); easing.type: Easing.InOutSine }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 0.9, 1) }
            Keyframe { frame: 10500; value: Qt.vector3d(-0.4, 0.6, 2.4); easing.type: Easing.InOutSine }
        }

        KeyframeGroup {
            target: fade
            property: "opacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1500; value: 0 }
            Keyframe { frame: 9800; value: 0 }
            Keyframe { frame: 11000; value: 1 }
        }

        KeyframeGroup {
            target: title
            property: "opacity"

            Keyframe { frame: 0; value: 0 }
            Keyframe { frame: 5200; value: 0 }
            Keyframe { frame: 6400; value: 1 }
            Keyframe { frame: 9600; value: 1 }
            Keyframe { frame: 10800; value: 0 }
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

        PointLight {
            position: Qt.vector3d(-2.5, 2.2, 1.5)
            color: "#ffb870"
            brightness: 1.6 + Math.sin(root.time * 0.013) * 0.2 + Math.sin(root.time * 0.031) * 0.1
            quadraticFade: 600
        }

        HeroModel {
            id: hero

            clip: "kneeling_down"
            time: Math.max(0, root.time - root.kneelStart)
            loop: false
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

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height * 0.11
        color: "#000000"
    }

    Rectangle {
        id: bottomBar

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height * 0.11
        color: "#000000"
    }

    Rectangle {
        id: fade

        anchors.fill: parent
        color: "#000000"
    }

    Text {
        id: title

        anchors.centerIn: parent
        text: "The End"
        color: "#e6f4f6"
        font.pixelSize: 56
        font.weight: Font.Light
        font.letterSpacing: 3
        opacity: 0
    }

    CreditsRoll {
        anchors.fill: parent
        running: root.rolling
        onFinished: root.finish()
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 24
        anchors.verticalCenter: bottomBar.verticalCenter
        text: root.rolling ? "Space to return to the menu" : "Space to skip"
        color: "#8a96a8"
        font.pixelSize: 14
        font.letterSpacing: 1
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.skip()
    }

    LoadingCover {
        anchors.fill: parent
        loading: !root.started
    }
}
