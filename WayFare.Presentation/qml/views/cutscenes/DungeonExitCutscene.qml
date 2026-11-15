import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Timeline
import wayfare.presentation

Cutscene {
    id: root

    readonly property real caveStart: 4300
    readonly property real caveClimbAt: 11300
    readonly property real barnStart: 13500
    readonly property real standAt: 16100
    readonly property real doorStart: 21100
    readonly property real caveX: 60
    readonly property real ladderX: 0.5
    readonly property real ladderZ: -2.72
    readonly property real floorY: 4.2
    readonly property real doorX: 0.6
    readonly property bool climbing: root.started && ((root.time >= 1000 && root.time < root.caveStart) || (root.time >= root.caveClimbAt && root.time < root.standAt))
    readonly property bool inBarn: root.time >= root.barnStart
    readonly property bool inCave: root.time >= root.caveStart && root.time < root.barnStart
    property bool finished: false
    property real lidAngle: 0
    property real doorAngle: 0

    lastStage: 5
    length: 28000
    lines: [
        { start: 5600, end: 10200, text: "What were those things down there? They moved like people.", voice: "station_1" },
        { start: 16600, end: 20900, text: "A statue, all the way out here? Who would carve a face that frightened?", voice: "dungeon_1" },
        { start: 21500, end: 24700, text: "Nobody has lived here for a long time.", voice: "village_1" }
    ]
    heroReady: hero.ready
    title: "The Snowy Village"

    onSkipRequested: root.finish()
    onEnded: root.finish()

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
        volume: 0.5 * Settings.sfxVolume / 100 * Math.max(0, Math.min(1, ((root.time < root.caveStart ? root.caveStart : root.standAt) - root.time) / 500))
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
        if (root.time >= root.standAt) {
            return "looking_around"
        }
        if (root.time >= root.barnStart) {
            return "climbing_ladder"
        }
        if (root.time >= root.caveClimbAt) {
            return "start_climbing_ladder"
        }
        if (root.time >= root.caveStart) {
            return "walking"
        }
        return "climbing_ladder"
    }

    function heroTime(): real {
        if (root.time >= root.doorStart) {
            return root.time - root.doorStart
        }
        if (root.time >= root.standAt) {
            return root.time - root.standAt
        }
        if (root.time >= root.barnStart) {
            return root.time - root.barnStart
        }
        if (root.time >= root.caveClimbAt) {
            return root.time - root.caveClimbAt
        }
        if (root.time >= root.caveStart) {
            return root.time - root.caveStart
        }
        return root.time
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
            Keyframe { frame: 4300; value: Qt.vector3d(root.caveX + 1, 0.7, -1) }
            Keyframe { frame: 7799; value: Qt.vector3d(root.caveX + 0.8, 0.8, -1.2) }
            Keyframe { frame: 7800; value: Qt.vector3d(root.caveX - 0.6, 0.6, 5.6) }
            Keyframe { frame: 11299; value: Qt.vector3d(root.caveX - 0.4, 1.1, 1.6) }
            Keyframe { frame: 11300; value: Qt.vector3d(root.caveX + 0.9, 1.2, 0.8) }
            Keyframe { frame: 13499; value: Qt.vector3d(root.caveX + 0.8, 1.1, 0.2) }
            Keyframe { frame: 13500; value: Qt.vector3d(-1.3, 5, -5) }
            Keyframe { frame: 16099; value: Qt.vector3d(-1.1, 5.07, -5.14) }
            Keyframe { frame: 16100; value: Qt.vector3d(0.9, 5.75, 2.3) }
            Keyframe { frame: 21099; value: Qt.vector3d(0.7, 5.7, 1.8) }
            Keyframe { frame: 21100; value: Qt.vector3d(-1.8, 5.7, 1.9) }
            Keyframe { frame: 23399; value: Qt.vector3d(-1.2, 5.6, 2.6) }
            Keyframe { frame: 23400; value: Qt.vector3d(1.25, 5.45, 14.6) }
            Keyframe { frame: 25500; value: Qt.vector3d(1.15, 5.42, 14.4) }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 1.2, -2.6) }
            Keyframe { frame: 2030; value: Qt.vector3d(0.4, 2.4, -2.4) }
            Keyframe { frame: 4299; value: Qt.vector3d(0.5, 4, -2.3) }
            Keyframe { frame: 4300; value: Qt.vector3d(root.caveX + 0.5, 0.3, 5.5) }
            Keyframe { frame: 7799; value: Qt.vector3d(root.caveX + 0.5, 0.8, 2.4) }
            Keyframe { frame: 7800; value: Qt.vector3d(root.caveX + 0.5, 1.4, -2.7) }
            Keyframe { frame: 11299; value: Qt.vector3d(root.caveX + 0.5, 1.4, -2.7) }
            Keyframe { frame: 11300; value: Qt.vector3d(root.caveX + 0.5, 1.4, -2.6) }
            Keyframe { frame: 13499; value: Qt.vector3d(root.caveX + 0.5, 2.6, -2.5) }
            Keyframe { frame: 13500; value: Qt.vector3d(0.5, 5, -2) }
            Keyframe { frame: 16099; value: Qt.vector3d(0.5, 5.41, -1.86) }
            Keyframe { frame: 16100; value: Qt.vector3d(0.4, 5.55, -0.3) }
            Keyframe { frame: 21099; value: Qt.vector3d(0.4, 5.55, -0.3) }
            Keyframe { frame: 21100; value: Qt.vector3d(0.4, 5.2, 6.2) }
            Keyframe { frame: 23399; value: Qt.vector3d(0.6, 5.3, 8) }
            Keyframe { frame: 23400; value: Qt.vector3d(0.7, 5, 10.4) }
            Keyframe { frame: 25500; value: Qt.vector3d(0.65, 5, 10) }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(root.ladderX - 1.22, -0.5, root.ladderZ - 0.16) }
            Keyframe { frame: 4299; value: Qt.vector3d(root.ladderX - 1.22, 1.0, root.ladderZ - 0.16) }
            Keyframe { frame: 4300; value: Qt.vector3d(root.caveX + 0.5, -0.9, 6) }
            Keyframe { frame: 11299; value: Qt.vector3d(root.caveX + 0.5, 0, -1.6) }
            Keyframe { frame: 11300; value: Qt.vector3d(root.caveX + root.ladderX - 1.22, 0, root.ladderZ - 0.16) }
            Keyframe { frame: 13499; value: Qt.vector3d(root.caveX + root.ladderX - 1.22, 0, root.ladderZ - 0.16) }
            Keyframe { frame: 13500; value: Qt.vector3d(root.ladderX - 1.22, 1.277, root.ladderZ - 0.16) }
            Keyframe { frame: 16099; value: Qt.vector3d(root.ladderX - 1.22, 2.5, root.ladderZ - 0.16) }
            Keyframe { frame: 16100; value: Qt.vector3d(0.4, root.floorY, -0.3) }
            Keyframe { frame: 21099; value: Qt.vector3d(0.4, root.floorY, -0.3) }
            Keyframe { frame: 21100; value: Qt.vector3d(root.doorX - 0.2, root.floorY, 5.35) }
        }

        KeyframeGroup {
            target: root
            property: "lidAngle"

            Keyframe { frame: 3800; value: 0 }
            Keyframe { frame: 4299; value: -60 }
            Keyframe { frame: 4300; value: 0 }
            Keyframe { frame: 13000; value: 0 }
            Keyframe { frame: 13500; value: -35 }
            Keyframe { frame: 14400; value: -105; easing.type: Easing.OutQuad }
        }

        KeyframeGroup {
            target: root
            property: "doorAngle"

            Keyframe { frame: 21800; value: 0 }
            Keyframe { frame: 22800; value: -105; easing.type: Easing.OutQuad }
        }

        KeyframeGroup {
            target: hatchLight
            property: "brightness"

            Keyframe { frame: 3800; value: 0 }
            Keyframe { frame: 4299; value: 2 }
            Keyframe { frame: 4300; value: 0 }
            Keyframe { frame: 13000; value: 0 }
            Keyframe { frame: 13500; value: 3 }
        }

        KeyframeGroup {
            target: barnLight
            property: "brightness"

            Keyframe { frame: 13499; value: 0 }
            Keyframe { frame: 13500; value: 1.4 }
        }

        KeyframeGroup {
            target: doorLight
            property: "brightness"

            Keyframe { frame: 21800; value: 0.3 }
            Keyframe { frame: 22800; value: 3 }
        }

        KeyframeGroup {
            target: moonLight
            property: "brightness"

            Keyframe { frame: 13499; value: 0 }
            Keyframe { frame: 13500; value: 0.35 }
        }

        KeyframeGroup {
            target: root
            property: "fadeOpacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1000; value: 0 }
            Keyframe { frame: 3800; value: 0 }
            Keyframe { frame: 4299; value: 1 }
            Keyframe { frame: 4300; value: 1 }
            Keyframe { frame: 4900; value: 0 }
            Keyframe { frame: 24800; value: 0 }
            Keyframe { frame: 25500; value: 1 }
        }

        KeyframeGroup {
            target: root
            property: "titleOpacity"

            Keyframe { frame: 0; value: 0 }
            Keyframe { frame: 25600; value: 0 }
            Keyframe { frame: 26200; value: 1 }
            Keyframe { frame: 27400; value: 1 }
            Keyframe { frame: 28000; value: 0 }
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
            clearColor: root.inBarn ? "#3a4a60" : "#060504"
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

        PointLight {
            position: Qt.vector3d(root.caveX - 1.4, 1.8, 3.4)
            color: "#ff9a4a"
            brightness: root.inCave ? 1.2 + Math.sin(root.time * 0.012) * 0.15 : 0
            quadraticFade: 500
        }

        PointLight {
            position: Qt.vector3d(root.caveX + 1.4, 2, -1.2)
            color: "#ff9a4a"
            brightness: root.inCave ? 1.1 + Math.sin(root.time * 0.019 + 2) * 0.12 : 0
            quadraticFade: 500
        }

        PointLight {
            position: Qt.vector3d(root.caveX + root.ladderX, 3.3, root.ladderZ)
            color: "#c4d8f4"
            brightness: root.inCave ? 2.2 : 0
            quadraticFade: 600
        }

        HeroModel {
            id: hero

            eulerRotation.y: root.time >= root.caveStart && root.time < root.caveClimbAt ? 180 : 0
            clip: root.heroClip()
            time: root.heroTime()
            loop: root.time < root.doorStart && (root.time < root.caveClimbAt || root.time >= root.barnStart)
        }

        Model {
            visible: root.stage >= 1 && root.time < root.caveStart
            source: "#Rectangle"
            position: Qt.vector3d(root.ladderX, 0, 1.1)
            eulerRotation.x: -90
            scale: Qt.vector3d(0.02, 0.078, 1)
            materials: PrincipledMaterial {
                roughness: 1
                baseColorMap: Texture {
                    source: Assets.url + "textures/dungeon/floor_diffuse.jpg"
                    scaleU: 1
                    scaleV: 3.9
                }
                normalMap: Texture {
                    source: Assets.url + "textures/dungeon/floor_normal.jpg"
                    scaleU: 1
                    scaleV: 3.9
                }
            }
        }

        Node {
            visible: root.stage >= 2 && root.time < root.caveStart

            Block {
                position: Qt.vector3d(root.ladderX - 1.5, 3.75, 1.1)
                size: Qt.vector3d(1, 7.5, 7.8)
                uv: Qt.vector2d(3.9, 3.75)
            }

            Block {
                position: Qt.vector3d(root.ladderX + 1.5, 3.75, 1.1)
                size: Qt.vector3d(1, 7.5, 7.8)
                uv: Qt.vector2d(3.9, 3.75)
            }

            Block {
                position: Qt.vector3d(root.ladderX, 3.75, -3.3)
                size: Qt.vector3d(3, 7.5, 1)
                uv: Qt.vector2d(1.5, 3.75)
            }

            Block {
                position: Qt.vector3d(root.ladderX, 3.15, 1.95)
                size: Qt.vector3d(3, 0.3, 6.1)
                uv: Qt.vector2d(1.5, 3.05)
            }

            Block {
                position: Qt.vector3d(root.ladderX, 5.4, -0.95)
                size: Qt.vector3d(3, 4.2, 0.3)
                uv: Qt.vector2d(1.5, 2.1)
            }

            Block {
                position: Qt.vector3d(root.ladderX, 7.6, -1.95)
                size: Qt.vector3d(3, 0.2, 2)
                uv: Qt.vector2d(1.5, 1)
            }

            Plank {
                position: Qt.vector3d(root.ladderX, 2.88, -1.2)
                size: Qt.vector3d(2, 0.24, 0.22)
                uv: Qt.vector2d(1, 0.12)
                tint: "#8a6a50"
            }

            Plank {
                position: Qt.vector3d(root.ladderX - 0.9, 2.88, -1.95)
                size: Qt.vector3d(0.18, 0.22, 1.7)
                uv: Qt.vector2d(0.09, 0.85)
                tint: "#6a4c34"
            }

            Plank {
                position: Qt.vector3d(root.ladderX + 0.9, 2.88, -1.95)
                size: Qt.vector3d(0.18, 0.22, 1.7)
                uv: Qt.vector2d(0.09, 0.85)
                tint: "#6a4c34"
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
            visible: root.stage >= 3 && root.time >= root.caveStart

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

            LadderModel {
                position: Qt.vector3d(root.ladderX, root.floorY - 2.6, root.ladderZ)
                height: 3.5
            }

            StoneStatueModel {
                position: Qt.vector3d(-3.4, root.floorY, -4.4)
                eulerRotation.y: 20
                variant: "recoil"
                size: 0.8
            }

            StoneStatueModel {
                position: Qt.vector3d(1.6, root.floorY, -5.3)
                eulerRotation.y: 120
                variant: "fallen"
                size: 0.8
            }

            Node {
                y: root.floorY

                WallTorches {
                    tileSize: 1
                    torches: [
                        { x: -4.5, y: -2.2, yaw: 90, phase: 0 },
                        { x: 4.5, y: 1.4, yaw: -90, phase: 1.9 },
                        { x: 2.4, y: -6, yaw: 0, phase: 3.3 }
                    ]
                    brightness: 1.2
                }

                StumpModel {
                    position: Qt.vector3d(3.4, 0, 2)
                }

                RockModel {
                    position: Qt.vector3d(3.9, 0, -2.8)
                    eulerRotation.y: 60
                    scale: Qt.vector3d(0.5, 0.5, 0.5)
                }

                GrassModel {
                    position: Qt.vector3d(-4, 0, 4.8)
                    scale: Qt.vector3d(1, 1, 1)
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
            visible: root.stage >= 5
            x: root.caveX

            Block {
                surface: "dungeon/floor"
                tint: "#6f766e"
                position: Qt.vector3d(0, -0.6, 3.75)
                eulerRotation.x: 6.84
                size: Qt.vector3d(3.6, 0.3, 10.6)
                uv: Qt.vector2d(1.8, 5.3)
            }

            Block {
                surface: "dungeon/floor"
                tint: "#6f766e"
                position: Qt.vector3d(0, -0.15, -3)
                size: Qt.vector3d(3.6, 0.3, 3.4)
                uv: Qt.vector2d(1.8, 1.7)
            }

            Block {
                surface: "temple/wall"
                tint: "#4a4f48"
                position: Qt.vector3d(-2.35, 1.2, 2.6)
                size: Qt.vector3d(0.4, 5.4, 14.6)
                uv: Qt.vector2d(7.3, 2.7)
            }

            Block {
                surface: "temple/wall"
                tint: "#4a4f48"
                position: Qt.vector3d(2.35, 1.2, 2.6)
                size: Qt.vector3d(0.4, 5.4, 14.6)
                uv: Qt.vector2d(7.3, 2.7)
            }

            Block {
                surface: "temple/wall"
                tint: "#4a4f48"
                position: Qt.vector3d(0, 1.6, -4.6)
                size: Qt.vector3d(4.8, 4, 0.4)
                uv: Qt.vector2d(2.4, 2)
            }

            Block {
                surface: "temple/wall"
                tint: "#3e433d"
                position: Qt.vector3d(0, 3.3, 3.95)
                size: Qt.vector3d(4.8, 0.3, 11.9)
                uv: Qt.vector2d(2.4, 6)
            }

            Block {
                surface: "temple/wall"
                tint: "#3e433d"
                position: Qt.vector3d(-1.4, 3.3, -3.1)
                size: Qt.vector3d(2, 0.3, 2.2)
                uv: Qt.vector2d(1, 1.1)
            }

            Block {
                surface: "temple/wall"
                tint: "#3e433d"
                position: Qt.vector3d(2, 3.3, -3.1)
                size: Qt.vector3d(1.2, 0.3, 2.2)
                uv: Qt.vector2d(0.6, 1.1)
            }

            Block {
                surface: "temple/wall"
                tint: "#3e433d"
                position: Qt.vector3d(0, 3.3, -4.3)
                size: Qt.vector3d(4.8, 0.3, 0.2)
                uv: Qt.vector2d(2.4, 0.1)
            }

            Repeater3D {
                model: [
                    Qt.vector4d(-1.97, 0.20, -4.02, 1.77), Qt.vector4d(-1.77, 1.67, -4.48, 1.43), Qt.vector4d(2.08, 0.16, -3.96, 1.36),
                    Qt.vector4d(1.69, 1.40, -4.17, 1.49), Qt.vector4d(-1.19, 3.07, -4.33, 1.76), Qt.vector4d(-2.02, -0.04, -2.92, 1.37),
                    Qt.vector4d(-1.74, 1.35, -3.40, 1.64), Qt.vector4d(1.82, -0.01, -2.81, 1.74), Qt.vector4d(1.64, 1.68, -3.08, 1.54),
                    Qt.vector4d(-1.08, 3.28, -2.99, 1.78), Qt.vector4d(-2.06, 0.02, -2.08, 1.38), Qt.vector4d(-1.59, 1.33, -2.12, 1.50),
                    Qt.vector4d(1.75, 0.17, -2.10, 1.45), Qt.vector4d(1.80, 1.49, -2.11, 1.44), Qt.vector4d(-0.78, 3.02, -1.71, 1.31),
                    Qt.vector4d(-2.01, 0.17, -1.19, 1.69), Qt.vector4d(-1.66, 1.46, -1.19, 1.22), Qt.vector4d(1.81, 0.21, -1.08, 1.68),
                    Qt.vector4d(1.83, 1.60, -0.99, 1.38), Qt.vector4d(-0.89, 3.16, -1.14, 1.67), Qt.vector4d(0.78, 3.19, -1.18, 1.77),
                    Qt.vector4d(-1.78, -0.17, 0.27, 1.76), Qt.vector4d(-1.65, 1.47, 0.23, 1.36), Qt.vector4d(1.86, -0.23, -0.05, 1.37),
                    Qt.vector4d(1.76, 1.49, -0.00, 1.22), Qt.vector4d(-0.61, 2.96, 0.14, 1.42), Qt.vector4d(0.66, 3.04, 0.17, 1.51),
                    Qt.vector4d(-1.77, -0.07, 1.02, 1.55), Qt.vector4d(-1.80, 1.02, 1.44, 1.67), Qt.vector4d(1.97, -0.12, 1.06, 1.52),
                    Qt.vector4d(1.59, 1.30, 1.18, 1.43), Qt.vector4d(-0.60, 2.92, 1.59, 1.53), Qt.vector4d(0.59, 2.88, 1.29, 1.45),
                    Qt.vector4d(-1.89, -0.51, 2.33, 1.79), Qt.vector4d(-1.84, 1.08, 2.40, 1.37), Qt.vector4d(1.78, -0.46, 2.57, 1.73),
                    Qt.vector4d(1.66, 1.15, 2.56, 1.55), Qt.vector4d(-0.80, 2.76, 2.32, 1.65), Qt.vector4d(0.47, 2.68, 2.56, 1.65),
                    Qt.vector4d(-1.85, -0.32, 3.59, 1.59), Qt.vector4d(-1.55, 0.92, 3.35, 1.54), Qt.vector4d(1.91, -0.37, 3.59, 1.70),
                    Qt.vector4d(1.65, 0.96, 3.64, 1.61), Qt.vector4d(-0.99, 2.65, 3.72, 1.64), Qt.vector4d(0.89, 2.69, 3.51, 1.56),
                    Qt.vector4d(-1.81, -0.50, 4.86, 1.54), Qt.vector4d(-1.76, 0.86, 4.74, 1.29), Qt.vector4d(2.02, -0.60, 4.70, 1.51),
                    Qt.vector4d(1.74, 0.88, 4.68, 1.56), Qt.vector4d(-1.18, 2.32, 4.56, 1.63), Qt.vector4d(0.43, 2.47, 4.68, 1.32),
                    Qt.vector4d(-1.92, -0.87, 5.43, 1.37), Qt.vector4d(-1.65, 0.51, 5.52, 1.22), Qt.vector4d(1.91, -0.81, 5.77, 1.60),
                    Qt.vector4d(1.62, 0.80, 5.40, 1.40), Qt.vector4d(-1.03, 2.26, 5.47, 1.72), Qt.vector4d(0.52, 2.15, 5.77, 1.35),
                    Qt.vector4d(-1.94, -0.96, 6.85, 1.78), Qt.vector4d(-1.80, 0.47, 6.99, 1.52), Qt.vector4d(1.88, -1.04, 6.86, 1.58),
                    Qt.vector4d(1.84, 0.69, 6.87, 1.38), Qt.vector4d(-0.66, 2.00, 6.56, 1.58), Qt.vector4d(0.67, 2.05, 6.88, 1.75),
                    Qt.vector4d(-1.88, -1.06, 7.74, 1.45), Qt.vector4d(-1.84, 0.32, 8.18, 1.66), Qt.vector4d(1.96, -1.12, 8.19, 1.55),
                    Qt.vector4d(1.67, 0.30, 8.19, 1.45), Qt.vector4d(-1.03, 2.02, 7.67, 1.61), Qt.vector4d(0.57, 1.96, 8.07, 1.71),
                    Qt.vector4d(-1.75, -1.15, 8.86, 1.77), Qt.vector4d(-1.78, 0.14, 8.86, 1.28), Qt.vector4d(2.10, -1.24, 9.06, 1.54),
                    Qt.vector4d(1.74, 0.28, 9.15, 1.26), Qt.vector4d(-0.74, 1.83, 9.02, 1.47), Qt.vector4d(0.48, 1.90, 8.98, 1.48),
                    Qt.vector4d(0.40, 0.60, -4.50, 2.20), Qt.vector4d(-0.90, 0.90, -4.60, 2.00)
                ]

                delegate: Model {
                    required property vector4d modelData
                    required property int index

                    source: Assets.url + (index % 2 === 0 ? "models/rock_large/meshes/rock_largeA_mesh.mesh" : "models/rock_tall/meshes/rock_tallA_mesh.mesh")
                    position: Qt.vector3d(modelData.x * 1.15, modelData.y, modelData.z)
                    eulerRotation: Qt.vector3d(index * 41, index * 67, index * 23)
                    scale: Qt.vector3d(modelData.w * 0.8, modelData.w * 0.7, modelData.w * 0.75)
                    materials: PrincipledMaterial {
                        baseColor: index % 3 === 0 ? "#3e4541" : (index % 3 === 1 ? "#333934" : "#484a42")
                        roughness: 0.85
                    }
                }
            }

            Repeater3D {
                model: [
                    Qt.vector4d(0.2, 6.4, 12, 1.7), Qt.vector4d(-0.5, 4.9, -28, 1.4), Qt.vector4d(0.6, 3.6, 70, 1.2),
                    Qt.vector4d(-0.3, 2.3, 8, 1.6), Qt.vector4d(0.9, 1.1, -40, 1.1), Qt.vector4d(-0.7, 0.2, 22, 1.3),
                    Qt.vector4d(0.3, 7.6, -15, 1.0)
                ]

                delegate: Plank {
                    required property vector4d modelData

                    position: Qt.vector3d(modelData.x, -0.12 * (modelData.y + 1.5) + 0.04, modelData.y)
                    eulerRotation: Qt.vector3d(6.84, modelData.z, 0)
                    size: Qt.vector3d(modelData.w, 0.05, 0.22)
                    uv: Qt.vector2d(modelData.w / 2, 0.11)
                    tint: "#8a6a50"
                }
            }

            Repeater3D {
                model: [Qt.vector3d(-0.4, 5.6, 1.4), Qt.vector3d(0.8, 3, 1.1), Qt.vector3d(-0.2, 0.4, 1.6)]

                delegate: Model {
                    required property vector3d modelData

                    source: "#Rectangle"
                    position: Qt.vector3d(modelData.x, -0.12 * (modelData.y + 1.5) + 0.02, modelData.y)
                    eulerRotation.x: -90 + 6.84
                    scale: Qt.vector3d(modelData.z * 0.01, modelData.z * 0.006, 1)
                    materials: PrincipledMaterial {
                        baseColor: "#1c2420"
                        roughness: 0.05
                        specularAmount: 1
                    }
                }
            }

            WallTorches {
                tileSize: 1
                torches: [
                    { x: -2.15, y: 3.4, yaw: 90, phase: 0 },
                    { x: 2.15, y: -1.2, yaw: -90, phase: 2.1 },
                    { x: 2.15, y: 6.6, yaw: -90, phase: 3.7 }
                ]
                brightness: 1.2
            }

            Repeater3D {
                model: [7.2, 4.6, 2, -0.6]

                delegate: Node {
                    id: support

                    required property real modelData
                    readonly property real floor: support.modelData > -1.5 ? -0.12 * (support.modelData + 1.5) : 0

                    z: support.modelData

                    Plank {
                        position: Qt.vector3d(-1.6, (support.floor + 3.15) / 2, 0)
                        size: Qt.vector3d(0.22, 3.15 - support.floor, 0.22)
                        uv: Qt.vector2d(0.11, 1.5)
                        tint: "#7a5a40"
                    }

                    Plank {
                        position: Qt.vector3d(1.6, (support.floor + 3.15) / 2, 0)
                        size: Qt.vector3d(0.22, 3.15 - support.floor, 0.22)
                        uv: Qt.vector2d(0.11, 1.5)
                        tint: "#7a5a40"
                    }

                    Plank {
                        position: Qt.vector3d(0, 3.05, 0)
                        size: Qt.vector3d(3.6, 0.24, 0.26)
                        uv: Qt.vector2d(1.8, 0.12)
                        tint: "#6a4c34"
                    }
                }
            }

            Repeater3D {
                model: [-1.1, -0.4, 0.3, 1.0]

                delegate: Plank {
                    required property real modelData

                    position: Qt.vector3d(modelData, 3.12, 2.9)
                    size: Qt.vector3d(0.3, 0.06, 9.4)
                    uv: Qt.vector2d(0.15, 4.7)
                    tint: "#5e4430"
                }
            }

            LadderModel {
                position: Qt.vector3d(root.ladderX, 0, root.ladderZ)
                height: 3.6
            }

            Plank {
                position: Qt.vector3d(root.ladderX, 3.1, -2.05)
                size: Qt.vector3d(1.9, 0.12, 0.18)
                uv: Qt.vector2d(0.95, 0.06)
                tint: "#7a5a40"
            }

            Plank {
                position: Qt.vector3d(root.ladderX, 3.1, -4.15)
                size: Qt.vector3d(1.9, 0.12, 0.18)
                uv: Qt.vector2d(0.95, 0.06)
                tint: "#7a5a40"
            }

            Plank {
                position: Qt.vector3d(root.ladderX - 0.88, 3.1, -3.1)
                size: Qt.vector3d(0.18, 0.12, 2.2)
                uv: Qt.vector2d(0.09, 1.1)
                tint: "#7a5a40"
            }

            Plank {
                position: Qt.vector3d(root.ladderX + 0.88, 3.1, -3.1)
                size: Qt.vector3d(0.18, 0.12, 2.2)
                uv: Qt.vector2d(0.09, 1.1)
                tint: "#7a5a40"
            }

            Node {
                position: Qt.vector3d(root.ladderX, 3.45, -2.05)
                eulerRotation.x: 100

                Plank {
                    z: -1
                    size: Qt.vector3d(1.7, 0.08, 2)
                    uv: Qt.vector2d(0.85, 1)
                    tint: "#c9a67e"
                }
            }

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(root.ladderX, 4.1, root.ladderZ)
                eulerRotation.x: 90
                scale: Qt.vector3d(0.014, 0.014, 1)
                materials: PrincipledMaterial {
                    baseColor: "#000000"
                    emissiveFactor: Qt.vector3d(0.55, 0.62, 0.72)
                    cullMode: Material.NoCulling
                }
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

            Plank {
                position: Qt.vector3d(-0.65, root.floorY + 1.5, 11)
                size: Qt.vector3d(0.5, 3, 9)
                uv: Qt.vector2d(4.5, 1.5)
            }

            Plank {
                position: Qt.vector3d(1.85, root.floorY + 1.5, 9.5)
                size: Qt.vector3d(0.5, 3, 6)
                uv: Qt.vector2d(3, 1.5)
            }

            Plank {
                position: Qt.vector3d(4.05, root.floorY + 1.5, 15.25)
                size: Qt.vector3d(9.9, 3, 0.5)
                uv: Qt.vector2d(5, 1.5)
            }

            Plank {
                position: Qt.vector3d(5.3, root.floorY + 1.5, 12.75)
                size: Qt.vector3d(7.4, 3, 0.5)
                uv: Qt.vector2d(3.7, 1.5)
            }

            Repeater3D {
                model: [
                    Qt.vector4d(-0.65, 7.2, 11, 0.5), Qt.vector4d(1.85, 7.2, 9.5, 0.5),
                    Qt.vector4d(4.05, 7.2, 15.25, 9.9), Qt.vector4d(5.3, 7.2, 12.75, 7.4)
                ]

                delegate: Model {
                    required property vector4d modelData

                    source: "#Cube"
                    position: Qt.vector3d(modelData.x, modelData.y + 0.04, modelData.z)
                    scale: modelData.w > 1 ? Qt.vector3d(modelData.w / 100, 0.0008, 0.0054) : Qt.vector3d(0.0054, 0.0008, modelData.x < 0 ? 0.09 : 0.06)
                    materials: PrincipledMaterial {
                        baseColor: "#e8eef4"
                        roughness: 0.9
                    }
                }
            }

            PointLight {
                position: Qt.vector3d(0.7, root.floorY + 2.6, 13.4)
                color: "#b8c8e0"
                brightness: root.time >= root.doorStart ? 1.6 : 0
                quadraticFade: 300
            }


            StoneStatueModel {
                position: Qt.vector3d(-0.15, root.floorY, 14.6)
                eulerRotation.y: 150
                variant: "cower"
                size: 0.75
            }


            Repeater3D {
                model: [
                    Qt.vector4d(0.75, 8.6, 0.16, 20), Qt.vector4d(-0.15, 10.2, 0.12, 65), Qt.vector4d(1.3, 9.9, 0.2, 140),
                    Qt.vector4d(0.4, 10.8, 0.1, 210), Qt.vector4d(-0.2, 8.2, 0.14, 300), Qt.vector4d(1.45, 12.6, 0.18, 35),
                    Qt.vector4d(0.2, 13.4, 0.12, 95), Qt.vector4d(3.6, 13.8, 0.15, 170), Qt.vector4d(5.6, 13.4, 0.11, 250),
                    Qt.vector4d(0.9, 7.6, 0.09, 330)
                ]

                delegate: Model {
                    required property vector4d modelData

                    source: "#Cube"
                    position: Qt.vector3d(modelData.x, root.floorY + modelData.z * 0.4, modelData.y)
                    eulerRotation: Qt.vector3d(modelData.w * 0.3, modelData.w, modelData.w * 0.2)
                    scale: Qt.vector3d(modelData.z * 0.011, modelData.z * 0.008, modelData.z * 0.009)
                    materials: PrincipledMaterial {
                        baseColor: "#84878d"
                        roughness: 0.95
                    }
                }
            }

            Model {
                source: "#Sphere"
                position: Qt.vector3d(0.95, root.floorY + 0.13, 9.9)
                scale: Qt.vector3d(0.0026, 0.0028, 0.0026)
                materials: PrincipledMaterial {
                    baseColor: "#84878d"
                    roughness: 0.95
                }
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
}
