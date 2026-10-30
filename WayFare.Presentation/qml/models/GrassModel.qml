import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    source: Assets.url + "models/grass_large/meshes/mesh_grass_large_mesh.mesh"
    scale: Qt.vector3d(2, 2, 2)
    materials: grass

    PrincipledMaterial {
        id: grass
        baseColor: "#3f3a2d"
        roughness: 1
    }
}
