import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property bool post: true
    property real glow: 1
    readonly property real lift: root.post ? 1.25 : 0.12

    Model {
        visible: root.post
        source: "#Cylinder"
        y: 0.6
        scale: Qt.vector3d(0.0016, 0.012, 0.0016)
        materials: PrincipledMaterial {
            baseColor: "#2b221b"
            roughness: 0.9
        }
    }

    Model {
        source: "#Cube"
        y: root.lift + 0.13
        scale: Qt.vector3d(0.0022, 0.0004, 0.0022)
        materials: PrincipledMaterial {
            baseColor: "#1d1a17"
            metalness: 0.6
            roughness: 0.5
        }
    }

    Model {
        source: "#Cube"
        y: root.lift
        scale: Qt.vector3d(0.0016, 0.0022, 0.0016)
        materials: PrincipledMaterial {
            baseColor: "#000000"
            emissiveFactor: Qt.vector3d(1, 0.66, 0.34).times(root.glow)
        }
    }

    Model {
        source: "#Cube"
        y: root.lift - 0.13
        scale: Qt.vector3d(0.0022, 0.0004, 0.0022)
        materials: PrincipledMaterial {
            baseColor: "#1d1a17"
            metalness: 0.6
            roughness: 0.5
        }
    }
}
