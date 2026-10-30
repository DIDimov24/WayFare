import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    source: Assets.url + "models/log_stack/meshes/log_stack_mesh.mesh"
    scale: Qt.vector3d(3, 3, 3)
    materials: [bark, inner]

    PrincipledMaterial {
        id: bark
        baseColor: "#3b2c22"
        roughness: 1
    }

    PrincipledMaterial {
        id: inner
        baseColor: "#7a5e44"
        roughness: 1
    }
}
