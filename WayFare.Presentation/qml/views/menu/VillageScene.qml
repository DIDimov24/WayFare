import QtQuick
import QtQuick.Shapes
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.Particles3D
import wayfare.presentation

Item {
    id: root

    property int stage: 0
    readonly property int lastStage: 15

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.Color
            clearColor: "#384152"
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            fog: Fog {
                enabled: true
                color: "#384152"
                density: 0.9
                depthEnabled: true
                depthNear: 12
                depthFar: 190
                depthCurve: 0.7
            }
        }

        PerspectiveCamera {
            position: Qt.vector3d(0, 1.8, 14)
            eulerRotation.x: -4
            fieldOfView: 50
            clipNear: 0.05
            clipFar: 500

            SequentialAnimation on eulerRotation.y {
                loops: Animation.Infinite
                NumberAnimation { from: -1.5; to: 1.5; duration: 20000; easing.type: Easing.InOutSine }
                NumberAnimation { from: 1.5; to: -1.5; duration: 20000; easing.type: Easing.InOutSine }
            }
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-25, 150, 0)
            color: "#a4b6da"
            brightness: 1.2
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-30, -20, 0)
            color: "#5a6680"
            brightness: 0.7
        }

        PrincipledMaterial {
            id: snowMaterial
            baseColorMap: Texture {
                source: Assets.url + "textures/village/floor_diffuse.jpg"
                scaleU: 150
                scaleV: 150
            }
        }

        component Box: Model {
            property vector3d size: Qt.vector3d(1, 1, 1)
            source: "#Cube"
            scale: size.times(0.01)
        }

        component Cabin: Node {
            id: cabin

            property real width: 4
            property real depth: 3.5
            property real height: 2.6

            PrincipledMaterial {
                id: woodMaterial
                baseColor: "#6b5a4a"
            }

            PrincipledMaterial {
                id: roofMaterial
                baseColor: "#c9d0da"
                roughness: 0.9
            }

            PrincipledMaterial {
                id: darkMaterial
                baseColor: "#15110e"
                roughness: 0.8
            }

            Box {
                y: cabin.height / 2
                size: Qt.vector3d(cabin.width, cabin.height, cabin.depth)
                materials: woodMaterial
            }

            Box {
                y: cabin.height
                eulerRotation.z: 45
                size: Qt.vector3d(cabin.width / Math.SQRT2, cabin.width / Math.SQRT2, cabin.depth)
                materials: woodMaterial
            }

            Box {
                x: -(cabin.width / 2 + 0.3) / 2
                y: cabin.height + (cabin.width / 2 + 0.3) / 2
                eulerRotation.z: 45
                size: Qt.vector3d((cabin.width / 2 + 0.3) * Math.SQRT2, 0.15, cabin.depth + 0.5)
                materials: roofMaterial
            }

            Box {
                x: (cabin.width / 2 + 0.3) / 2
                y: cabin.height + (cabin.width / 2 + 0.3) / 2
                eulerRotation.z: -45
                size: Qt.vector3d((cabin.width / 2 + 0.3) * Math.SQRT2, 0.15, cabin.depth + 0.5)
                materials: roofMaterial
            }

            Box {
                x: -cabin.width / 4
                y: 1
                z: cabin.depth / 2
                size: Qt.vector3d(0.9, 2, 0.08)
                materials: darkMaterial
            }

            Box {
                x: cabin.width / 4
                y: 1.5
                z: cabin.depth / 2
                size: Qt.vector3d(0.7, 0.6, 0.06)
                materials: darkMaterial
            }
        }

        Model {
            visible: root.stage >= 1
            source: "#Rectangle"
            eulerRotation.x: -90
            scale: Qt.vector3d(6, 6, 1)
            materials: snowMaterial
        }

        Node {
            visible: root.stage >= 1

            RockModel {
                variant: 1
                position: Qt.vector3d(-80, -5, -125)
                eulerRotation.y: 20
                scale: Qt.vector3d(90, 32, 70)
            }

            RockModel {
                variant: 1
                position: Qt.vector3d(-20, -5, -150)
                eulerRotation.y: -10
                scale: Qt.vector3d(120, 42, 80)
            }

            RockModel {
                variant: 1
                position: Qt.vector3d(55, -5, -140)
                eulerRotation.y: 200
                scale: Qt.vector3d(110, 38, 80)
            }

            RockModel {
                variant: 1
                position: Qt.vector3d(110, -5, -115)
                eulerRotation.y: 160
                scale: Qt.vector3d(100, 30, 70)
            }
        }

        component Forest: PineModel {
            id: forest

            property int count: 10
            property int seed: 1
            property vector3d from
            property vector3d to
            property real minScale: 5
            property real maxScale: 8

            scale: Qt.vector3d(1, 1, 1)
            instancing: RandomInstancing {
                instanceCount: forest.count
                randomSeed: forest.seed
                position: InstanceRange {
                    from: forest.from
                    to: forest.to
                }
                scale: InstanceRange {
                    from: Qt.vector3d(forest.minScale * 1.5, forest.minScale, forest.minScale * 1.5)
                    to: Qt.vector3d(forest.maxScale * 1.5, forest.maxScale, forest.maxScale * 1.5)
                    proportional: true
                }
                rotation: InstanceRange {
                    from: Qt.vector3d(0, 0, 0)
                    to: Qt.vector3d(0, 360, 0)
                }
            }
        }

        Forest { visible: root.stage >= 2; variant: 2; count: 15; seed: 11; from: Qt.vector3d(-50, 0, -70); to: Qt.vector3d(50, 0, -32) }
        Forest { visible: root.stage >= 3; variant: 3; count: 15; seed: 12; from: Qt.vector3d(-50, 0, -70); to: Qt.vector3d(50, 0, -32) }
        Forest { visible: root.stage >= 4; variant: 4; count: 15; seed: 13; from: Qt.vector3d(-50, 0, -70); to: Qt.vector3d(50, 0, -32); minScale: 6; maxScale: 9 }
        Forest { visible: root.stage >= 5; variant: 3; count: 8; seed: 21; from: Qt.vector3d(-34, 0, -30); to: Qt.vector3d(-18, 0, -2) }
        Forest { visible: root.stage >= 6; variant: 2; count: 6; seed: 22; from: Qt.vector3d(-34, 0, -30); to: Qt.vector3d(-18, 0, -2) }
        Forest { visible: root.stage >= 7; variant: 2; count: 7; seed: 31; from: Qt.vector3d(9, 0, -32); to: Qt.vector3d(34, 0, -14) }
        Forest { visible: root.stage >= 8; variant: 3; count: 7; seed: 32; from: Qt.vector3d(9, 0, -32); to: Qt.vector3d(34, 0, -14) }
        Forest { visible: root.stage >= 9; variant: 4; count: 6; seed: 41; from: Qt.vector3d(15, 0, -12); to: Qt.vector3d(30, 0, -2); minScale: 5; maxScale: 7.5 }
        Forest { visible: root.stage >= 10; variant: 3; count: 35; seed: 51; from: Qt.vector3d(-80, 0, -120); to: Qt.vector3d(80, 0, -75); minScale: 6; maxScale: 9 }

        Node {
            visible: root.stage >= 11

            PineModel {
                variant: 4
                position: Qt.vector3d(-6.5, 0, -24)
                scale: Qt.vector3d(5, 5, 5)
            }

            PineModel {
                variant: 4
                position: Qt.vector3d(1.5, 0, -27)
                eulerRotation.y: 70
                scale: Qt.vector3d(7, 6, 7)
            }

            PineModel {
                variant: 3
                position: Qt.vector3d(8.5, 0, -27)
                eulerRotation.y: 20
                scale: Qt.vector3d(10, 7, 10)
            }
        }

        Node {
            visible: root.stage >= 12

            Cabin {
                position: Qt.vector3d(-3, 0, -20)
                eulerRotation.y: 18
                width: 5
                depth: 4
                height: 2.8
            }

            Cabin {
                position: Qt.vector3d(4, 0, -25)
                eulerRotation.y: -12
                width: 4.5
                height: 3
            }

            Cabin {
                position: Qt.vector3d(-9, 0, -16)
                eulerRotation.y: 35
                width: 3
                depth: 3
                height: 2.2
            }

            LogStackModel {
                position: Qt.vector3d(0.2, 0, -19)
                eulerRotation.y: 105
            }
        }

        Node {
            visible: root.stage >= 13

            FenceModel {
                position: Qt.vector3d(-14, 0, -11)
                eulerRotation.y: 6
            }

            FenceModel {
                position: Qt.vector3d(-11.1, 0, -10.6)
                eulerRotation.y: 14
                eulerRotation.z: 4
            }

            FenceModel {
                variant: 1
                position: Qt.vector3d(-6.5, 0, -12.5)
                eulerRotation.y: -5
            }

            FenceModel {
                position: Qt.vector3d(-3.6, 0, -13)
                eulerRotation.y: 3
                eulerRotation.z: -7
            }

            FenceModel {
                position: Qt.vector3d(7.5, 0, -15)
                eulerRotation.y: -22
            }

            FenceModel {
                position: Qt.vector3d(10.2, 0, -16.2)
                eulerRotation.y: -28
                eulerRotation.z: 5
            }

            FenceModel {
                variant: 1
                position: Qt.vector3d(14, 0, -18.5)
                eulerRotation.y: -15
            }

            StumpModel {
                position: Qt.vector3d(4, 0, -1)
                eulerRotation.y: 40
            }

            StumpModel {
                position: Qt.vector3d(-6.5, 0, 3)
            }

            RockModel {
                position: Qt.vector3d(-12, 0, 2)
                eulerRotation.y: -50
                scale: Qt.vector3d(3, 3, 3)
            }

            RockModel {
                variant: 1
                position: Qt.vector3d(17, 0, -3)
                eulerRotation.y: 40
                scale: Qt.vector3d(3, 2.5, 3)
            }
        }

        Node {
            visible: root.stage >= 14

            GrassModel {
                scale: Qt.vector3d(1, 1, 1)
                instancing: RandomInstancing {
                    instanceCount: 28
                    randomSeed: 71
                    position: InstanceRange {
                        from: Qt.vector3d(-10, 0, -8)
                        to: Qt.vector3d(16, 0, 8)
                    }
                    scale: InstanceRange {
                        from: Qt.vector3d(0.45, 1.1, 0.45)
                        to: Qt.vector3d(0.9, 2.2, 0.9)
                        proportional: true
                    }
                    rotation: InstanceRange {
                        from: Qt.vector3d(0, 0, 0)
                        to: Qt.vector3d(0, 360, 0)
                    }
                }
            }
        }

        ParticleSystem3D {
            visible: root.stage >= 15
            running: visible
            y: 8

            ModelParticle3D {
                id: snowflake
                maxAmount: 2000
                color: "#dfe6f0"
                delegate: Model {
                    source: "#Sphere"
                    scale: Qt.vector3d(0.0005, 0.0005, 0.0005)
                    materials: PrincipledMaterial {
                        baseColor: "#ffffff"
                        lighting: PrincipledMaterial.NoLighting
                    }
                }
            }

            ParticleEmitter3D {
                particle: snowflake
                z: -6
                shape: ParticleShape3D {
                    type: ParticleShape3D.Cube
                    extents: Qt.vector3d(16, 0.1, 10)
                }
                emitRate: 250
                lifeSpan: 8000
                velocity: VectorDirection3D {
                    direction: Qt.vector3d(0.4, -1.1, 0)
                    directionVariation: Qt.vector3d(0.3, 0.3, 0.3)
                }
            }

            Wander3D {
                globalAmount: Qt.vector3d(0.5, 0, 0.5)
                globalPace: Qt.vector3d(0.3, 0, 0.3)
            }
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.5
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#80080b12" }
            GradientStop { position: 1.0; color: "#00080b12" }
        }
    }

    Shape {
        x: parent.width * 0.68 - width / 2
        y: parent.height * 0.14 - height / 2
        width: parent.height * 0.9
        height: width

        ShapePath {
            strokeWidth: -1
            fillGradient: RadialGradient {
                centerX: root.height * 0.45
                centerY: root.height * 0.45
                centerRadius: root.height * 0.45
                focalX: centerX
                focalY: centerY
                GradientStop { position: 0.0; color: "#c0e6ecf7" }
                GradientStop { position: 0.08; color: "#80c9d3e6" }
                GradientStop { position: 0.35; color: "#257f8ba3" }
                GradientStop { position: 1.0; color: "#007f8ba3" }
            }

            startX: 0
            startY: 0
            PathLine { x: root.height * 0.9; y: 0 }
            PathLine { x: root.height * 0.9; y: root.height * 0.9 }
            PathLine { x: 0; y: root.height * 0.9 }
            PathLine { x: 0; y: 0 }
        }
    }
}
