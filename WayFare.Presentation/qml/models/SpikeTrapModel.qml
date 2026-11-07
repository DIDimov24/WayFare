import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property real rise: 0
    property real tileSize: 2
    readonly property real meshScale: root.tileSize / 4

    PrincipledMaterial {
        id: material

        baseColorMap: Texture {
            source: Assets.url + "models/spike_trap/maps/textureData.png"
        }
        baseColor: "#8c8478"
        roughness: 0.75
        specularAmount: 0.2
    }

    Model {
        source: Assets.url + "models/spike_trap/meshes/cube_14376_mesh.mesh"
        scale: Qt.vector3d(root.meshScale, root.meshScale, root.meshScale)
        materials: material
    }

    Model {
        visible: root.rise > 0
        source: Assets.url + "models/spike_trap/meshes/cube_14375_mesh.mesh"
        y: (root.rise - 1) * 2 * root.meshScale
        scale: Qt.vector3d(root.meshScale, root.meshScale, root.meshScale)
        materials: material
    }
}
