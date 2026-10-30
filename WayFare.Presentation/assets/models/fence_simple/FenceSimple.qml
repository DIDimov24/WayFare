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
    PrincipledMaterial {
        id: woodDark_material
        objectName: "woodDark"
        baseColor: "#ffe3af93"
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: fence_simple
        objectName: "fence_simple"
        position: Qt.vector3d(0, -0.05, 0)
        source: "meshes/fence_simple_mesh.mesh"
        materials: [
            wood_material,
            woodDark_material
        ]
    }

    // Animations:
}
