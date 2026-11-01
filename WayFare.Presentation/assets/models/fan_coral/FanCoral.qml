import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: mat7_material
        objectName: "mat7"
        baseColor: "#fff8a6c7"
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: group1533979519
        objectName: "group1533979519"
        source: "meshes/mesh1533979519_mesh.mesh"
        materials: [
            mat7_material
        ]
    }

    // Animations:
}
