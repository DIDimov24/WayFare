import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    property url textureData: "maps/textureData.png"
    Texture {
        id: _0_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: root.textureData
    }
    PrincipledMaterial {
        id: texture_material
        objectName: "texture"
        baseColorMap: _0_texture
        roughness: 0.44999998807907104
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: bottle_A_labeled_green
        objectName: "bottle_A_labeled_green"
        source: "meshes/cube_15957_mesh.mesh"
        materials: [
            texture_material
        ]
    }

    // Animations:
}
