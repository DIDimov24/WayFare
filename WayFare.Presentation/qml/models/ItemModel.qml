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
        active: root.item !== "diving_gear"
        source: Assets.url + root.modelPath()
        position: root.modelOffset()
        scale: Qt.vector3d(root.modelScale(), root.modelScale(), root.modelScale())
    }

    Node {
        visible: root.item === "diving_gear"

        ScubaGearModel {
            position: Qt.vector3d(-0.05, -0.02, -0.04)
            scale: Qt.vector3d(0.5, 0.5, 0.5)
        }

        Model {
            source: Assets.url + "models/dive_mask/meshes/dive_mask.mesh"
            position: Qt.vector3d(-0.02, -1.94, 0.4)
            scale: Qt.vector3d(0.6, 0.6, 0.6)
            materials: PrincipledMaterial {
                baseColor: "#15181c"
                roughness: 0.45
                cullMode: Material.NoCulling
            }
        }

        Model {
            source: Assets.url + "models/dive_fins/meshes/dive_fin_left.mesh"
            position: Qt.vector3d(-0.55, -0.4, -0.12)
            eulerRotation.z: -15
            scale: Qt.vector3d(0.5, 0.5, 0.5)
            materials: PrincipledMaterial {
                baseColor: "#0f2f42"
                roughness: 0.45
                cullMode: Material.NoCulling
            }
        }

        Model {
            source: Assets.url + "models/dive_fins/meshes/dive_fin_right.mesh"
            position: Qt.vector3d(0.55, -0.4, -0.12)
            eulerRotation.z: 15
            scale: Qt.vector3d(0.5, 0.5, 0.5)
            materials: PrincipledMaterial {
                baseColor: "#0f2f42"
                roughness: 0.45
                cullMode: Material.NoCulling
            }
        }
    }
}
