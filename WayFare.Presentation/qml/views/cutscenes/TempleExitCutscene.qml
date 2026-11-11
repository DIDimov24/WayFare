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
            return "surface_gasp"
        }
        if (root.time < root.wipeAt) {
            return "swimming_to_edge"
        }
        if (root.time < root.dropAt) {
            return "mask_off"
        }
        if (root.time < root.restAt) {
            return "drop_tank"
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

            Keyframe { frame: 0; value: Qt.vector3d(1.6, -10.6, 1.9) }
            Keyframe { frame: 3999; value: Qt.vector3d(1.4, -5.6, 1.7) }
            Keyframe { frame: 4000; value: Qt.vector3d(-1.5, 0.42, -3.3) }
            Keyframe { frame: 6499; value: Qt.vector3d(-1.2, 0.5, -3) }
            Keyframe { frame: 6500; value: Qt.vector3d(3.2, 0.9, 0.1) }
            Keyframe { frame: 11530; value: Qt.vector3d(2.8, 0.85, -0.9) }
            Keyframe { frame: 11531; value: Qt.vector3d(0.7, 1.9, -4.5) }
            Keyframe { frame: 14999; value: Qt.vector3d(0.5, 1.95, -4.2) }
            Keyframe { frame: 15000; value: Qt.vector3d(-2.6, 1.5, -0.2) }
            Keyframe { frame: 18200; value: Qt.vector3d(-2.9, 1.3, 0) }
            Keyframe { frame: 18201; value: Qt.vector3d(-0.4, 0.3, -3.5) }
            Keyframe { frame: 22000; value: Qt.vector3d(-0.55, 0.34, -3.2) }
            Keyframe { frame: 22001; value: Qt.vector3d(0.45, 2, -3.7) }
            Keyframe { frame: 29000; value: Qt.vector3d(0.38, 2, -3.4) }
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
            Keyframe { frame: 11531; value: Qt.vector3d(0, 1.85, -2.4) }
            Keyframe { frame: 14999; value: Qt.vector3d(0, 1.85, -2.4) }
            Keyframe { frame: 15000; value: Qt.vector3d(0, 1.25, -2.4) }
            Keyframe { frame: 18200; value: Qt.vector3d(-0.5, 0.6, -2.1) }
            Keyframe { frame: 18201; value: Qt.vector3d(-1.1, 0.25, -1.75) }
            Keyframe { frame: 22000; value: Qt.vector3d(-1.1, 0.3, -1.75) }
            Keyframe { frame: 22001; value: Qt.vector3d(0, 1.92, -2.4) }
            Keyframe { frame: 29000; value: Qt.vector3d(0, 1.92, -2.4) }
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
            Keyframe { frame: 4000; value: Qt.vector3d(0, -1.82, 0.1) }
            Keyframe { frame: 6499; value: Qt.vector3d(0, -1.82, -0.1) }
            Keyframe { frame: 6500; value: Qt.vector3d(0, -2.02, 0.32) }
            Keyframe { frame: 11530; value: Qt.vector3d(0, -2.02, 0.32) }
            Keyframe { frame: 11531; value: Qt.vector3d(0, 0, -2.4) }
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

            Keyframe { frame: 16450; value: Qt.vector3d(0, 1.59, -2.39) }
            Keyframe { frame: 16950; value: Qt.vector3d(-0.5, 0.4, -1.95); easing.type: Easing.InQuad }
            Keyframe { frame: 17900; value: Qt.vector3d(-1.1, 0.34, -1.75); easing.type: Easing.OutQuad }
        }

        KeyframeGroup {
            target: looseTank
            property: "eulerRotation"

            Keyframe { frame: 16450; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 16950; value: Qt.vector3d(-70, 20, 0); easing.type: Easing.InQuad }
            Keyframe { frame: 17900; value: Qt.vector3d(-90, 40, 0); easing.type: Easing.OutQuad }
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
            loop: root.time < root.climbAt || root.time >= root.restAt
            gear: root.time < root.tankFree
            suit: root.time <= root.restAt
            mask: root.time < root.wipeAt + 1300
        }

        ScubaGearModel {
            id: looseTank

            visible: root.time >= root.tankFree
        }

        Node {
            visible: root.stage >= 1

            Model {
                visible: root.under
                source: "#Rectangle"
                position: Qt.vector3d(0, -0.4, 0)
                eulerRotation.x: 90
                scale: Qt.vector3d(0.026, 0.026, 1)
                materials: PrincipledMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    baseColor: "#e0a868"
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
                position: Qt.vector3d(-3.9, -0.15, -1)
                size: Qt.vector3d(5.2, 0.3, 14)
                uv: Qt.vector2d(2.6, 7)
            }

            Block {
                surface: "dungeon/floor"
                position: Qt.vector3d(3.9, -0.15, -1)
                size: Qt.vector3d(5.2, 0.3, 14)
                uv: Qt.vector2d(2.6, 7)
            }

            Block {
                surface: "dungeon/floor"
                position: Qt.vector3d(0, -0.15, -4.65)
                size: Qt.vector3d(2.6, 0.3, 6.7)
                uv: Qt.vector2d(1.3, 3.35)
            }

            Block {
                surface: "dungeon/floor"
                position: Qt.vector3d(0, -0.15, 3.65)
                size: Qt.vector3d(2.6, 0.3, 4.7)
                uv: Qt.vector2d(1.3, 2.35)
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
                source: "#Rectangle"
                position: Qt.vector3d(0, -0.22, 0)
                eulerRotation.x: -90
                scale: Qt.vector3d(0.026, 0.026, 1)
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
