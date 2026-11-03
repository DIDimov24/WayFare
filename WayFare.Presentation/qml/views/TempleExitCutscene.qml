import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick.Timeline
import wayfare.presentation

Item {
    id: root

    readonly property int lastStage: 2
    readonly property real length: 8400
    readonly property real walkEnd: 2300
    property int stage: 0
    property bool started: false
    property bool finished: false
    property int warmFrames: 0
    property real waited: 0
    property real time: 0

    focus: true

    onStartedChanged: {
        if (root.started) {
            music.play()
        }
    }

    MediaPlayer {
        id: music
        source: Assets.url + "audio/temple_outro.ogg"
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * Math.min(1, (root.length - root.time) / 1200)
        }
    }

    function finish() {
        if (root.finished) {
            return
        }
        root.finished = true
        Level.nextLevel()
    }

    Keys.onPressed: (event) => {
        if (event.key === Qt.Key_Space || event.key === Qt.Key_Escape) {
            root.finish()
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
            if (root.time >= root.length) {
                root.finish()
            }
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

            Keyframe { frame: 0; value: Qt.vector3d(0.7, 1.8, 2.4) }
            Keyframe { frame: 2299; value: Qt.vector3d(0.7, 1.6, 0.2) }
            Keyframe { frame: 2300; value: Qt.vector3d(0.85, 0.5, -0.9) }
            Keyframe { frame: 6000; value: Qt.vector3d(0.75, 0.4, -1.3) }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 1.2, -1.6) }
            Keyframe { frame: 2299; value: Qt.vector3d(0, 1.3, -2.5) }
            Keyframe { frame: 2300; value: Qt.vector3d(0, 2.4, -2.6) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 3.2, -2.7) }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 2299; value: Qt.vector3d(0, 0, -2.3) }
            Keyframe { frame: 2300; value: Qt.vector3d(-1.22, -0.97, -2.88) }
            Keyframe { frame: 5500; value: Qt.vector3d(-1.22, 0.83, -2.88) }
        }

        KeyframeGroup {
            target: fade
            property: "opacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1000; value: 0 }
            Keyframe { frame: 5000; value: 0 }
            Keyframe { frame: 6000; value: 1 }
        }

        KeyframeGroup {
            target: title
            property: "opacity"

            Keyframe { frame: 0; value: 0 }
            Keyframe { frame: 6100; value: 0 }
            Keyframe { frame: 6700; value: 1 }
            Keyframe { frame: 7800; value: 1 }
            Keyframe { frame: 8400; value: 0 }
        }
    }

    component TempleBlock: Model {
        id: block

        property vector3d size: Qt.vector3d(1, 1, 1)
        property real top: 3

        source: "#Cube"
        scale: size.times(0.01)
        materials: TempleWallMaterial {
            wallTop: block.top
            uvScale: Qt.vector2d(block.size.x / 2, block.size.y / 2)
        }
    }

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.Color
            clearColor: "#06232a"
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            fog: Fog {
                enabled: true
                color: "#0b3a44"
                density: 0.95
                depthEnabled: true
                depthNear: 2.5
                depthFar: 22
                depthCurve: 0.8
            }
        }

        Node {
            id: focusPoint
        }

        PerspectiveCamera {
            id: camera

            lookAtNode: focusPoint
            fieldOfView: 60
            clipNear: 0.05
            clipFar: 100
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

        PointLight {
            position: Qt.vector3d(0, 2.6, -2)
            color: "#9ff4ff"
            brightness: 1.5
            quadraticFade: 600
        }

        PointLight {
            position: Qt.vector3d(0.5, 1.8, 1.5)
            color: "#7fd0dc"
            brightness: 1.2
            quadraticFade: 300
        }

        HeroModel {
            id: hero

            eulerRotation.y: root.time < root.walkEnd ? 180 : 0
            clip: root.time < root.walkEnd ? "walking" : "climbing_ladder"
            time: root.time < root.walkEnd ? root.time : root.time - root.walkEnd
        }

        Model {
            visible: root.stage >= 1
            source: "#Rectangle"
            position: Qt.vector3d(0, 0, 0.6)
            eulerRotation.x: -90
            scale: Qt.vector3d(0.02, 0.068, 1)
            materials: PrincipledMaterial {
                baseColorMap: Texture {
                    source: Assets.url + "textures/temple/floor_diffuse.jpg"
                    scaleU: 1
                    scaleV: 3.4
                }
                normalMap: Texture {
                    source: Assets.url + "textures/temple/floor_normal.jpg"
                    scaleU: 1
                    scaleV: 3.4
                }
                roughness: 1
            }
        }

        Node {
            visible: root.stage >= 2

            TempleBlock {
                position: Qt.vector3d(-1.5, 1.5, 0.6)
                size: Qt.vector3d(1, 3, 6.8)
            }

            TempleBlock {
                position: Qt.vector3d(1.5, 1.5, 0.6)
                size: Qt.vector3d(1, 3, 6.8)
            }

            TempleBlock {
                position: Qt.vector3d(0, 1.5, -3.3)
                size: Qt.vector3d(2, 3, 1)
            }

            TempleBlock {
                position: Qt.vector3d(0, 3.1, 1)
                size: Qt.vector3d(2, 0.2, 6)
                top: 100
            }

            TempleBlock {
                position: Qt.vector3d(-0.725, 3.1, -2.4)
                size: Qt.vector3d(0.55, 0.2, 0.8)
                top: 100
            }

            TempleBlock {
                position: Qt.vector3d(0.725, 3.1, -2.4)
                size: Qt.vector3d(0.55, 0.2, 0.8)
                top: 100
            }

            Model {
                source: "#Cube"
                position: Qt.vector3d(0, 4.2, -2.4)
                scale: Qt.vector3d(0.009, 0.022, 0.008)
                materials: PrincipledMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    baseColor: "#010405"
                    cullMode: Material.FrontFaceCulling
                }
            }

            LadderModel {
                position: Qt.vector3d(0, 0, -2.72)
                height: 3.2
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

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 24
        anchors.verticalCenter: bottomBar.verticalCenter
        text: "Space to skip"
        color: "#8a96a8"
        font.pixelSize: 14
        font.letterSpacing: 1
    }

    Rectangle {
        id: fade

        anchors.fill: parent
        color: "#000000"
    }

    Text {
        id: title

        anchors.centerIn: parent
        text: "The Dungeon"
        color: "#e6f4f6"
        font.pixelSize: 44
        font.weight: Font.Light
        font.letterSpacing: 2
        opacity: 0
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.finish()
    }

    LoadingCover {
        anchors.fill: parent
        loading: !root.started
    }
}
