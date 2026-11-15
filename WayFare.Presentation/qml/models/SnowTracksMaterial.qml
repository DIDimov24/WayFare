import QtQuick
import QtQuick3D
import wayfare.presentation

CustomMaterial {
    id: root

    property real uvScale: 0.33
    property real lakeCut: 0
    property vector2d lakeCenter: Qt.vector2d(-1.5, 1)
    property vector2d lakeRadius: Qt.vector2d(10, 16)
    property vector2d holeCenter: Qt.vector2d(0.1, 1.2)
    property real holeRadius: 1.4
    property TextureInput diffuseMap: TextureInput {
        texture: Texture {
            source: Assets.url + "textures/village/floor_diffuse.jpg"
            tilingModeHorizontal: Texture.Repeat
            tilingModeVertical: Texture.Repeat
        }
    }
    property TextureInput normalMap: TextureInput {
        texture: Texture {
            source: Assets.url + "textures/village/floor_normal.jpg"
            tilingModeHorizontal: Texture.Repeat
            tilingModeVertical: Texture.Repeat
        }
    }
    property TextureInput roughnessMap: TextureInput {
        texture: Texture {
            source: Assets.url + "textures/village/floor_roughness.jpg"
            tilingModeHorizontal: Texture.Repeat
            tilingModeVertical: Texture.Repeat
        }
    }

    shadingMode: CustomMaterial.Shaded
    fragmentShader: Qt.resolvedUrl("../shaders/SnowTracks.frag")
}
