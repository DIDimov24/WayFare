import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    readonly property real meshScale: 1.836
    readonly property real meshLift: 0.416

    source: Assets.url + "models/seaweed/meshes/node_Mesh_mesh.mesh"
    materials: weed

    PrincipledMaterial {
        id: weed
        baseColor: "#2a7a68"
        emissiveFactor: Qt.vector3d(0.03, 0.09, 0.08)
        roughness: 1
        cullMode: Material.NoCulling
    }
}
