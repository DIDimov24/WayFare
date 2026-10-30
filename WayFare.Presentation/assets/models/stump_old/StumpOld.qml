import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    PrincipledMaterial {
        id: woodBark_material
        objectName: "woodBark"
        baseColor: "#fff2be9e"
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: stump_old
        objectName: "stump_old"
        position: Qt.vector3d(0, -0.05, 0)
        source: "meshes/mesh_stump_old_mesh.mesh"
        materials: [
            woodBark_material
        ]
    }

    // Animations:
}
