import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: stone_material
        objectName: "stone"
        baseColor: "#ffe7e7e7"
        roughness: 0.4000000059604645
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: statue_mila
        objectName: "statue_mila"
        source: "meshes/cube_001_mesh.mesh"
        materials: [
            stone_material
        ]
    }

    // Animations:
}
