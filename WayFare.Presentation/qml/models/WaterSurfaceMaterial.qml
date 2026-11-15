import QtQuick
import QtQuick3D
import wayfare.presentation

CustomMaterial {
    id: root

    property real time: 0
    property real waveScale: 0.12
    property real waveStrength: 14
    property color deepColor: "#050d13"
    property color skyColor: "#2c3a4c"
    property TextureInput heightMap: TextureInput {
        texture: Texture {
            source: Assets.url + "textures/lake/water_height.png"
            tilingModeHorizontal: Texture.Repeat
            tilingModeVertical: Texture.Repeat
        }
    }

    shadingMode: CustomMaterial.Shaded
    fragmentShader: Qt.resolvedUrl("../shaders/WaterSurface.frag")
}
