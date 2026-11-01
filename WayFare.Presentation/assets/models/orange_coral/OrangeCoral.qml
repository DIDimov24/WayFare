import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: mat20_material
        objectName: "mat20"
        baseColor: "#ffb69b90"
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: mat13_material
        objectName: "mat13"
        baseColor: "#ffffcb00"
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: group1965416314
        objectName: "group1965416314"
        source: "meshes/group1965416314_mesh.mesh"
        materials: [
            mat20_material,
            mat13_material
        ]
    }

    // Animations:
}
