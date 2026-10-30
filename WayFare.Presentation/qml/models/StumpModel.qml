import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    source: Assets.url + "models/stump_old/meshes/mesh_stump_old_mesh.mesh"
    scale: Qt.vector3d(3, 3, 3)
    materials: bark

    PrincipledMaterial {
        id: bark
        baseColor: "#3b2c22"
        roughness: 1
    }
}
