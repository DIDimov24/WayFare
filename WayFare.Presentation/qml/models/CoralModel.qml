import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    property int variant: 0
    readonly property real meshScale: variant === 1 ? 0.317 : 1.29
    readonly property real meshLift: variant === 1 ? 1.139 : 0.3

    source: Assets.url + (variant === 1 ? "models/fan_coral/meshes/mesh1533979519_mesh.mesh" : "models/orange_coral/meshes/group1965416314_mesh.mesh")
    materials: variant === 1 ? [fan] : [stem, tips]

    PrincipledMaterial {
        id: stem
        baseColor: "#a0786a"
        roughness: 1
    }

    PrincipledMaterial {
        id: tips
        baseColor: "#ff7a2e"
        roughness: 1
    }

    PrincipledMaterial {
        id: fan
        baseColor: "#e0508c"
        roughness: 1
        cullMode: Material.NoCulling
    }
}
