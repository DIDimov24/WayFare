import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    property int variant: 0

    source: Assets.url + (variant === 1 ? "models/fence_planks/meshes/mesh_fence_planks_mesh.mesh" : "models/fence_simple/meshes/fence_simple_mesh.mesh")
    scale: Qt.vector3d(3, 3, 3)
    materials: [wood, darkWood]

    PrincipledMaterial {
        id: wood
        baseColor: "#4d3c2e"
        roughness: 1
    }

    PrincipledMaterial {
        id: darkWood
        baseColor: "#33281f"
        roughness: 1
    }
}
