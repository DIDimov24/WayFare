import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property string item: "potion"

    function modelPath(): string {
        switch (root.item) {
            case "diving_gear":
                return "models/diving_gear/DivingGear.qml"
            case "sword":
                return "models/sword/Sword.qml"
            case "pistol":
                return "models/pistol/Pistol.qml"
            default:
                return "models/potion/Potion.qml"
        }
    }

    function modelScale(): real {
        switch (root.item) {
            case "diving_gear":
                return 0.6
            case "sword":
                return 0.35
            case "pistol":
                return 0.3
            default:
                return 0.55
        }
    }

    function modelOffset(): vector3d {
        switch (root.item) {
            case "diving_gear":
                return Qt.vector3d(0, 0.2, 0)
            case "sword":
                return Qt.vector3d(0, -0.18, 0)
            case "pistol":
                return Qt.vector3d(-0.16, 0, 0)
            default:
                return Qt.vector3d(0, -0.24, 0)
        }
    }

    Loader3D {
        source: Assets.url + root.modelPath()
        position: root.modelOffset()
        scale: Qt.vector3d(root.modelScale(), root.modelScale(), root.modelScale())
    }
}
