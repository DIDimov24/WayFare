import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: mat23_material
        objectName: "mat23"
        baseColor: "#ff191919"
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: mat12_material
        objectName: "mat12"
        baseColor: "#ffffeb38"
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: mat22_material
        objectName: "mat22"
        baseColor: "#ffa0a0a0"
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: node
        objectName: "Node"
        source: "meshes/node_mesh.mesh"
        materials: [
            mat23_material,
            mat12_material,
            mat22_material
        ]
    }

    // Animations:
}
