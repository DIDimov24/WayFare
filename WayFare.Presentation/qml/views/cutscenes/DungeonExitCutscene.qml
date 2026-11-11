import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Timeline
import wayfare.presentation

Item {
    id: root

    readonly property int lastStage: 4
    readonly property real length: 12400
    readonly property real climbStart: 2030
    readonly property real barnStart: 4300
    readonly property real doorStart: 6400
    readonly property real ladderX: 0.5
    readonly property real ladderZ: -2.72
    readonly property real floorY: 4.2
    readonly property real doorX: 0.6
    readonly property bool climbing: root.started && root.time >= 1000 && root.time < root.doorStart
    readonly property bool inBarn: root.time >= root.barnStart
    property int stage: 0
    property bool started: false
    property bool finished: false
    property int warmFrames: 0
    property real waited: 0
    property real time: 0
    property real lidAngle: 0
    property real doorAngle: 0

    focus: true

    onClimbingChanged: {
        if (root.climbing) {
            ladderSound.play()
            return
        }
        ladderSound.stop()
    }

    SoundEffect {
        id: ladderSound
        source: Assets.url + "audio/ladder.wav"
        volume: 0.5 * Settings.sfxVolume / 100 * Math.max(0, Math.min(1, (root.doorStart - root.time) / 500))
    }

    function finish() {
        if (root.finished) {
            return
        }
        root.finished = true
        Level.nextLevel()
    }

    function heroClip(): string {
        if (root.time >= root.doorStart) {
            return "open_door_outwards"
        }
        if (root.time >= root.climbStart) {
            return "climbing_ladder"
        }
        return "start_climbing_ladder"
    }

    function heroTime(): real {
        if (root.time >= root.doorStart) {
            return root.time - root.doorStart
        }
        if (root.time >= root.climbStart) {
            return root.time - root.climbStart
        }
        return root.time
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

            Keyframe { frame: 0; value: Qt.vector3d(-0.3, 1.4, 2.6) }
            Keyframe { frame: 2030; value: Qt.vector3d(0.2, 1.1, 1.6) }
            Keyframe { frame: 4299; value: Qt.vector3d(0.4, 0.8, 0.7) }
            Keyframe { frame: 4300; value: Qt.vector3d(-1.3, 5, -5) }
            Keyframe { frame: 6399; value: Qt.vector3d(-1.1, 5.07, -5.14) }
            Keyframe { frame: 6400; value: Qt.vector3d(-1.8, 5.7, 1.9) }
            Keyframe { frame: 10000; value: Qt.vector3d(-1.2, 5.6, 2.6) }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 1.2, -2.6) }
            Keyframe { frame: 2030; value: Qt.vector3d(0.4, 2.4, -2.4) }
            Keyframe { frame: 4299; value: Qt.vector3d(0.5, 4, -2.3) }
            Keyframe { frame: 4300; value: Qt.vector3d(0.5, 5, -2) }
            Keyframe { frame: 6399; value: Qt.vector3d(0.5, 5.41, -1.86) }
            Keyframe { frame: 6400; value: Qt.vector3d(0.4, 5.2, 6.2) }
            Keyframe { frame: 10000; value: Qt.vector3d(0.6, 5.3, 8) }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(root.ladderX - 1.22, 0, root.ladderZ - 0.16) }
            Keyframe { frame: 2030; value: Qt.vector3d(root.ladderX - 1.22, 0, root.ladderZ - 0.16) }
            Keyframe { frame: 6399; value: Qt.vector3d(root.ladderX - 1.22, 2.458, root.ladderZ - 0.16) }
            Keyframe { frame: 6400; value: Qt.vector3d(root.doorX - 0.2, root.floorY, 5.35) }
        }

        KeyframeGroup {
            target: root
            property: "lidAngle"

            Keyframe { frame: 3800; value: 0 }
            Keyframe { frame: 4300; value: -35 }
            Keyframe { frame: 5200; value: -105; easing.type: Easing.OutQuad }
        }

        KeyframeGroup {
            target: root
            property: "doorAngle"

            Keyframe { frame: 7100; value: 0 }
            Keyframe { frame: 8100; value: -105; easing.type: Easing.OutQuad }
        }

        KeyframeGroup {
            target: hatchLight
            property: "brightness"

            Keyframe { frame: 3800; value: 0 }
            Keyframe { frame: 4300; value: 3 }
        }

        KeyframeGroup {
            target: barnLight
            property: "brightness"

            Keyframe { frame: 4299; value: 0 }
            Keyframe { frame: 4300; value: 1.4 }
        }

        KeyframeGroup {
            target: doorLight
            property: "brightness"

            Keyframe { frame: 7100; value: 0.3 }
            Keyframe { frame: 8100; value: 3 }
        }

        KeyframeGroup {
            target: moonLight
            property: "brightness"

            Keyframe { frame: 4299; value: 0 }
            Keyframe { frame: 4300; value: 0.35 }
        }

        KeyframeGroup {
            target: fade
            property: "opacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1000; value: 0 }
            Keyframe { frame: 9300; value: 0 }
            Keyframe { frame: 10000; value: 1 }
        }

        KeyframeGroup {
            target: title
            property: "opacity"

            Keyframe { frame: 0; value: 0 }
            Keyframe { frame: 10100; value: 0 }
            Keyframe { frame: 10700; value: 1 }
            Keyframe { frame: 11800; value: 1 }
            Keyframe { frame: 12400; value: 0 }
        }
    }

    component Block: Model {
        id: block

        property vector3d size: Qt.vector3d(1, 1, 1)
        property vector2d uv: Qt.vector2d(1, 1)
        property string surface: "dungeon/wall"
        property color tint: "#8c8c8c"

        source: "#Cube"
        scale: size.times(0.01)
        materials: PrincipledMaterial {
            roughness: 1
            baseColor: block.tint
            baseColorMap: Texture {
                source: Assets.url + "textures/" + block.surface + "_diffuse.jpg"
                scaleU: block.uv.x
                scaleV: block.uv.y
            }
            normalMap: Texture {
                source: Assets.url + "textures/" + block.surface + "_normal.jpg"
                scaleU: block.uv.x
                scaleV: block.uv.y
            }
        }
    }

    component Plank: Block {
        surface: "village/wall"
        tint: "#ffffff"
    }

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.Color
            clearColor: "#3a4a60"
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            fog: Fog {
                enabled: true
                color: root.inBarn ? "#3a4a60" : "#080504"
                density: root.inBarn ? 0.9 : 1
                depthEnabled: true
                depthNear: root.inBarn ? 8 : 4
                depthFar: root.inBarn ? 42 : 14
                depthCurve: 1
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
            clipFar: 120
        }

        DirectionalLight {
            id: moonLight

            eulerRotation: Qt.vector3d(-50, 200, 0)
            color: "#a9c0e0"
            ambientColor: "#1c1a1c"
            brightness: 0
        }

        PointLight {
            position: Qt.vector3d(-1.1, 2.6, -1.2)
            color: "#ffc48c"
            brightness: root.inBarn ? 0 : 2 + Math.sin(root.time * 0.013) * 0.25 + Math.sin(root.time * 0.031) * 0.12
            quadraticFade: 900
        }

        PointLight {
            position: Qt.vector3d(1.2, 2.2, 1.8)
            color: "#ffc48c"
            brightness: root.inBarn ? 0 : 1 + Math.sin(root.time * 0.017 + 1) * 0.15
            quadraticFade: 900
        }

        PointLight {
            id: hatchLight

            position: Qt.vector3d(root.ladderX, root.floorY + 0.8, -2)
            color: "#c4d8f4"
            brightness: 0
            quadraticFade: 700
        }

        PointLight {
            id: barnLight

            position: Qt.vector3d(0, 7, 0.4)
            color: "#a9c0e0"
            brightness: 0
            quadraticFade: 300
        }

        PointLight {
            id: doorLight

            position: Qt.vector3d(root.doorX, root.floorY + 1.8, 7.4)
            color: "#c4d8f4"
            brightness: 0
            quadraticFade: 500
        }

        HeroModel {
            id: hero

            clip: root.heroClip()
            time: root.heroTime()
            loop: root.time < root.doorStart
        }

        Model {
            visible: root.stage >= 1
            source: "#Rectangle"
            position: Qt.vector3d(0, 0, 0.7)
            eulerRotation.x: -90
            scale: Qt.vector3d(0.028, 0.086, 1)
            materials: PrincipledMaterial {
                roughness: 1
                baseColorMap: Texture {
                    source: Assets.url + "textures/dungeon/floor_diffuse.jpg"
                    scaleU: 1.4
                    scaleV: 4.3
                }
                normalMap: Texture {
                    source: Assets.url + "textures/dungeon/floor_normal.jpg"
                    scaleU: 1.4
                    scaleV: 4.3
                }
            }
        }

        Node {
            visible: root.stage >= 2

            Block {
                position: Qt.vector3d(-1.9, 2, 0.7)
                size: Qt.vector3d(1, 4, 8.6)
                uv: Qt.vector2d(4.3, 2)
            }

            Block {
                position: Qt.vector3d(1.9, 2, 0.7)
                size: Qt.vector3d(1, 4, 8.6)
                uv: Qt.vector2d(4.3, 2)
            }

            Block {
                position: Qt.vector3d(0, 2, -4.1)
                size: Qt.vector3d(3.8, 4, 1)
                uv: Qt.vector2d(1.9, 2)
            }

            LadderModel {
                position: Qt.vector3d(root.ladderX, 0, root.ladderZ)
                height: 2.6
            }

            LadderModel {
                position: Qt.vector3d(root.ladderX, 2.5, root.ladderZ)
                height: 2.6
            }
        }

        Node {
            visible: root.stage >= 3

            Plank {
                position: Qt.vector3d(-2.4, root.floorY - 0.1, 0.25)
                size: Qt.vector3d(4.2, 0.2, 12.5)
                uv: Qt.vector2d(2, 6)
            }

            Plank {
                position: Qt.vector3d(2.9, root.floorY - 0.1, 0.25)
                size: Qt.vector3d(3.2, 0.2, 12.5)
                uv: Qt.vector2d(1.6, 6)
            }

            Plank {
                position: Qt.vector3d(0.5, root.floorY - 0.1, -4.45)
                size: Qt.vector3d(1.6, 0.2, 3.1)
                uv: Qt.vector2d(0.8, 1.5)
            }

            Plank {
                position: Qt.vector3d(0.5, root.floorY - 0.1, 2.7)
                size: Qt.vector3d(1.6, 0.2, 7.6)
                uv: Qt.vector2d(0.8, 3.8)
            }

            Node {
                position: Qt.vector3d(root.ladderX + 0.8, root.floorY - 0.04, -2)
                eulerRotation.z: root.lidAngle

                Plank {
                    x: -0.8
                    size: Qt.vector3d(1.6, 0.08, 1.8)
                    uv: Qt.vector2d(0.8, 0.9)
                }
            }

            Plank {
                position: Qt.vector3d(-5, root.floorY + 1.8, 0.25)
                size: Qt.vector3d(1, 3.6, 13.5)
                uv: Qt.vector2d(6.7, 1.8)
            }

            Plank {
                position: Qt.vector3d(5, root.floorY + 1.8, 0.25)
                size: Qt.vector3d(1, 3.6, 13.5)
                uv: Qt.vector2d(6.7, 1.8)
            }

            Plank {
                position: Qt.vector3d(0, root.floorY + 1.8, -6.5)
                size: Qt.vector3d(9, 3.6, 1)
                uv: Qt.vector2d(4.5, 1.8)
            }

            Plank {
                position: Qt.vector3d(-2.4, root.floorY + 1.8, 6.25)
                size: Qt.vector3d(4.2, 3.6, 0.5)
                uv: Qt.vector2d(2.1, 1.8)
            }

            Plank {
                position: Qt.vector3d(3, root.floorY + 1.8, 6.25)
                size: Qt.vector3d(3, 3.6, 0.5)
                uv: Qt.vector2d(1.5, 1.8)
            }

            Plank {
                position: Qt.vector3d(root.doorX, root.floorY + 3.1, 6.25)
                size: Qt.vector3d(1.8, 1, 0.5)
                uv: Qt.vector2d(0.9, 0.5)
            }

            Plank {
                position: Qt.vector3d(0, root.floorY + 3.7, -3.25)
                size: Qt.vector3d(11, 0.2, 6.5)
                uv: Qt.vector2d(5.5, 3.25)
            }

            Plank {
                position: Qt.vector3d(0, root.floorY + 3.7, 3.85)
                size: Qt.vector3d(11, 0.2, 5.9)
                uv: Qt.vector2d(5.5, 2.95)
            }

            Node {
                position: Qt.vector3d(root.doorX - 0.9, root.floorY, 6.45)
                eulerRotation.y: root.doorAngle

                Plank {
                    position: Qt.vector3d(0.9, 1.3, 0)
                    size: Qt.vector3d(1.8, 2.6, 0.08)
                    uv: Qt.vector2d(0.9, 1.3)
                    tint: "#c9a67e"
                }
            }

            LogStackModel {
                position: Qt.vector3d(-3.3, root.floorY, 3.4)
                eulerRotation.y: 90
            }

            LogStackModel {
                position: Qt.vector3d(3.5, root.floorY, -4.5)
            }
        }

        Node {
            visible: root.stage >= 4

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, root.floorY, 26.5)
                eulerRotation.x: -90
                scale: Qt.vector3d(0.8, 0.4, 1)
                materials: PrincipledMaterial {
                    roughness: 1
                    baseColorMap: Texture {
                        source: Assets.url + "textures/village/floor_diffuse.jpg"
                        scaleU: 20
                        scaleV: 10
                    }
                }
            }

            FenceModel {
                position: Qt.vector3d(-3, root.floorY, 11)
            }

            FenceModel {
                position: Qt.vector3d(4.5, root.floorY, 12)
                eulerRotation.y: 20
                variant: 1
            }

            PineModel {
                position: Qt.vector3d(-6, root.floorY, 20)
            }

            PineModel {
                position: Qt.vector3d(5.5, root.floorY, 24)
                variant: 1
            }

            PineModel {
                position: Qt.vector3d(0.5, root.floorY, 33)
                variant: 2
            }

            ParticleSystem3D {
                running: root.started

                ModelParticle3D {
                    id: snowflake

                    maxAmount: 160
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
                    position: Qt.vector3d(root.doorX, root.floorY + 6, 12)
                    shape: ParticleShape3D {
                        type: ParticleShape3D.Cube
                        extents: Qt.vector3d(7, 0.5, 5.5)
                    }
                    emitRate: 32
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
        text: "The Snowy Village"
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
