import QtQuick
import QtQuick3D

Node {
    id: root
    objectName: "Root"

    // Resources
    Texture {
        id: textures_colormap_png_texture
        objectName: "Textures/colormap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/colormap.png"
    }
    PrincipledMaterial {
        id: colormap_material
        objectName: "colormap"
        baseColorMap: textures_colormap_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: ladder_long
        objectName: "ladder-long"
        source: "meshes/ladder_long_mesh.mesh"
        materials: [
            colormap_material
        ]
    }

    // Animations:
}
