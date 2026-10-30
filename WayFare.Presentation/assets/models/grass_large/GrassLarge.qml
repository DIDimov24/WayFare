import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
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
        id: grass_large
        objectName: "grass_large"
        position: Qt.vector3d(0, -0.05, 0)
        source: "meshes/mesh_grass_large_mesh.mesh"
        materials: [
            grass_material
        ]
    }

    // Animations:
}
