import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: dirt_material
        objectName: "dirt"
        baseColor: "#fff2be9e"
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: grass_material
        objectName: "grass"
        baseColor: "#ff73eddd"
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: rock_largeA
        objectName: "rock_largeA"
        position: Qt.vector3d(0, -0.05, 0)
        source: "meshes/rock_largeA_mesh.mesh"
        materials: [
            dirt_material,
            grass_material
        ]
    }

    // Animations:
}
