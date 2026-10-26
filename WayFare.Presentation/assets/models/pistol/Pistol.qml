import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: metal_material
        objectName: "Metal"
        baseColor: "#ff414241"
        metalness: 0.4000000059604645
        roughness: 0.41508710384368896
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: black_material
        objectName: "Black"
        baseColor: "#ff28292a"
        metalness: 0.4000000059604645
        roughness: 0.41508710384368896
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: lightMetal_material
        objectName: "LightMetal"
        baseColor: "#ff555659"
        metalness: 0.4000000059604645
        roughness: 0.41508710384368896
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Node {
        id: rootNode
        objectName: "RootNode"
        Model {
            id: pistol_5
            objectName: "Pistol_5"
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale: Qt.vector3d(100, 88.8819, 100)
            source: "meshes/pistol_5_mesh.mesh"
            materials: [
                metal_material,
                black_material,
                lightMetal_material
            ]
        }
    }

    // Animations:
}
