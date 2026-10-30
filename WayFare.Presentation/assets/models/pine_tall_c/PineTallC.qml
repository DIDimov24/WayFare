import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: leafsDark_material
        objectName: "leafsDark"
        baseColor: "#ff72d3d5"
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: woodBarkDark_material
        objectName: "woodBarkDark"
        baseColor: "#ffe7b5a3"
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: tree_pineTallC_detailed
        objectName: "tree_pineTallC_detailed"
        position: Qt.vector3d(0, -0.05, 0)
        source: "meshes/tree_pineTallC_detailed_mesh.mesh"
        materials: [
            leafsDark_material,
            woodBarkDark_material
        ]
    }

    // Animations:
}
