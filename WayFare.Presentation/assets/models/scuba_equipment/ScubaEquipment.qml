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
    PrincipledMaterial {
        id: mat5_material
        objectName: "mat5"
        baseColor: "#ff009de6"
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: mat25_material
        objectName: "mat25"
        baseColor: "#66ebf2f0"
        roughness: 0.699999988079071
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Blend
        opacity: 0.4000000059604645
    }
    PrincipledMaterial {
        id: mat21_material
        objectName: "mat21"
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
            mat22_material,
            mat5_material,
            mat25_material,
            mat21_material
        ]
    }

    // Animations:
}
