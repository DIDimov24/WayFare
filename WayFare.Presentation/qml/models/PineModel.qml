import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    property int variant: 0

    source: Assets.url + meshPath()
    scale: Qt.vector3d(6, 6, 6)
    materials: variant === 0 ? [bark, needles] : [needles, bark]

    function meshPath(): string {
        switch (variant) {
            case 1: 
                return "models/pine_tall_b/meshes/tree_pineTallB_detailed_mesh.mesh"
            case 2:
                return "models/pine_tall_c/meshes/tree_pineTallC_detailed_mesh.mesh"
            case 3:
                return "models/pine_default/meshes/tree_pineDefaultA_mesh.mesh"
            case 4:
                return "models/pine_small/meshes/tree_pineSmallA_mesh.mesh"
            default:
                return "models/pine_tall_a/meshes/tree_pineTallA_detailed_mesh.mesh"
        }
    }

    PrincipledMaterial {
        id: bark
        baseColor: "#2e241d"
        roughness: 1
    }

    PrincipledMaterial {
        id: needles
        baseColor: "#33433c"
        roughness: 0.9
    }
}
