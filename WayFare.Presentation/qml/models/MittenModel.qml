import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property bool upsideDown: false
    property bool stone: false

    component MittenLabel: Model {
        source: "#Rectangle"
        scale: Qt.vector3d(0.001, 0.0005, 1)
        materials: PrincipledMaterial {
            roughness: 0.95
            baseColorMap: Texture {
                rotationUV: root.upsideDown ? 180 : 0
                pivotU: 0.5
                pivotV: 0.5
                sourceItem: Rectangle {
                    width: 128
                    height: 64
                    color: root.stone ? "#7f8288" : "#a8232b"

                    Text {
                        anchors.centerIn: parent
                        text: "Mila"
                        color: root.stone ? "#9a9da3" : "#f4efe6"
                        font.pixelSize: 40
                        font.bold: true
                    }
                }
            }
        }
    }

    Model {
        source: "#Sphere"
        scale: Qt.vector3d(0.0013, 0.0021, 0.0007)
        materials: PrincipledMaterial {
            baseColor: root.stone ? "#84878d" : "#b3262e"
            roughness: 0.95
        }
    }

    Model {
        source: "#Sphere"
        position: Qt.vector3d(0.07, -0.025, 0)
        eulerRotation.z: -30
        scale: Qt.vector3d(0.0005, 0.0009, 0.0005)
        materials: PrincipledMaterial {
            baseColor: root.stone ? "#84878d" : "#b3262e"
            roughness: 0.95
        }
    }

    Model {
        source: "#Cylinder"
        y: -0.11
        scale: Qt.vector3d(0.0014, 0.0005, 0.0008)
        materials: PrincipledMaterial {
            baseColor: root.stone ? "#84878d" : "#ece6dc"
            roughness: 0.95
        }
    }

    MittenLabel {
        z: 0.036
    }

    MittenLabel {
        z: -0.036
        eulerRotation.y: 180
    }
}
