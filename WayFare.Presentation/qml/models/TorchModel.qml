import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    source: Assets.url + "models/torch_mounted/meshes/cylinder_022_mesh.mesh"
    castsShadows: false
    receivesShadows: false
    materials: PrincipledMaterial {
        baseColorMap: Texture {
            source: Assets.url + "models/torch_mounted/maps/textureData.png"
        }
        emissiveMap: Texture {
            source: Assets.url + "models/torch_mounted/maps/textureData.png"
        }
        emissiveFactor: Qt.vector3d(0.12, 0.12, 0.12)
        roughness: 0.8
    }
}
