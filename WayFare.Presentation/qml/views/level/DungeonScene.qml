import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property real tileSize: 2
    property int stage: 0
    property vector4d hole: Qt.vector4d(0, 0, 0, 0)

    function ceilingPieces(): var {
        const size = Level.size * root.tileSize
        const h = root.hole
        return [
            Qt.vector4d(0, 0, size, h.y),
            Qt.vector4d(0, h.w, size, size),
            Qt.vector4d(0, h.y, h.x, h.w),
            Qt.vector4d(h.z, h.y, size, h.w)
        ]
    }

    Repeater3D {
        visible: root.stage >= 6
        model: root.ceilingPieces()

        delegate: Model {
            required property vector4d modelData

            visible: modelData.z > modelData.x && modelData.w > modelData.y
            source: "#Rectangle"
            position: Qt.vector3d((modelData.x + modelData.z) / 2, 3, (modelData.y + modelData.w) / 2)
            eulerRotation.x: 90
            scale: Qt.vector3d((modelData.z - modelData.x) / 100, (modelData.w - modelData.y) / 100, 1)
            castsShadows: false
            receivesShadows: false
            materials: PrincipledMaterial {
                baseColorMap: Texture {
                    source: Assets.url + "textures/dungeon/wall_diffuse.jpg"
                    scaleU: (modelData.z - modelData.x) / root.tileSize
                    scaleV: (modelData.w - modelData.y) / root.tileSize
                }
                normalMap: Texture {
                    source: Assets.url + "textures/dungeon/wall_normal.jpg"
                    scaleU: (modelData.z - modelData.x) / root.tileSize
                    scaleV: (modelData.w - modelData.y) / root.tileSize
                }
                roughness: 1
                specularAmount: 0
            }
        }
    }

    MineEntrance {
        visible: root.stage >= 6
        position: Qt.vector3d(root.tileSize, 0, 1.5 * root.tileSize)
        eulerRotation.y: 90
    }

    WallTorches {
        visible: root.stage >= 4
        tileSize: root.tileSize
        torches: Level.decor
    }
}
