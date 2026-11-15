pragma ComponentBehavior: Bound

import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property real tileSize: 2
    property var torches: []
    property real brightness: 2.6
    property real flicker: 0
    readonly property real torchHeight: 1.9

    function buildTorches() {
        const entries = []
        for (let i = 0; i < root.torches.length; i++) {
            const torch = root.torches[i]
            entries.push(torchEntry.createObject(torchList, {
                position: Qt.vector3d(torch.x * root.tileSize, root.torchHeight, torch.y * root.tileSize),
                eulerRotation: Qt.vector3d(0, torch.yaw, 0),
                scale: Qt.vector3d(0.8, 0.8, 0.8)
            }))
        }
        torchList.instances = entries
    }

    function torchLight(entry: var): vector3d {
        const yaw = entry.yaw * Math.PI / 180
        return Qt.vector3d(entry.x * root.tileSize + Math.sin(yaw) * 0.23, root.torchHeight + 0.68, entry.y * root.tileSize + Math.cos(yaw) * 0.23)
    }

    Component.onCompleted: root.buildTorches()

    NumberAnimation on flicker {
        running: root.visible
        loops: Animation.Infinite
        from: 0
        to: Math.PI * 2
        duration: 1700
    }

    Component {
        id: torchEntry

        InstanceListEntry {}
    }

    TorchModel {
        instancing: InstanceList {
            id: torchList
        }
    }

    Repeater3D {
        model: root.torches

        delegate: Node {
            id: torch

            required property var modelData
            required property int index
            readonly property real wave: Math.sin(root.flicker * 3 + torch.modelData.phase) * 0.6 + Math.sin(root.flicker * 7 + torch.index) * 0.4

            position: root.torchLight(torch.modelData)

            PointLight {
                color: "#ff9a4a"
                brightness: root.brightness + torch.wave * 0.4
                quadraticFade: 6000
            }

            Model {
                source: "#Sphere"
                y: -0.27
                scale: Qt.vector3d(0.0011, 0.0028 + torch.wave * 0.0003, 0.0013)
                castsShadows: false
                receivesShadows: false
                materials: PrincipledMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    baseColor: "#ffe08a"
                }
            }

            Model {
                source: "#Sphere"
                y: -0.24
                scale: Qt.vector3d(0.0019, 0.0044 + torch.wave * 0.0005, 0.0019)
                castsShadows: false
                receivesShadows: false
                materials: PrincipledMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    alphaMode: PrincipledMaterial.Blend
                    baseColor: "#ff8a24"
                    opacity: 0.75
                }
            }
        }
    }
}
