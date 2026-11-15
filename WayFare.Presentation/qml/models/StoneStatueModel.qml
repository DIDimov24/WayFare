import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    property string variant: "stand"
    property real size: 0.8

    source: Assets.url + "models/statues/meshes/statue_" + root.variant + ".mesh"
    scale: Qt.vector3d(root.size, root.size, root.size)
    materials: PrincipledMaterial {
        baseColor: "#84878d"
        roughness: 0.95
    }
}
