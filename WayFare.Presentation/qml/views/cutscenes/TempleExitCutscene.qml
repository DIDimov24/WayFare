import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Timeline
import wayfare.presentation

Cutscene {
    id: root

    readonly property real surfaceAt: 4000
    readonly property real climbAt: 6500
    readonly property real wipeAt: 11531
    readonly property real dropAt: 15000
    readonly property real restAt: 18200
    readonly property real tankFree: 16450
    readonly property bool under: root.time < root.surfaceAt
    readonly property bool surfaced: root.started && root.time >= root.surfaceAt + 100
    readonly property bool tankLanded: root.started && root.time >= 16950
    property bool finished: false
    property real heroPitch: 0

    lastStage: 3
    length: 31900
    shots: [0, 4100, 6600, 11600, 15100, 18300, 22100, 29500]
    heroReady: hero.ready
    title: "The Dungeon"
    lines: [
        { start: 17200, end: 22000, text: "This tank was never mine. Someone left it down there.", voice: "temple_1" },
        { start: 22300, end: 28300, text: "Other parents came this way before me. So where did they all go?", voice: "temple_2" }
    ]

    onStartedChanged: {
        if (root.started) {
            music.play()
        }
    }
    onSkipRequested: root.finish()
    onEnded: root.finish()
    onSurfacedChanged: {
        if (root.surfaced) {
            Sounds.gasp.play()
        }
    }
    onTankLandedChanged: {
        if (root.tankLanded) {
            tankSound.play()
        }
    }

    MediaPlayer {
        id: music
        source: Assets.url + "audio/temple_exit_music.ogg"
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * Math.min(1, (root.length - root.time) / 1200)
        }
    }

    SoundEffect {
        id: tankSound
        source: Assets.url + "audio/tank_drop.wav"
        volume: Settings.sfxVolume / 100
    }

    function finish() {
        if (root.finished) {
            return
        }
        root.finished = true
        Level.nextLevel()
    }

    function heroClip(): string {
        if (root.time < root.surfaceAt) {
            return "swimming"
        }
        if (root.time < root.climbAt) {
            return "treading_water"
        }
        if (root.time < root.wipeAt) {
            return "swimming_to_edge"
        }
        if (root.time < root.dropAt) {
            return "breathing_idle"
        }
        if (root.time < root.restAt) {
            return "kneeling_down"
        }
        return "breathing_idle"
    }

    function heroTime(): real {
        if (root.time < root.surfaceAt) {
            return root.time
        }
        if (root.time < root.climbAt) {
            return root.time - root.surfaceAt
        }
        if (root.time < root.wipeAt) {
            return root.time - root.climbAt
        }
        if (root.time < root.dropAt) {
            return root.time - root.wipeAt
        }
        if (root.time < root.restAt) {
            return root.time - root.dropAt
        }
        return root.time - root.restAt
    }

    Timeline {
        startFrame: 0
        endFrame: root.length
        currentFrame: root.time
        enabled: true

        KeyframeGroup {
            target: camera
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(1, -10.6, 1.1) }
            Keyframe { frame: 3999; value: Qt.vector3d(0.9, -5.6, 1) }
            Keyframe { frame: 4000; value: Qt.vector3d(-1.3, 1.5, -2.7) }
            Keyframe { frame: 6499; value: Qt.vector3d(-1.1, 1.45, -2.4) }
            Keyframe { frame: 6500; value: Qt.vector3d(2.8, 1.7, 0.4) }
            Keyframe { frame: 11530; value: Qt.vector3d(2.5, 1.6, -0.6) }
            Keyframe { frame: 11531; value: Qt.vector3d(0.7, 1.9, -5.4) }
            Keyframe { frame: 14999; value: Qt.vector3d(0.5, 1.95, -5.1) }
            Keyframe { frame: 15000; value: Qt.vector3d(-2.6, 1.5, -1.1) }
            Keyframe { frame: 18200; value: Qt.vector3d(-2.9, 1.3, -0.9) }
            Keyframe { frame: 18201; value: Qt.vector3d(-0.4, 0.3, -4.4) }
            Keyframe { frame: 22000; value: Qt.vector3d(-0.55, 0.34, -4.1) }
            Keyframe { frame: 22001; value: Qt.vector3d(0.45, 2, -4.6) }
            Keyframe { frame: 29000; value: Qt.vector3d(0.38, 2, -4.3) }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, -7.4, 0) }
            Keyframe { frame: 3999; value: Qt.vector3d(0, -1.9, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.15, 0.1) }
            Keyframe { frame: 6499; value: Qt.vector3d(0, 0.2, 0.1) }
            Keyframe { frame: 6500; value: Qt.vector3d(0, -0.15, -0.3) }
            Keyframe { frame: 11530; value: Qt.vector3d(0, 0.05, -1.3) }
            Keyframe { frame: 11531; value: Qt.vector3d(0, 1.85, -3.3) }
            Keyframe { frame: 14999; value: Qt.vector3d(0, 1.85, -3.3) }
            Keyframe { frame: 15000; value: Qt.vector3d(0, 1.25, -3.3) }
            Keyframe { frame: 18200; value: Qt.vector3d(-0.5, 0.6, -3) }
            Keyframe { frame: 18201; value: Qt.vector3d(-1.1, 0.25, -2.65) }
            Keyframe { frame: 22000; value: Qt.vector3d(-1.1, 0.3, -2.65) }
            Keyframe { frame: 22001; value: Qt.vector3d(0, 1.92, -3.3) }
            Keyframe { frame: 29000; value: Qt.vector3d(0, 1.92, -3.3) }
        }

        KeyframeGroup {
            target: camera
            property: "fieldOfView"

            Keyframe { frame: 0; value: 60 }
            Keyframe { frame: 3999; value: 60 }
            Keyframe { frame: 4000; value: 48 }
            Keyframe { frame: 6499; value: 46 }
            Keyframe { frame: 6500; value: 55 }
            Keyframe { frame: 11530; value: 55 }
            Keyframe { frame: 11531; value: 38 }
            Keyframe { frame: 14999; value: 36 }
            Keyframe { frame: 15000; value: 55 }
            Keyframe { frame: 18200; value: 58 }
            Keyframe { frame: 18201; value: 42 }
            Keyframe { frame: 22000; value: 40 }
            Keyframe { frame: 22001; value: 32 }
            Keyframe { frame: 29000; value: 29 }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, -9, 0.2) }
            Keyframe { frame: 3999; value: Qt.vector3d(0, -3.6, 0.2) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, -1.01, 0.1) }
            Keyframe { frame: 6499; value: Qt.vector3d(0, -1.01, -0.1) }
            Keyframe { frame: 6500; value: Qt.vector3d(0, -1.41, -0.28) }
            Keyframe { frame: 11530; value: Qt.vector3d(0, -1.41, -0.28) }
            Keyframe { frame: 11531; value: Qt.vector3d(0, 0, -3.3) }
        }

        KeyframeGroup {
            target: root
            property: "heroPitch"

            Keyframe { frame: 0; value: -78 }
            Keyframe { frame: 3999; value: -78 }
            Keyframe { frame: 4000; value: 0 }
        }

        KeyframeGroup {
            target: looseTank
            property: "position"

            Keyframe { frame: 16450; value: Qt.vector3d(0, 1.59, -3.29) }
            Keyframe { frame: 16950; value: Qt.vector3d(-0.5, 0.4, -2.85); easing.type: Easing.InQuad }
            Keyframe { frame: 17900; value: Qt.vector3d(-1.1, 0.34, -2.65); easing.type: Easing.OutQuad }
        }

        KeyframeGroup {
            target: looseTank
            property: "eulerRotation"

            Keyframe { frame: 16450; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 16950; value: Qt.vector3d(-70, 20, 0); easing.type: Easing.InQuad }
            Keyframe { frame: 17900; value: Qt.vector3d(-90, 40, 0); easing.type: Easing.OutQuad }
        }

        KeyframeGroup {
            target: looseMask
            property: "position"

            Keyframe { frame: 16450; value: Qt.vector3d(-0.25, 0.9, -3.1) }
            Keyframe { frame: 16900; value: Qt.vector3d(-0.8, 0.06, -2.5); easing.type: Easing.InQuad }
            Keyframe { frame: 17400; value: Qt.vector3d(-0.9, 0.06, -2.4); easing.type: Easing.OutQuad }
        }

        KeyframeGroup {
            target: looseMask
            property: "eulerRotation"

            Keyframe { frame: 16450; value: Qt.vector3d(0, 160, 0) }
            Keyframe { frame: 16900; value: Qt.vector3d(-80, 200, 10); easing.type: Easing.InQuad }
            Keyframe { frame: 17400; value: Qt.vector3d(-90, 210, 0) }
        }

        KeyframeGroup {
            target: looseFins
            property: "position"

            Keyframe { frame: 16450; value: Qt.vector3d(0, 0.25, -3.3) }
            Keyframe { frame: 16800; value: Qt.vector3d(-0.3, 0.02, -3); easing.type: Easing.InQuad }
            Keyframe { frame: 17300; value: Qt.vector3d(-0.4, 0.02, -2.9) }
        }

        KeyframeGroup {
            target: root
            property: "fadeOpacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 1000; value: 0 }
            Keyframe { frame: 28400; value: 0 }
            Keyframe { frame: 29300; value: 1 }
        }

        KeyframeGroup {
            target: root
            property: "titleOpacity"

            Keyframe { frame: 0; value: 0 }
            Keyframe { frame: 29400; value: 0 }
            Keyframe { frame: 30000; value: 1 }
            Keyframe { frame: 31200; value: 1 }
            Keyframe { frame: 31900; value: 0 }
        }
    }

    component Block: Model {
        id: stoneBlock

        property vector3d size: Qt.vector3d(1, 1, 1)
        property vector2d uv: Qt.vector2d(1, 1)
        property string surface: "dungeon/wall"

        source: "#Cube"
        scale: size.times(0.01)
        materials: PrincipledMaterial {
            roughness: 1
            baseColor: "#8c8c8c"
            baseColorMap: Texture {
                source: Assets.url + "textures/" + stoneBlock.surface + "_diffuse.jpg"
                scaleU: stoneBlock.uv.x
                scaleV: stoneBlock.uv.y
            }
            normalMap: Texture {
                source: Assets.url + "textures/" + stoneBlock.surface + "_normal.jpg"
                scaleU: stoneBlock.uv.x
                scaleV: stoneBlock.uv.y
            }
        }
    }

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.Color
            clearColor: root.under ? "#02161c" : "#080504"
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            fog: Fog {
                enabled: true
                color: root.under ? "#02161c" : "#080504"
                density: root.under ? 0.95 : 1
                depthEnabled: true
                depthNear: root.under ? 3 : 4
                depthFar: root.under ? 24 : 16
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
            clipFar: 100
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-80, 20, 0)
            color: root.under ? "#7fd6e0" : "#6a5a50"
            brightness: root.under ? 0.4 : 0.12
            ambientColor: root.under ? "#0a2228" : "#1c1614"
        }

        PointLight {
            position: Qt.vector3d(0, 0.6, 0)
            color: "#ffc48c"
            brightness: root.under ? 1.4 : 0
            quadraticFade: 40
        }

        PointLight {
            position: Qt.vector3d(-2.6, 2.6, -5.4)
            color: "#ffb870"
            brightness: root.under ? 0 : 2.2 + Math.sin(root.time * 0.013) * 0.25 + Math.sin(root.time * 0.031) * 0.12
            quadraticFade: 500
        }

        PointLight {
            position: Qt.vector3d(3.4, 2.4, 1.6)
            color: "#ffb870"
            brightness: root.under ? 0 : 1.6 + Math.sin(root.time * 0.017 + 1) * 0.2
            quadraticFade: 500
        }

        HeroModel {
            id: hero

            eulerRotation: Qt.vector3d(root.heroPitch, 180, 0)
            clip: root.heroClip()
            time: root.heroTime()
            loop: root.time < root.climbAt || (root.time >= root.wipeAt && root.time < root.dropAt) || root.time >= root.restAt
            gear: root.time < root.tankFree
            suit: root.time <= root.restAt
            mask: root.time < root.dropAt
            maskInHand: root.time >= root.dropAt && root.time < root.tankFree
        }

        ScubaGearModel {
            id: looseTank

            visible: root.time >= root.tankFree
        }

        Node {
            id: looseMask

            visible: root.time >= root.tankFree

            Model {
                source: Assets.url + "models/dive_mask/meshes/dive_mask.mesh"
                position: Qt.vector3d(-0.018, -2.088, -0.084)
                scale: Qt.vector3d(0.6, 0.6, 0.6)
                materials: PrincipledMaterial {
                    baseColor: "#15181c"
                    roughness: 0.45
                    cullMode: Material.NoCulling
                }
            }
        }

        Node {
            id: looseFins

            visible: root.time >= root.tankFree
            eulerRotation.y: 150

            Model {
                source: Assets.url + "models/dive_fins/meshes/dive_fin_left.mesh"
                position: Qt.vector3d(-0.36, 0, -0.2)
                scale: Qt.vector3d(0.6, 0.6, 0.6)
                materials: PrincipledMaterial {
                    baseColor: "#0f2f42"
                    roughness: 0.45
                    cullMode: Material.NoCulling
                }
            }

            Model {
                source: Assets.url + "models/dive_fins/meshes/dive_fin_right.mesh"
                position: Qt.vector3d(0.3, 0, -0.1)
                eulerRotation.y: 20
                scale: Qt.vector3d(0.6, 0.6, 0.6)
                materials: PrincipledMaterial {
                    baseColor: "#0f2f42"
                    roughness: 0.45
                    cullMode: Material.NoCulling
                }
            }
        }

        Node {
            visible: root.stage >= 1

            Model {
                visible: root.under
                source: "#Cylinder"
                position: Qt.vector3d(0, -0.4, 0)
                scale: Qt.vector3d(0.038, 0.0002, 0.038)
                materials: PrincipledMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    baseColor: "#e0a868"
                }
            }

            Repeater3D {
                visible: root.under
                model: [
                    Qt.vector4d(2.94, -13.16, -0.04, 1.79), Qt.vector4d(2.26, -13.43, 1.86, 1.76), Qt.vector4d(0.78, -13.4, 2.82, 1.76),
                    Qt.vector4d(-1.63, -13.66, 2.33, 1.47), Qt.vector4d(-2.66, -13.35, 1.36, 1.97), Qt.vector4d(-2.96, -13.13, -0.64, 2.09),
                    Qt.vector4d(-1.36, -13.77, -2.62, 1.83), Qt.vector4d(0.09, -13.85, -2.93, 1.77), Qt.vector4d(2.02, -13.88, -2.04, 1.57),
                    Qt.vector4d(2.75, -11.73, 0.97, 1.71), Qt.vector4d(1.46, -12.0, 2.57, 1.85), Qt.vector4d(-0.65, -12.18, 2.84, 1.72),
                    Qt.vector4d(-2.58, -11.73, 1.58, 2.1), Qt.vector4d(-2.88, -12.22, -0.18, 1.62), Qt.vector4d(-2.28, -11.79, -1.68, 1.45),
                    Qt.vector4d(-0.61, -12.09, -2.94, 1.99), Qt.vector4d(1.84, -12.4, -2.37, 1.99), Qt.vector4d(2.73, -12.02, -1.27, 2.04),
                    Qt.vector4d(2.87, -10.84, 0.42, 1.68), Qt.vector4d(2.21, -10.68, 2.01, 1.94), Qt.vector4d(0.85, -10.13, 2.76, 1.63),
                    Qt.vector4d(-1.61, -10.7, 2.35, 1.48), Qt.vector4d(-2.53, -10.26, 1.28, 1.44), Qt.vector4d(-2.84, -10.54, -0.73, 1.79),
                    Qt.vector4d(-1.72, -10.8, -2.43, 1.91), Qt.vector4d(0.61, -10.56, -2.78, 1.48), Qt.vector4d(2.04, -10.12, -2.03, 1.59),
                    Qt.vector4d(2.61, -8.69, 1.23, 1.61), Qt.vector4d(1.66, -8.72, 2.38, 1.68), Qt.vector4d(-0.61, -8.61, 2.77, 1.47),
                    Qt.vector4d(-2.03, -8.78, 2.03, 1.58), Qt.vector4d(-2.88, -9.34, 0.15, 1.61), Qt.vector4d(-2.47, -9.21, -1.6, 1.81),
                    Qt.vector4d(-0.42, -9.04, -2.87, 1.66), Qt.vector4d(1.79, -8.94, -2.31, 1.74), Qt.vector4d(2.78, -9.28, -0.68, 1.53),
                    Qt.vector4d(2.97, -7.7, 0.37, 1.97), Qt.vector4d(2.45, -7.15, 1.69, 1.92), Qt.vector4d(0.79, -7.19, 2.91, 2.07),
                    Qt.vector4d(-1.53, -7.82, 2.47, 1.7), Qt.vector4d(-2.67, -7.71, 1.42, 2.07), Qt.vector4d(-2.64, -7.24, -1.15, 1.58),
                    Qt.vector4d(-1.37, -7.76, -2.54, 1.61), Qt.vector4d(0.68, -7.72, -2.75, 1.45), Qt.vector4d(2.33, -7.41, -1.89, 2.0),
                    Qt.vector4d(2.89, -6.24, 0.84, 2.04), Qt.vector4d(1.78, -6.04, 2.26, 1.59), Qt.vector4d(-0.12, -6.1, 2.85, 1.52),
                    Qt.vector4d(-2.22, -6.11, 1.78, 1.49), Qt.vector4d(-3.01, -5.87, -0.35, 2.09), Qt.vector4d(-2.14, -6.29, -2.02, 1.81),
                    Qt.vector4d(-0.87, -5.67, -2.69, 1.41), Qt.vector4d(1.67, -6.38, -2.52, 2.07), Qt.vector4d(2.78, -5.82, -0.89, 1.74),
                    Qt.vector4d(3.03, -4.84, -0.16, 2.1), Qt.vector4d(2.25, -4.18, 1.94, 1.92), Qt.vector4d(0.31, -4.27, 2.95, 1.89),
                    Qt.vector4d(-1.75, -4.35, 2.31, 1.65), Qt.vector4d(-2.92, -4.57, 0.68, 2.01), Qt.vector4d(-2.72, -4.44, -1.27, 2.0),
                    Qt.vector4d(-1.35, -4.43, -2.56, 1.67), Qt.vector4d(0.58, -4.39, -2.78, 1.46), Qt.vector4d(2.56, -4.32, -1.57, 2.02),
                    Qt.vector4d(2.83, -2.94, 0.92, 1.91), Qt.vector4d(1.54, -3.33, 2.57, 1.99), Qt.vector4d(-0.7, -2.92, 2.74, 1.42),
                    Qt.vector4d(-2.19, -2.84, 1.86, 1.56), Qt.vector4d(-2.95, -2.66, 0.0, 1.83), Qt.vector4d(-2.29, -3.16, -1.65, 1.41),
                    Qt.vector4d(-0.35, -3.26, -2.84, 1.54), Qt.vector4d(1.78, -3.05, -2.36, 1.86), Qt.vector4d(2.81, -2.87, -0.66, 1.63),
                    Qt.vector4d(2.9, -1.26, -0.26, 1.7), Qt.vector4d(2.04, -1.59, 2.2, 2.02), Qt.vector4d(0.43, -1.79, 2.85, 1.62),
                    Qt.vector4d(-1.5, -1.22, 2.6, 1.99), Qt.vector4d(-2.9, -1.68, 0.85, 2.07), Qt.vector4d(-2.82, -1.68, -0.72, 1.72),
                    Qt.vector4d(-1.66, -1.4, -2.38, 1.69), Qt.vector4d(0.5, -1.23, -2.84, 1.62), Qt.vector4d(2.48, -1.84, -1.53, 1.72)
                ]

                delegate: Model {
                    required property vector4d modelData
                    required property int index

                    source: Assets.url + (index % 2 === 0 ? "models/rock_large/meshes/rock_largeA_mesh.mesh" : "models/rock_tall/meshes/rock_tallA_mesh.mesh")
                    position: Qt.vector3d(modelData.x, modelData.y - modelData.w * 0.4, modelData.z)
                    eulerRotation: Qt.vector3d(index * 41, index * 67, index * 23)
                    scale: Qt.vector3d(modelData.w * 1.1, modelData.w * 0.9, modelData.w)
                    materials: PrincipledMaterial {
                        baseColor: index % 3 === 0 ? "#0d1d20" : "#122427"
                        roughness: 1
                    }
                }
            }

            Model {
                visible: root.under
                source: "#Rectangle"
                position: Qt.vector3d(0, -0.38, 0)
                eulerRotation.x: 90
                scale: Qt.vector3d(0.6, 0.6, 1)
                materials: PrincipledMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    baseColor: "#01090c"
                }
            }
        }

        Node {
            visible: root.stage >= 2 && !root.under

            Block {
                surface: "dungeon/floor"
                position: Qt.vector3d(-4.05, -0.15, -1)
                size: Qt.vector3d(4.9, 0.3, 14)
                uv: Qt.vector2d(2.45, 7)
            }

            Block {
                surface: "dungeon/floor"
                position: Qt.vector3d(4.05, -0.15, -1)
                size: Qt.vector3d(4.9, 0.3, 14)
                uv: Qt.vector2d(2.45, 7)
            }

            Block {
                surface: "dungeon/floor"
                position: Qt.vector3d(0, -0.15, -4.8)
                size: Qt.vector3d(3.2, 0.3, 6.4)
                uv: Qt.vector2d(1.6, 3.2)
            }

            Block {
                surface: "dungeon/floor"
                position: Qt.vector3d(0, -0.15, 3.8)
                size: Qt.vector3d(3.2, 0.3, 4.4)
                uv: Qt.vector2d(1.6, 2.2)
            }

            Repeater3D {
                model: 36

                delegate: Block {
                    required property int index
                    readonly property real course: index < 18 ? 0 : 1
                    readonly property real angle: ((index % 18) + course * 0.5) * Math.PI / 9

                    surface: "temple/wall"
                    position: Qt.vector3d(Math.cos(angle) * 2.15, 0.13 + course * 0.26, Math.sin(angle) * 2.15)
                    eulerRotation.y: -angle * 180 / Math.PI + 90
                    size: Qt.vector3d(0.76, 0.25, 0.5)
                    uv: Qt.vector2d(0.76, 0.5)
                }
            }

            Repeater3D {
                model: 18

                delegate: Block {
                    required property int index
                    readonly property real angle: (index + 0.25) * Math.PI / 9

                    surface: "temple/wall"
                    position: Qt.vector3d(Math.cos(angle) * 2.17, 0.56, Math.sin(angle) * 2.17)
                    eulerRotation.y: -angle * 180 / Math.PI + 90
                    size: Qt.vector3d(0.8, 0.1, 0.6)
                    uv: Qt.vector2d(0.8, 0.6)
                }
            }

            WallTorches {
                tileSize: 1
                torches: [
                    { x: -5.45, y: -1.5, yaw: 90, phase: 0 },
                    { x: 5.45, y: -3.6, yaw: -90, phase: 1.7 },
                    { x: 5.45, y: 2.4, yaw: -90, phase: 3.1 },
                    { x: -2.4, y: 5.45, yaw: 180, phase: 4.4 }
                ]
                brightness: 1.4
            }

            Node {
                eulerRotation.y: 45

                PrincipledMaterial {
                    id: wellWood

                    baseColor: "#6b4428"
                    roughness: 0.9
                }

                PrincipledMaterial {
                    id: wellRoof

                    baseColor: "#4a3020"
                    roughness: 0.95
                }

                Model {
                    source: "#Cube"
                    position: Qt.vector3d(-2.3, 1.35, 0)
                    scale: Qt.vector3d(0.0016, 0.026, 0.0016)
                    materials: wellWood
                }

                Model {
                    source: "#Cube"
                    position: Qt.vector3d(2.3, 1.35, 0)
                    scale: Qt.vector3d(0.0016, 0.026, 0.0016)
                    materials: wellWood
                }

                Model {
                    source: "#Cylinder"
                    position: Qt.vector3d(0, 2.45, 0)
                    eulerRotation.z: 90
                    scale: Qt.vector3d(0.0012, 0.049, 0.0012)
                    materials: wellWood
                }

                Model {
                    source: "#Cube"
                    position: Qt.vector3d(0, 2.86, 0.36)
                    eulerRotation.x: 35
                    scale: Qt.vector3d(0.052, 0.0008, 0.009)
                    materials: wellRoof
                }

                Model {
                    source: "#Cube"
                    position: Qt.vector3d(0, 2.86, -0.36)
                    eulerRotation.x: -35
                    scale: Qt.vector3d(0.052, 0.0008, 0.009)
                    materials: wellRoof
                }

                Model {
                    source: "#Cylinder"
                    position: Qt.vector3d(0.6, 2.1, 0)
                    scale: Qt.vector3d(0.0003, 0.007, 0.0003)
                    materials: PrincipledMaterial {
                        baseColor: "#a08a64"
                        roughness: 1
                    }
                }

                Model {
                    source: "#Cylinder"
                    position: Qt.vector3d(0.6, 1.62, 0)
                    scale: Qt.vector3d(0.0018, 0.0022, 0.0018)
                    materials: wellWood
                }
            }

            LanternModel {
                position: Qt.vector3d(3.1, 0, -2.4)
            }

            LanternModel {
                position: Qt.vector3d(-3.3, 0, 1.9)
            }

            LanternModel {
                position: Qt.vector3d(-2.2, 0, -6.6)
                post: false
            }

            Node {
                position: Qt.vector3d(2.75, 0, 0.9)

                Model {
                    source: "#Cylinder"
                    y: 0.2
                    scale: Qt.vector3d(0.0036, 0.004, 0.0036)
                    materials: PrincipledMaterial {
                        baseColor: "#6b4a2c"
                        roughness: 0.9
                    }
                }

                Model {
                    source: "#Cylinder"
                    y: 0.12
                    scale: Qt.vector3d(0.0037, 0.0003, 0.0037)
                    materials: PrincipledMaterial {
                        baseColor: "#2a2622"
                        metalness: 0.6
                        roughness: 0.5
                    }
                }

                Model {
                    source: "#Cylinder"
                    y: 0.32
                    scale: Qt.vector3d(0.0037, 0.0003, 0.0037)
                    materials: PrincipledMaterial {
                        baseColor: "#2a2622"
                        metalness: 0.6
                        roughness: 0.5
                    }
                }

                Model {
                    source: "#Cylinder"
                    y: 0.395
                    scale: Qt.vector3d(0.0033, 0.0002, 0.0033)
                    materials: PrincipledMaterial {
                        baseColor: "#0a2a31"
                        roughness: 0.15
                        specularAmount: 1
                    }
                }
            }

            Block {
                surface: "village/wall"
                position: Qt.vector3d(4.6, 0.35, 4.5)
                eulerRotation.y: 12
                size: Qt.vector3d(0.7, 0.7, 0.7)
                uv: Qt.vector2d(0.7, 0.7)
            }

            Block {
                surface: "village/wall"
                position: Qt.vector3d(3.85, 0.25, 4.9)
                eulerRotation.y: -20
                size: Qt.vector3d(0.5, 0.5, 0.5)
                uv: Qt.vector2d(0.5, 0.5)
            }

            Block {
                surface: "village/wall"
                position: Qt.vector3d(4.5, 0.95, 4.5)
                eulerRotation.y: 35
                size: Qt.vector3d(0.45, 0.5, 0.45)
                uv: Qt.vector2d(0.45, 0.5)
            }

            LogStackModel {
                position: Qt.vector3d(-4.7, 0, -5.4)
                eulerRotation.y: 90
            }

            RockModel {
                position: Qt.vector3d(-4.8, 0, 4.6)
                eulerRotation.y: 40
                variant: 1
                scale: Qt.vector3d(0.8, 0.8, 0.8)
            }

            RockModel {
                position: Qt.vector3d(4.9, 0, -6.6)
                eulerRotation.y: 200
                scale: Qt.vector3d(0.6, 0.6, 0.6)
            }

            RockModel {
                position: Qt.vector3d(-3.6, 0, 3.3)
                eulerRotation.y: 120
                scale: Qt.vector3d(0.4, 0.4, 0.4)
            }

            MineEntrance {
                position: Qt.vector3d(0, 0, -7.49)
            }

            Block {
                position: Qt.vector3d(-6, 2, -1)
                size: Qt.vector3d(1, 4.6, 14)
                uv: Qt.vector2d(7, 2.3)
            }

            Block {
                position: Qt.vector3d(6, 2, -1)
                size: Qt.vector3d(1, 4.6, 14)
                uv: Qt.vector2d(7, 2.3)
            }

            Block {
                position: Qt.vector3d(0, 2, -8)
                size: Qt.vector3d(13, 4.6, 1)
                uv: Qt.vector2d(6.5, 2.3)
            }

            Block {
                position: Qt.vector3d(0, 2, 6)
                size: Qt.vector3d(13, 4.6, 1)
                uv: Qt.vector2d(6.5, 2.3)
            }

            Block {
                position: Qt.vector3d(0, 4.4, -1)
                size: Qt.vector3d(13, 0.3, 14)
                uv: Qt.vector2d(6.5, 7)
            }
        }

        Node {
            visible: root.stage >= 3

            Model {
                source: "#Cylinder"
                position: Qt.vector3d(0, 0.59, 0)
                scale: Qt.vector3d(0.0382, 0.0001, 0.0382)
                materials: PrincipledMaterial {
                    baseColor: "#0a2a31"
                    roughness: 0.15
                    specularAmount: 1
                    alphaMode: PrincipledMaterial.Blend
                    opacity: 0.88
                    cullMode: Material.NoCulling
                }
            }

            ParticleSystem3D {
                running: root.started

                ModelParticle3D {
                    id: bubble

                    maxAmount: 120
                    color: "#b4e6f0"
                    fadeInDuration: 300
                    fadeOutDuration: 500
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
                    enabled: root.under
                    position: hero.position.plus(Qt.vector3d(0, 1.6, 0))
                    shape: ParticleShape3D {
                        type: ParticleShape3D.Sphere
                        extents: Qt.vector3d(0.3, 0.3, 0.3)
                    }
                    emitRate: 16
                    lifeSpan: 2500
                    particleScale: 1
                    particleScaleVariation: 0.6
                    velocity: VectorDirection3D {
                        direction: Qt.vector3d(0, 1.6, 0)
                        directionVariation: Qt.vector3d(0.2, 0.3, 0.2)
                    }
                }
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        visible: root.under
        gradient: Gradient {
            GradientStop { position: 0; color: "#223a9fb0" }
            GradientStop { position: 1; color: "#003a9fb0" }
        }
    }
}
