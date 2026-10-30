import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: wood_material
        objectName: "wood"
        baseColor: "#ffffc5a6"
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: fence_planks
        objectName: "fence_planks"
        position: Qt.vector3d(0, -0.05, 0)
        source: "meshes/mesh_fence_planks_mesh.mesh"
        materials: [
            wood_material
        ]
    }

    // Animations:
}
