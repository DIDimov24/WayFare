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
    readonly property real breakLength: 2900
    readonly property real swimLength: 13000
    readonly property real kneelAt: 5200
    readonly property real pickAt: 7700
    readonly property real swimStart: root.prologue + root.breakLength
    readonly property real swim: Math.max(0, root.time - root.swimStart)
    readonly property real dive: Math.max(0, root.time - root.swimStart - root.swimLength)
    readonly property bool above: root.time < root.prologue
    readonly property bool swimming: root.time >= root.swimStart && root.swim < root.swimLength
    readonly property bool underIce: root.swimming && root.swim < 6000
    readonly property bool iceBroken: root.started && root.time >= root.kneelAt + 300
    readonly property bool splashed: root.time >= root.prologue + 100
    readonly property bool windy: root.started && root.above
    property real swimPitch: 0
    readonly property real lanternRise: Math.max(0, Math.min(1, (root.time - 11200) / 2500))
    readonly property real lanternLevel: root.time < 11200 ? 1 : 0.15 + 0.85 * (root.lanternRise < 0.5 ? 2 * root.lanternRise * root.lanternRise : 1 - Math.pow(-2 * root.lanternRise + 2, 2) / 2)

    lastStage: 6
    length: 51100
    shots: [0, 6000, 12000, 22500, 29000, 36000, 46000]
    heroReady: hero.ready
    title: "The Underwater Temple"
    titleAtBottom: true
    lines: [
        { start: 500, end: 5100, text: "She was right behind me. I only looked away for a moment.", voice: "intro_1" },
        { start: 7000, end: 11000, text: "Her footprints end right here, at the edge of the ice.", voice: "intro_2" },
        { start: 11500, end: 15400, text: "It dragged her under, the same way it took the other children.", voice: "intro_3" },
        { start: 15600, end: 19600, text: "Hold on, Mila. I'm coming down to get you.", voice: "intro_4" },
        { start: 28400, end: 34800, text: "The water's warm down here. Coral, under a frozen lake. This was never just a lake.", voice: "intro_6", thought: true },
        { start: 45400, end: 51000, text: "I can't hold my breath much longer. There has to be air somewhere inside.", voice: "intro_5", thought: true }
    ]

    readonly property bool diving: root.started && root.time >= root.swimStart + root.swimLength

    onDivingChanged: {
        if (root.diving) {
            music.play()
        }
    }
    onIceBrokenChanged: {
        if (root.iceBroken) {
            iceSound.play()
        }
    }
    onWindyChanged: {
        if (root.windy) {
            wind.play()
        } else {
            wind.stop()
        }
    }
    onSplashedChanged: {
        if (root.splashed && root.started) {
            splashSound.play()
        }
    }
    onSwimmingChanged: {
        if (root.swimming && root.started) {
            rumbleSound.play()
            depths.play()
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

    MediaPlayer {
        id: wind
        source: Assets.url + "audio/lake_wind.ogg"
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * Math.max(0, Math.min(1, root.time / 1500, (root.prologue - root.time) / 700))
        }
    }

    MediaPlayer {
        id: depths
        source: Assets.url + "audio/temple_ambience.ogg"
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * Math.max(0, Math.min(1, root.swim / 1500, (root.swimStart + root.swimLength + 1500 - root.time) / 1500))
        }
    }

    SoundEffect {
        id: iceSound
        source: Assets.url + "audio/ice_crack.wav"
        volume: Settings.sfxVolume / 100
    }

    SoundEffect {
        id: splashSound
        source: Assets.url + "audio/splash.wav"
        volume: Settings.sfxVolume / 100
    }

    SoundEffect {
        id: rumbleSound
        source: Assets.url + "audio/rumble.wav"
        volume: Settings.sfxVolume / 100
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
            Keyframe { frame: 18700; value: 0 }
            Keyframe { frame: 19200; value: 1 }
        }
    }

    Timeline {
        startFrame: 0
        endFrame: root.swimLength
        currentFrame: root.swim
        enabled: root.swimming

        KeyframeGroup {
            target: camera
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(2.6, 46.2, 6) }
            Keyframe { frame: 5999; value: Qt.vector3d(2, 46.3, 3) }
            Keyframe { frame: 6000; value: Qt.vector3d(1.4, 8.7, 9.4) }
            Keyframe { frame: 13000; value: Qt.vector3d(1, 8.3, 8.4) }
        }

        KeyframeGroup {
            target: focusPoint
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0, 48.2, -7) }
            Keyframe { frame: 5999; value: Qt.vector3d(0, 45.6, -11.5) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 3.6, -26) }
            Keyframe { frame: 13000; value: Qt.vector3d(0, 3.9, -27) }
        }

        KeyframeGroup {
            target: hero
            property: "position"

            Keyframe { frame: 0; value: Qt.vector3d(0.3, 53.6, 1.6) }
            Keyframe { frame: 5999; value: Qt.vector3d(0, 45, -11.5) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 6.6, 6.4) }
            Keyframe { frame: 13000; value: Qt.vector3d(0, 6.4, 5.8) }
        }

        KeyframeGroup {
            target: root
            property: "swimPitch"

            Keyframe { frame: 0; value: 50 }
            Keyframe { frame: 5999; value: 50 }
            Keyframe { frame: 6000; value: 0 }
            Keyframe { frame: 13000; value: 0 }
        }

        KeyframeGroup {
            target: root
            property: "fadeOpacity"

            Keyframe { frame: 0; value: 1 }
            Keyframe { frame: 500; value: 0 }
            Keyframe { frame: 5500; value: 0 }
            Keyframe { frame: 5999; value: 1 }
            Keyframe { frame: 6000; value: 1 }
            Keyframe { frame: 6600; value: 0 }
            Keyframe { frame: 12500; value: 0 }
            Keyframe { frame: 13000; value: 1 }
        }
    }

    Timeline {
        startFrame: 0
        endFrame: 16000
        currentFrame: root.dive
        enabled: root.time >= root.swimStart + root.swimLength

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
            Keyframe { frame: 11031; value: Qt.vector3d(0, 2.2, -25.4) }
            Keyframe { frame: 16000; value: Qt.vector3d(0, 2.5, -30.4) }
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

    SnowTracksMaterial {
        id: snowTracks
    }

    SnowTracksMaterial {
        id: snowGround

        lakeCut: 1
    }

    component Woods: PineModel {
        id: woods

        property int count: 10
        property int seed: 1
        property vector3d from
        property vector3d to

        scale: Qt.vector3d(1, 1, 1)
        instancing: RandomInstancing {
            instanceCount: woods.count
            randomSeed: woods.seed
            position: InstanceRange {
                from: woods.from
                to: woods.to
            }
            scale: InstanceRange {
                from: Qt.vector3d(7.5, 5, 7.5)
                to: Qt.vector3d(12, 8, 12)
                proportional: true
            }
            rotation: InstanceRange {
                from: Qt.vector3d(0, 0, 0)
                to: Qt.vector3d(0, 360, 0)
            }
        }
    }

    component IceSlab: Model {
        property vector3d size: Qt.vector3d(1, 1, 1)

        source: "#Cube"
        scale: size.times(0.01)
        materials: snowTracks
    }

    component Cabin: Node {
        id: cabin

        property real width: 4
        property real depth: 3.5
        property real height: 2.6

        Model {
            source: "#Cube"
            y: cabin.height / 2
            scale: Qt.vector3d(cabin.width, cabin.height, cabin.depth).times(0.01)
            materials: PrincipledMaterial {
                baseColor: "#4e4036"
                roughness: 0.9
            }
        }

        Model {
            source: "#Cube"
            y: cabin.height
            eulerRotation.z: 45
            scale: Qt.vector3d(cabin.width / Math.SQRT2, cabin.width / Math.SQRT2, cabin.depth).times(0.01)
            materials: PrincipledMaterial {
                baseColor: "#4e4036"
                roughness: 0.9
            }
        }

        Model {
            source: "#Cube"
            x: -(cabin.width / 2 + 0.3) / 2
            y: cabin.height + (cabin.width / 2 + 0.3) / 2
            eulerRotation.z: 45
            scale: Qt.vector3d((cabin.width / 2 + 0.3) * Math.SQRT2, 0.15, cabin.depth + 0.5).times(0.01)
            materials: PrincipledMaterial {
                baseColor: "#dfe6ee"
                roughness: 0.9
            }
        }

        Model {
            source: "#Cube"
            x: (cabin.width / 2 + 0.3) / 2
            y: cabin.height + (cabin.width / 2 + 0.3) / 2
            eulerRotation.z: -45
            scale: Qt.vector3d((cabin.width / 2 + 0.3) * Math.SQRT2, 0.15, cabin.depth + 0.5).times(0.01)
            materials: PrincipledMaterial {
                baseColor: "#dfe6ee"
                roughness: 0.9
            }
        }

        Model {
            source: "#Cube"
            x: -cabin.width / 4
            y: 1
            z: cabin.depth / 2
            scale: Qt.vector3d(0.9, 2, 0.08).times(0.01)
            materials: PrincipledMaterial {
                baseColor: "#15110e"
                roughness: 0.8
            }
        }

        Model {
            source: "#Cube"
            x: cabin.width / 4
            y: 1.5
            z: cabin.depth / 2
            scale: Qt.vector3d(0.7, 0.6, 0.06).times(0.01)
            materials: PrincipledMaterial {
                baseColor: "#000000"
                emissiveFactor: Qt.vector3d(1, 0.62, 0.3)
            }
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
            clearColor: root.above ? "#10151f" : (root.underIce ? "#0a3640" : "#082d35")
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            fog: Fog {
                enabled: true
                color: root.above ? "#10151f" : (root.underIce ? "#0a3640" : "#082d35")
                density: 1
                depthEnabled: true
                depthNear: 3
                depthFar: root.above ? 45 : (root.underIce ? 22 : (root.swimming ? 48 : 30))
                depthCurve: 1.2
                heightEnabled: !root.above && !root.underIce
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
            color: root.above ? "#9fb4d8" : (root.underIce ? "#8fdde6" : "#7fd6e0")
            brightness: root.above ? 0.7 : (root.underIce ? 0.7 : 0.55)
            ambientColor: root.above ? "#20283a" : (root.underIce ? "#16424c" : "#143c46")
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
                position: Qt.vector3d(-1.5, 99.9, 1)
                eulerRotation.x: -90
                scale: Qt.vector3d(0.25, 0.36, 1)
                materials: WaterSurfaceMaterial {
                    time: root.time / 1000
                }
            }

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, 100, 0)
                eulerRotation.x: -90
                scale: Qt.vector3d(2.4, 2.4, 1)
                materials: snowGround
            }

            IceSlab {
                position: Qt.vector3d(0.1, 99.92, -0.6)
                eulerRotation.y: 8
                size: Qt.vector3d(7, 0.16, 6)
            }

            IceSlab {
                position: Qt.vector3d(-2.8, 99.92, 2.4)
                eulerRotation.y: 25
                size: Qt.vector3d(3.5, 0.16, 3)
            }

            IceSlab {
                position: Qt.vector3d(3, 99.92, 2.6)
                eulerRotation.y: -20
                size: Qt.vector3d(3, 0.16, 3.4)
            }

            IceSlab {
                position: Qt.vector3d(0, 99.92, -4.2)
                eulerRotation.y: -5
                size: Qt.vector3d(5, 0.16, 4)
            }

            IceSlab {
                position: Qt.vector3d(-4.6, 99.92, -1.5)
                eulerRotation.y: 40
                size: Qt.vector3d(2.2, 0.16, 1.6)
            }

            Model {
                source: "#Cube"
                position: Qt.vector3d(0, 100.29, -8.9)
                scale: Qt.vector3d(0.016, 0.0012, 0.133)
                materials: PrincipledMaterial {
                    baseColor: "#4a3a2c"
                    roughness: 0.85
                }
            }

            IceSlab {
                position: Qt.vector3d(0, 100.36, -8.9)
                size: Qt.vector3d(1.25, 0.03, 13.3)
            }

            Repeater3D {
                model: [
                    Qt.vector2d(-0.85, -2.6), Qt.vector2d(0.85, -2.6), Qt.vector2d(-0.85, -5.8), Qt.vector2d(0.85, -5.8),
                    Qt.vector2d(-0.85, -9), Qt.vector2d(0.85, -9), Qt.vector2d(-0.85, -12.2), Qt.vector2d(0.85, -12.2),
                    Qt.vector2d(-0.85, -15.2), Qt.vector2d(0.85, -15.2)
                ]

                delegate: Model {
                    required property vector2d modelData

                    source: "#Cylinder"
                    position: Qt.vector3d(modelData.x, 100.1, modelData.y)
                    scale: Qt.vector3d(0.0026, 0.013, 0.0026)
                    materials: PrincipledMaterial {
                        baseColor: "#33281f"
                        roughness: 0.9
                    }

                    Model {
                        source: "#Cylinder"
                        y: 51
                        scale: Qt.vector3d(1, 0.04, 1)
                        materials: PrincipledMaterial {
                            baseColor: "#eef3f7"
                            roughness: 0.8
                        }
                    }
                }
            }

            Node {
                y: Math.sin(root.time * 0.0011) * 0.02

                Model {
                    source: "#Cube"
                    instancing: RandomInstancing {
                        instanceCount: 22
                        randomSeed: 41
                        position: InstanceRange {
                            from: Qt.vector3d(-10, 99.9, -11)
                            to: Qt.vector3d(7, 99.9, 14)
                        }
                        scale: InstanceRange {
                            from: Qt.vector3d(0.012, 0.0012, 0.008)
                            to: Qt.vector3d(0.045, 0.0016, 0.03)
                        }
                        rotation: InstanceRange {
                            from: Qt.vector3d(0, 0, 0)
                            to: Qt.vector3d(0, 360, 0)
                        }
                    }
                    materials: PrincipledMaterial {
                        baseColor: "#d6e4ee"
                        roughness: 0.35
                    }
                }

                Model {
                    source: "#Cube"
                    instancing: RandomInstancing {
                        instanceCount: 14
                        randomSeed: 42
                        position: InstanceRange {
                            from: Qt.vector3d(-7, 99.9, -13)
                            to: Qt.vector3d(4, 99.9, -7)
                        }
                        scale: InstanceRange {
                            from: Qt.vector3d(0.008, 0.0012, 0.006)
                            to: Qt.vector3d(0.03, 0.0016, 0.02)
                        }
                        rotation: InstanceRange {
                            from: Qt.vector3d(0, 0, 0)
                            to: Qt.vector3d(0, 360, 0)
                        }
                    }
                    materials: PrincipledMaterial {
                        baseColor: "#e4edf4"
                        roughness: 0.4
                    }
                }

                Model {
                    source: "#Cube"
                    instancing: RandomInstancing {
                        instanceCount: 40
                        randomSeed: 43
                        position: InstanceRange {
                            from: Qt.vector3d(-8, 99.93, -9)
                            to: Qt.vector3d(5, 99.93, 12)
                        }
                        scale: InstanceRange {
                            from: Qt.vector3d(0.003, 0.002, 0.003)
                            to: Qt.vector3d(0.011, 0.004, 0.009)
                        }
                        rotation: InstanceRange {
                            from: Qt.vector3d(-8, 0, -8)
                            to: Qt.vector3d(8, 360, 8)
                        }
                    }
                    materials: PrincipledMaterial {
                        baseColor: "#f2f6fa"
                        roughness: 0.7
                    }
                }
            }

            Cabin {
                position: Qt.vector3d(-10, 100, -26)
                eulerRotation.y: 30
            }

            Cabin {
                position: Qt.vector3d(6, 100, -29)
                eulerRotation.y: -15
                width: 4.5
                height: 3
            }

            Cabin {
                position: Qt.vector3d(-1, 100, -35)
                eulerRotation.y: 8
                width: 5
                depth: 4
            }

            Repeater3D {
                model: [
                    Qt.vector4d(-1.4, 0.7, 25, 0.5), Qt.vector4d(1.7, 1.2, -18, 0.6), Qt.vector4d(0.5, 2.3, 40, 0.45),
                    Qt.vector4d(-1.1, 1.9, -30, 0.55), Qt.vector4d(1.5, 0.1, 12, 0.4), Qt.vector4d(-0.6, -0.3, -22, 0.35)
                ]

                delegate: Model {
                    required property vector4d modelData

                    source: "#Cube"
                    position: Qt.vector3d(modelData.x * 0.5 + 0.1, 99.93 + Math.sin(root.time * 0.002 + modelData.z) * 0.012, modelData.y * 0.45 + 0.8)
                    eulerRotation: Qt.vector3d(modelData.z * 0.2, modelData.z * 3, modelData.z * 0.3)
                    scale: Qt.vector3d(modelData.w * 0.008, 0.0012, modelData.w * 0.006)
                    materials: PrincipledMaterial {
                        baseColor: "#b9cbdc"
                        roughness: 0.25
                    }
                }
            }

            MittenModel {
                visible: root.time < root.pickAt
                position: Qt.vector3d(-0.22, 100.05, -0.55)
                eulerRotation: Qt.vector3d(90, 0, 30)
            }

            LanternModel {
                position: Qt.vector3d(-1.5, 100, -0.9)
                eulerRotation.y: 20
                post: false
                glow: root.lanternLevel
            }

            PointLight {
                position: Qt.vector3d(-1.5, 100.35, -0.9)
                color: "#ffb46a"
                brightness: 1.2 * root.lanternLevel * (1 + Math.sin(root.time * 0.011) * 0.05 + Math.sin(root.time * 0.027 + 1.3) * 0.04)
                quadraticFade: 260
            }

            LanternModel {
                position: Qt.vector3d(1.6, 100, -16.4)
            }

            LanternModel {
                position: Qt.vector3d(-7.2, 100, -23.2)
            }

            Woods { variant: 2; count: 12; seed: 61; from: Qt.vector3d(-34, 100, -26); to: Qt.vector3d(-17, 100, 26) }
            Woods { variant: 3; count: 12; seed: 62; from: Qt.vector3d(15, 100, -26); to: Qt.vector3d(34, 100, 26) }
            Woods { variant: 1; count: 14; seed: 63; from: Qt.vector3d(-34, 100, -62); to: Qt.vector3d(34, 100, -42) }
            Woods { variant: 3; count: 10; seed: 64; from: Qt.vector3d(-28, 100, 22); to: Qt.vector3d(28, 100, 36) }

            PineModel { position: Qt.vector3d(-14.5, 100, 0) }
            PineModel { position: Qt.vector3d(-16, 100, 9); variant: 3 }
            PineModel { position: Qt.vector3d(-13, 100, 15); variant: 1 }
            PineModel { position: Qt.vector3d(-15, 100, -7); variant: 4 }
            PineModel { position: Qt.vector3d(11.5, 100, -3); variant: 2 }
            PineModel { position: Qt.vector3d(13.5, 100, 7); variant: 4 }
            PineModel { position: Qt.vector3d(10.5, 100, 14.5); variant: 3 }
            PineModel { position: Qt.vector3d(14, 100, -10) }
            PineModel { position: Qt.vector3d(-8, 100, 19.5); variant: 3 }
            PineModel { position: Qt.vector3d(4, 100, 20.5); variant: 1 }
            PineModel { position: Qt.vector3d(9, 100, 18.5); variant: 4 }

            RockModel { position: Qt.vector3d(-12.3, 100, -3); eulerRotation.y: 70; scale: Qt.vector3d(2.2, 2, 2.2) }
            RockModel { position: Qt.vector3d(-12.6, 100, 8); eulerRotation.y: 150; variant: 1; scale: Qt.vector3d(1.6, 1.6, 1.6) }
            RockModel { position: Qt.vector3d(-11.2, 100, -10.5); eulerRotation.y: 20; variant: 1; scale: Qt.vector3d(1.1, 1.1, 1.1) }
            RockModel { position: Qt.vector3d(9.6, 100, 2); eulerRotation.y: 240; variant: 1; scale: Qt.vector3d(1.8, 1.8, 1.8) }
            RockModel { position: Qt.vector3d(9.7, 100, 11); eulerRotation.y: 300; scale: Qt.vector3d(1.4, 1.2, 1.4) }
            RockModel { position: Qt.vector3d(-2, 100, 18.6); eulerRotation.y: 10; scale: Qt.vector3d(2.6, 2.2, 2.6) }
            RockModel { position: Qt.vector3d(6, 100, 18); eulerRotation.y: 80; variant: 1; scale: Qt.vector3d(1.3, 1.3, 1.3) }

            StumpModel { position: Qt.vector3d(10.6, 100, -6) }
            FenceModel { position: Qt.vector3d(10.4, 100, 5.5); eulerRotation.y: 95; variant: 1 }
            LogStackModel { position: Qt.vector3d(-12.5, 100, -11.5); eulerRotation.y: 60 }
            GrassModel { position: Qt.vector3d(-12.4, 100, 3) }
            GrassModel { position: Qt.vector3d(10.2, 100, -1) }
            GrassModel { position: Qt.vector3d(3, 100, 18) }

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
                position: Qt.vector3d(-4.2, 100, -17.6)
                eulerRotation.y: 40
            }

            RockModel {
                position: Qt.vector3d(5.4, 100, -18.5)
                eulerRotation.y: 210
                variant: 1
            }

            StumpModel {
                position: Qt.vector3d(3.2, 100, -17.2)
                scale: Qt.vector3d(1.4, 1.4, 1.4)
            }

            FenceModel {
                position: Qt.vector3d(-6.5, 100, -16.8)
                eulerRotation.y: 75
            }

            PineModel {
                position: Qt.vector3d(-14, 100, -21)
            }

            PineModel {
                position: Qt.vector3d(12, 100, -23)
                variant: 1
            }

            PineModel {
                position: Qt.vector3d(-6, 100, -40)
                variant: 2
            }

            PineModel {
                position: Qt.vector3d(17, 100, -19)
                variant: 3
            }

            PineModel {
                position: Qt.vector3d(8, 100, -38)
                variant: 3
            }
        }

        Node {
            visible: root.stage >= 6 && root.underIce

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, 54, 0)
                eulerRotation.x: 90
                scale: Qt.vector3d(1.4, 1.4, 1)
                castsShadows: false
                receivesShadows: false
                materials: PrincipledMaterial {
                    baseColor: "#1f5f6a"
                    roughness: 0.4
                    cullMode: Material.NoCulling
                    emissiveFactor: Qt.vector3d(0.16, 0.38, 0.42)
                    emissiveMap: Texture {
                        source: Assets.url + "textures/lake/water_height.png"
                        tilingModeHorizontal: Texture.Repeat
                        tilingModeVertical: Texture.Repeat
                        scaleU: 7
                        scaleV: 7

                        NumberAnimation on positionU {
                            loops: Animation.Infinite
                            from: 0
                            to: 1
                            duration: 26000
                        }
                    }
                }
            }

            Model {
                source: "#Cylinder"
                position: Qt.vector3d(0.3, 53.98, 1.6)
                scale: Qt.vector3d(0.03, 0.0002, 0.026)
                castsShadows: false
                materials: PrincipledMaterial {
                    baseColor: "#000000"
                    emissiveFactor: Qt.vector3d(0.5, 0.72, 0.76)
                }
            }

            Model {
                source: "#Cube"
                castsShadows: false
                instancing: RandomInstancing {
                    instanceCount: 28
                    randomSeed: 72
                    position: InstanceRange {
                        from: Qt.vector3d(-16, 53.8, -26)
                        to: Qt.vector3d(16, 53.8, 8)
                    }
                    scale: InstanceRange {
                        from: Qt.vector3d(0.016, 0.004, 0.012)
                        to: Qt.vector3d(0.05, 0.006, 0.035)
                    }
                    rotation: InstanceRange {
                        from: Qt.vector3d(0, 0, 0)
                        to: Qt.vector3d(0, 360, 0)
                    }
                }
                materials: PrincipledMaterial {
                    baseColor: "#6fa3ab"
                    roughness: 0.3
                    emissiveFactor: Qt.vector3d(0.14, 0.27, 0.3)
                }
            }

            Model {
                source: "#Cube"
                castsShadows: false
                instancing: RandomInstancing {
                    instanceCount: 40
                    randomSeed: 73
                    position: InstanceRange {
                        from: Qt.vector3d(-12, 53.85, -20)
                        to: Qt.vector3d(12, 53.85, 6)
                    }
                    scale: InstanceRange {
                        from: Qt.vector3d(0.004, 0.003, 0.004)
                        to: Qt.vector3d(0.012, 0.005, 0.01)
                    }
                    rotation: InstanceRange {
                        from: Qt.vector3d(-6, 0, -6)
                        to: Qt.vector3d(6, 360, 6)
                    }
                }
                materials: PrincipledMaterial {
                    baseColor: "#7eb0b6"
                    roughness: 0.5
                    emissiveFactor: Qt.vector3d(0.16, 0.3, 0.33)
                }
            }

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, 44, 0)
                eulerRotation.x: -90
                scale: Qt.vector3d(1.4, 1.4, 1)
                materials: PrincipledMaterial {
                    baseColor: "#a9bcb2"
                    roughness: 1
                    baseColorMap: Texture {
                        source: Assets.url + "textures/temple/floor_diffuse.jpg"
                        scaleU: 28
                        scaleV: 28
                    }
                }
            }

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, 44.02, 0)
                eulerRotation.x: -90
                scale: Qt.vector3d(1.4, 1.4, 1)
                castsShadows: false
                receivesShadows: false
                materials: PrincipledMaterial {
                    alphaMode: PrincipledMaterial.Blend
                    baseColor: "#000000"
                    emissiveFactor: Qt.vector3d(0.5, 0.89, 0.94)
                    specularAmount: 0
                    opacity: 0.24
                    opacityChannel: Material.R
                    depthDrawMode: Material.NeverDepthDraw
                    opacityMap: Texture {
                        source: Assets.url + "textures/temple/caustics/caust00.png"
                        tilingModeHorizontal: Texture.Repeat
                        tilingModeVertical: Texture.Repeat
                        scaleU: 22
                        scaleV: 22

                        NumberAnimation on positionU {
                            loops: Animation.Infinite
                            from: 0
                            to: 1
                            duration: 21000
                        }

                        NumberAnimation on positionV {
                            loops: Animation.Infinite
                            from: 0
                            to: 1
                            duration: 29000
                        }
                    }
                }
            }

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, 44.03, 0)
                eulerRotation.x: -90
                scale: Qt.vector3d(1.4, 1.4, 1)
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
                        scaleU: 15
                        scaleV: 15

                        NumberAnimation on positionU {
                            loops: Animation.Infinite
                            from: 1
                            to: 0
                            duration: 33000
                        }

                        NumberAnimation on positionV {
                            loops: Animation.Infinite
                            from: 1
                            to: 0
                            duration: 23000
                        }
                    }
                }
            }

            Repeater3D {
                model: [
                    Qt.vector4d(-3.2, -6, 1.1, 0), Qt.vector4d(4.5, -9, 1.4, 1), Qt.vector4d(-6, -14, 1.8, 2), Qt.vector4d(2.2, -3.5, 0.7, 3),
                    Qt.vector4d(7.5, -16, 2, 4), Qt.vector4d(-1.5, -11, 0.9, 5), Qt.vector4d(-9, -4, 1.3, 6), Qt.vector4d(5.8, 1.5, 0.8, 7),
                    Qt.vector4d(-4.6, 3, 0.6, 8), Qt.vector4d(0.6, -18, 1.6, 9)
                ]

                delegate: Model {
                    required property vector4d modelData

                    source: "#Sphere"
                    position: Qt.vector3d(modelData.x, 44 + modelData.z * 0.28, modelData.y)
                    eulerRotation.y: modelData.w * 37
                    scale: Qt.vector3d(modelData.z * 0.011, modelData.z * 0.0075, modelData.z * 0.0095)
                    materials: PrincipledMaterial {
                        baseColor: modelData.w % 3 === 0 ? "#5d6b62" : (modelData.w % 3 === 1 ? "#7a7b6c" : "#4c5a5e")
                        roughness: 0.75
                    }
                }
            }

            RockModel {
                position: Qt.vector3d(-7.5, 44, -9)
                eulerRotation.y: 30
                scale: Qt.vector3d(2.4, 1.8, 2.4)
            }

            RockModel {
                position: Qt.vector3d(9, 44, -6)
                eulerRotation.y: 200
                variant: 1
                scale: Qt.vector3d(2, 2, 2)
            }

            SeaweedModel {
                id: lakeWeed

                instancing: RandomInstancing {
                    instanceCount: 18
                    randomSeed: 71
                    position: InstanceRange {
                        from: Qt.vector3d(-14, 44 + lakeWeed.meshLift * lakeWeed.meshScale, -22)
                        to: Qt.vector3d(14, 44 + lakeWeed.meshLift * lakeWeed.meshScale, 4)
                    }
                    scale: InstanceRange {
                        from: Qt.vector3d(lakeWeed.meshScale * 0.6, lakeWeed.meshScale * 0.6, lakeWeed.meshScale * 0.6)
                        to: Qt.vector3d(lakeWeed.meshScale * 0.9, lakeWeed.meshScale * 0.9, lakeWeed.meshScale * 0.9)
                        proportional: true
                    }
                    rotation: InstanceRange {
                        from: Qt.vector3d(0, 0, 0)
                        to: Qt.vector3d(0, 360, 0)
                    }
                }
            }

            Model {
                source: "#Cylinder"
                position: Qt.vector3d(0, 44.04, -12)
                scale: Qt.vector3d(0.075, 0.0002, 0.055)
                castsShadows: false
                materials: PrincipledMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    baseColor: "#010607"
                }
            }

            Model {
                source: "#Cylinder"
                position: Qt.vector3d(0, 44.05, -12)
                scale: Qt.vector3d(0.088, 0.0002, 0.068)
                castsShadows: false
                materials: PrincipledMaterial {
                    baseColor: "#13262a"
                    roughness: 1
                }
            }

            Repeater3D {
                model: [
                    Qt.vector4d(-4.6, -11, 0, 2.6), Qt.vector4d(4.4, -12.5, 1, 2.4), Qt.vector4d(-2.6, -15.4, 0, 3),
                    Qt.vector4d(2.8, -15.2, 1, 2.8), Qt.vector4d(-4.2, -8.6, 1, 1.6), Qt.vector4d(3.9, -9, 0, 1.8),
                    Qt.vector4d(0.4, -16.6, 0, 3.2)
                ]

                delegate: RockModel {
                    required property vector4d modelData

                    position: Qt.vector3d(modelData.x, 44, modelData.y)
                    eulerRotation.y: modelData.x * 40 + modelData.y * 13
                    variant: modelData.z
                    scale: Qt.vector3d(modelData.w, modelData.w * 0.9, modelData.w)
                }
            }

            SpotLight {
                position: Qt.vector3d(0.3, 54, 1.6)
                eulerRotation.x: -90
                color: "#e6f6ff"
                brightness: 3
                coneAngle: 35
                innerConeAngle: 12
                quadraticFade: 1
            }
        }

        HeroModel {
            id: hero

            eulerRotation: Qt.vector3d(root.swimming ? root.swimPitch : 0, root.above ? 0 : 180, 0)
            mitten: root.above && root.time >= root.pickAt
            clip: root.above ? (root.time < root.kneelAt ? "looking_around" : (root.time < 11200 ? "kneeling_down" : "breathing_idle")) : (root.swimming ? (root.underIce ? "swimming" : "treading_water") : (root.dive < 6000 ? "swimming" : (root.dive < 11030 ? "swimming_to_edge" : "swimming")))
            loop: clip === "swimming" || clip === "walking" || clip === "treading_water" || clip === "breathing_idle"
            time: root.above ? (root.time < root.kneelAt ? root.time : (root.time < 11200 ? root.time - root.kneelAt : root.time - 11200)) : (root.swimming ? (root.underIce ? root.swim : root.swim - 6000) : (root.dive < 6000 ? root.dive : (root.dive < 11030 ? Math.max(0, root.dive - 6001) : Math.max(0, root.dive - 11031) * 0.6)))
        }

        Model {
            source: "#Sphere"
            position: Qt.vector3d(0, 0, -15)
            scale: Qt.vector3d(1.4, 1.4, 1.4)
            castsShadows: false
            receivesShadows: false
            materials: PrincipledMaterial {
                lighting: PrincipledMaterial.NoLighting
                baseColor: root.underIce ? "#0a3640" : "#082d35"
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

            Repeater3D {
                model: [Qt.vector3d(-5, 0, -16), Qt.vector3d(7.5, 0, -17.5), Qt.vector3d(-9.5, 0, -21)]

                delegate: Node {
                    required property vector3d modelData

                    position: modelData

                    Model {
                        source: "#Cone"
                        scale: Qt.vector3d(0.012, 0.005, 0.012)
                        materials: PrincipledMaterial {
                            baseColor: "#1c2a2c"
                            roughness: 1
                        }
                    }

                    Model {
                        source: "#Cylinder"
                        y: 0.42
                        scale: Qt.vector3d(0.0016, 0.0004, 0.0016)
                        materials: PrincipledMaterial {
                            baseColor: "#000000"
                            emissiveFactor: Qt.vector3d(1, 0.5, 0.18)
                        }
                    }
                }
            }

            Repeater3D {
                model: [
                    Qt.vector4d(-6, -18, 4.5, 1), Qt.vector4d(5.5, -14, 3.6, 0.8), Qt.vector4d(-11, -27, 5, 1.2),
                    Qt.vector4d(11.5, -24, 4.2, 1), Qt.vector4d(-2.5, -8, 3, 0.7), Qt.vector4d(8, -31, 5.5, 1.3),
                    Qt.vector4d(-14, -16, 4.8, 1.1), Qt.vector4d(14, -9, 3.8, 0.9), Qt.vector4d(2.5, -36, 6, 1.4)
                ]

                delegate: Model {
                    required property vector4d modelData

                    source: "#Cone"
                    position: Qt.vector3d(modelData.x, 15, modelData.y)
                    eulerRotation.x: 180
                    scale: Qt.vector3d(modelData.w * 0.02, modelData.z * 0.01, modelData.w * 0.02)
                    materials: PrincipledMaterial {
                        baseColor: "#122a2e"
                        roughness: 1
                    }
                }
            }

            Repeater3D {
                model: [
                    Qt.vector4d(6.02, 7.62, 5.18, 2.18), Qt.vector4d(6.05, 8.7, 4.84, 2.64), Qt.vector4d(5.31, 9.86, 4.44, 2.61),
                    Qt.vector4d(3.56, 10.8, 4.51, 2.08), Qt.vector4d(2.02, 11.57, 4.55, 2.99), Qt.vector4d(0.43, 11.52, 5.54, 2.75),
                    Qt.vector4d(-1.65, 10.92, 5.57, 2.48), Qt.vector4d(-2.7, 10.58, 4.75, 3.03), Qt.vector4d(-3.55, 9.28, 4.77, 2.14),
                    Qt.vector4d(-4.03, 7.48, 5.1, 2.22), Qt.vector4d(-3.76, 6.18, 5.06, 2.45), Qt.vector4d(-3.14, 5.46, 4.65, 2.07),
                    Qt.vector4d(-1.38, 3.94, 4.78, 2.51), Qt.vector4d(0.21, 3.49, 4.76, 2.54), Qt.vector4d(2.28, 3.46, 4.69, 2.84),
                    Qt.vector4d(3.68, 4.03, 5.45, 2.63), Qt.vector4d(5.07, 5.23, 5.58, 2.35), Qt.vector4d(5.66, 5.94, 5.31, 2.5),
                    Qt.vector4d(6.91, 7.09, 0.66, 2.99), Qt.vector4d(6.68, 9.01, 1.52, 3.32), Qt.vector4d(5.41, 10.23, 1.71, 2.78),
                    Qt.vector4d(4.4, 11.02, 1.33, 3.1), Qt.vector4d(2.42, 11.82, 1.36, 3.53), Qt.vector4d(0.77, 11.54, 1.72, 2.47),
                    Qt.vector4d(-1.11, 11.69, 1.92, 3.59), Qt.vector4d(-2.21, 11.01, 1.67, 2.86), Qt.vector4d(-3.36, 10.36, 0.87, 2.95),
                    Qt.vector4d(-4.27, 9.1, 1.83, 2.47), Qt.vector4d(-4.8, 7.87, 1.23, 2.7), Qt.vector4d(-4.29, 5.64, 1.32, 2.5),
                    Qt.vector4d(-3.9, 4.44, 1.91, 3.46), Qt.vector4d(-2.01, 3.35, 1.26, 2.73), Qt.vector4d(-1.09, 2.69, 2.13, 3.46),
                    Qt.vector4d(0.52, 2.72, 0.97, 2.61), Qt.vector4d(2.47, 2.72, 1.54, 2.98), Qt.vector4d(4.09, 3.53, 1.27, 2.4),
                    Qt.vector4d(5.72, 4.45, 2.12, 3.08), Qt.vector4d(6.73, 6.19, 1.59, 3.02)
                ]

                delegate: Model {
                    required property vector4d modelData
                    required property int index

                    source: Assets.url + (index % 2 === 0 ? "models/rock_large/meshes/rock_largeA_mesh.mesh" : "models/rock_tall/meshes/rock_tallA_mesh.mesh")
                    position: Qt.vector3d(modelData.x, modelData.y - modelData.w * 0.4, modelData.z)
                    eulerRotation: Qt.vector3d(index * 37, index * 53, index * 29)
                    scale: Qt.vector3d(modelData.w * 1.1, modelData.w * 0.9, modelData.w * 1.0)
                    materials: PrincipledMaterial {
                        baseColor: index % 3 === 0 ? "#1c2a2c" : "#122a2e"
                        roughness: 1
                        normalStrength: 1.4
                        normalMap: Texture {
                            source: Assets.url + "textures/temple/wall_normal.jpg"
                            scaleU: 2
                            scaleV: 2
                        }
                    }
                }
            }

            Repeater3D {
                model: [Qt.vector4d(-0.6, -34, 8, 1.1), Qt.vector4d(1.6, -30, -6, 0.8), Qt.vector4d(3.4, -38, -14, 1.3)]

                delegate: Model {
                    required property vector4d modelData

                    source: "#Cube"
                    position: Qt.vector3d(modelData.x, 6.5, -4)
                    eulerRotation: Qt.vector3d(modelData.y, modelData.z, 0)
                    scale: Qt.vector3d(modelData.w * 0.01, 0.16, modelData.w * 0.004)
                    castsShadows: false
                    receivesShadows: false
                    materials: PrincipledMaterial {
                        alphaMode: PrincipledMaterial.Blend
                        baseColor: "#000000"
                        emissiveFactor: Qt.vector3d(0.5, 0.89, 0.94)
                        specularAmount: 0
                        opacity: 0.05
                        depthDrawMode: Material.NeverDepthDraw
                        cullMode: Material.NoCulling
                    }
                }
            }

            Model {
                source: "#Rectangle"
                position: Qt.vector3d(0, 15, -15)
                eulerRotation.x: 90
                scale: Qt.vector3d(1.4, 1.4, 1)
                materials: PrincipledMaterial {
                    baseColor: "#0d2226"
                    roughness: 1
                    cullMode: Material.NoCulling
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

                ParticleEmitter3D {
                    particle: bubble
                    position: Qt.vector3d(7.5, 0.3, -17.5)
                    shape: ParticleShape3D {
                        type: ParticleShape3D.Sphere
                        extents: Qt.vector3d(0.15, 0.05, 0.15)
                    }
                    emitRate: 9
                    lifeSpan: 6000
                    particleScale: 1
                    particleScaleVariation: 0.6
                    velocity: VectorDirection3D {
                        direction: Qt.vector3d(0, 1, 0)
                        directionVariation: Qt.vector3d(0.05, 0.15, 0.05)
                    }
                }

                ParticleEmitter3D {
                    particle: bubble
                    position: Qt.vector3d(-9.5, 0.3, -21)
                    shape: ParticleShape3D {
                        type: ParticleShape3D.Sphere
                        extents: Qt.vector3d(0.15, 0.05, 0.15)
                    }
                    emitRate: 9
                    lifeSpan: 6000
                    particleScale: 1
                    particleScaleVariation: 0.6
                    velocity: VectorDirection3D {
                        direction: Qt.vector3d(0, 1, 0)
                        directionVariation: Qt.vector3d(0.05, 0.15, 0.05)
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
