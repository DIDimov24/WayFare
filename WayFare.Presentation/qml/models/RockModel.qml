import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    property int variant: 0

    source: Assets.url + (variant === 1 ? "models/rock_tall/meshes/rock_tallA_mesh.mesh" : "models/rock_large/meshes/rock_largeA_mesh.mesh")
    materials: [stone, snow, stone]

    PrincipledMaterial {
        id: stone
        baseColor: "#4a4f58"
        roughness: 1
    }

    PrincipledMaterial {
        id: snow
        baseColor: "#d6dce6"
        roughness: 0.8
    }
}
