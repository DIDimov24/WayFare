import QtQuick
import QtQuick3D
import wayfare.presentation

CustomMaterial {
    id: root

    property real wallTop: 3
    property vector2d uvScale: Qt.vector2d(1, 1.5)
    property TextureInput diffuseMap: TextureInput {
        texture: Texture {
            source: Assets.url + "textures/temple/wall_diffuse.jpg"
            tilingModeHorizontal: Texture.Repeat
            tilingModeVertical: Texture.Repeat
        }
    }
    property TextureInput normalMap: TextureInput {
        texture: Texture {
            source: Assets.url + "textures/temple/wall_normal.jpg"
            tilingModeHorizontal: Texture.Repeat
            tilingModeVertical: Texture.Repeat
        }
    }
    property TextureInput roughnessMap: TextureInput {
        texture: Texture {
            source: Assets.url + "textures/temple/wall_roughness.jpg"
            tilingModeHorizontal: Texture.Repeat
            tilingModeVertical: Texture.Repeat
        }
    }

    shadingMode: CustomMaterial.Shaded
    fragmentShader: Qt.resolvedUrl("../shaders/TempleWall.frag")
}
