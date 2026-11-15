import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property real glow: 1

    PrincipledMaterial {
        id: wood

        baseColor: "#6b4428"
        roughness: 0.9
    }

    PrincipledMaterial {
        id: darkWood

        baseColor: "#3e2716"
        roughness: 0.95
    }

    PrincipledMaterial {
        id: iron

        baseColor: "#1d1a17"
        metalness: 0.6
        roughness: 0.5
    }

    Model {
        source: "#Rectangle"
        position: Qt.vector3d(0, 1.2, 0.012)
        scale: Qt.vector3d(0.016, 0.024, 1)
        castsShadows: false
        receivesShadows: false
        materials: PrincipledMaterial {
            lighting: PrincipledMaterial.NoLighting
            baseColor: "#020101"
        }
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(-0.98, 1.3, 0.18)
        scale: Qt.vector3d(0.0034, 0.026, 0.0034)
        materials: wood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(0.98, 1.3, 0.18)
        scale: Qt.vector3d(0.0034, 0.026, 0.0034)
        materials: wood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(-0.98, 0.12, 0.22)
        scale: Qt.vector3d(0.0046, 0.0024, 0.0046)
        materials: darkWood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(0.98, 0.12, 0.22)
        scale: Qt.vector3d(0.0046, 0.0024, 0.0046)
        materials: darkWood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(0, 2.74, 0.2)
        scale: Qt.vector3d(0.028, 0.0036, 0.004)
        materials: wood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(0, 2.48, 0.24)
        scale: Qt.vector3d(0.022, 0.0016, 0.003)
        materials: darkWood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(-1.32, 2.74, 0.22)
        scale: Qt.vector3d(0.0036, 0.0024, 0.0042)
        materials: darkWood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(1.32, 2.74, 0.22)
        scale: Qt.vector3d(0.0036, 0.0024, 0.0042)
        materials: darkWood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(-0.72, 2.3, 0.26)
        eulerRotation.z: 45
        scale: Qt.vector3d(0.0055, 0.0016, 0.0022)
        materials: darkWood
    }

    Model {
        source: "#Cube"
        position: Qt.vector3d(0.72, 2.3, 0.26)
        eulerRotation.z: -45
        scale: Qt.vector3d(0.0055, 0.0016, 0.0022)
        materials: darkWood
    }

    Repeater3D {
        model: [-0.62, 0.62]

        delegate: Node {
            required property real modelData

            position: Qt.vector3d(modelData, 2.36, 0.38)

            Model {
                source: "#Cylinder"
                y: 0.08
                scale: Qt.vector3d(0.0012, 0.0016, 0.0012)
                materials: iron
            }

            Model {
                source: "#Cube"
                y: -0.08
                scale: Qt.vector3d(0.0016, 0.0004, 0.0016)
                materials: iron
            }

            Model {
                source: "#Cube"
                y: -0.2
                scale: Qt.vector3d(0.0012, 0.002, 0.0012)
                materials: PrincipledMaterial {
                    baseColor: "#000000"
                    emissiveFactor: Qt.vector3d(1, 0.66, 0.34).times(root.glow)
                }
            }

            Model {
                source: "#Cube"
                y: -0.32
                scale: Qt.vector3d(0.0016, 0.0004, 0.0016)
                materials: iron
            }

            PointLight {
                y: -0.2
                color: "#ffb46a"
                brightness: 0.5 * root.glow
                quadraticFade: 600
            }
        }
    }
}
