import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property real tileSize: 2
    property int stage: 0

    Model {
        visible: root.stage >= 6
        source: "#Rectangle"
        position: Qt.vector3d(Level.size * root.tileSize / 2, 3, Level.size * root.tileSize / 2)
        eulerRotation.x: 90
        scale: Qt.vector3d(Level.size * root.tileSize / 100, Level.size * root.tileSize / 100, 1)
        castsShadows: false
        receivesShadows: false
        materials: PrincipledMaterial {
            baseColorMap: Texture {
                source: Assets.url + "textures/dungeon/wall_diffuse.jpg"
                scaleU: Level.size
                scaleV: Level.size
            }
            normalMap: Texture {
                source: Assets.url + "textures/dungeon/wall_normal.jpg"
                scaleU: Level.size
                scaleV: Level.size
            }
            roughness: 1
            specularAmount: 0
        }
    }

    WallTorches {
        visible: root.stage >= 4
        tileSize: root.tileSize
        torches: Level.decor
    }
}
