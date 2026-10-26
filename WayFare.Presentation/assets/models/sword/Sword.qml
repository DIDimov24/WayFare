import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    Texture {
        id: knight_texture_png_texture
        objectName: "knight_texture.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/knight_texture.png"
    }
    PrincipledMaterial {
        id: knight_texture_material
        objectName: "knight_texture"
        baseColorMap: knight_texture_png_texture
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: sword_1handed
        objectName: "sword_1handed"
        source: "meshes/cube_11839_mesh.mesh"
        materials: [
            knight_texture_material
        ]
    }

    // Animations:
}
