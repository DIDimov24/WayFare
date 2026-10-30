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
    PrincipledMaterial {
        id: woodInner_material
        objectName: "woodInner"
        baseColor: "#fffbecde"
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: log_stack
        objectName: "log_stack"
        position: Qt.vector3d(0, -0.05, 0)
        source: "meshes/log_stack_mesh.mesh"
        materials: [
            woodBark_material,
            woodInner_material
        ]
    }

    // Animations:
}
