import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    source: Assets.url + "models/scuba_equipment/meshes/node_mesh.mesh"
    scale: Qt.vector3d(0.81, 0.81, 0.81)
    materials: [
        PrincipledMaterial { baseColor: "#191919"; roughness: 1 },
        PrincipledMaterial { baseColor: "#d9c530"; roughness: 0.8 },
        PrincipledMaterial { baseColor: "#a0a0a0"; roughness: 0.6 },
        PrincipledMaterial { baseColor: "#0f7fb5"; roughness: 1 },
        PrincipledMaterial { baseColor: "#ebf2f0"; roughness: 0.7; opacity: 0.4; alphaMode: PrincipledMaterial.Blend; cullMode: Material.NoCulling },
        PrincipledMaterial { baseColor: "#ffffff"; roughness: 1 }
    ]
}
