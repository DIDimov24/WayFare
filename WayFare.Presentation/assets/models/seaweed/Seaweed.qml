import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: mat11_material
        objectName: "mat11"
        baseColor: "#ff009789"
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: node
        objectName: "Node"
        source: "meshes/node_Mesh_mesh.mesh"
        materials: [
            mat11_material
        ]
    }

    // Animations:
}
