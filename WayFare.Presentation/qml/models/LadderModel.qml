import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    property real height: 3

    source: Assets.url + "models/ladder_long/meshes/ladder_long_mesh.mesh"
    scale: Qt.vector3d(root.height / 2, root.height / 2, root.height / 2)
    materials: PrincipledMaterial {
        baseColor: "#5b4434"
        roughness: 0.9
        cullMode: Material.NoCulling
    }
}
