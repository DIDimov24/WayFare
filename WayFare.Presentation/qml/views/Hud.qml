pragma ComponentBehavior: Bound

import QtQuick
import wayfare.presentation

Item {
    id: root

    function iconPath(name: string): url {
        return Assets.url + "icons/" + name + ".png"
    }

    Column {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 24
        spacing: 12

        Row {
            spacing: 2

            Repeater {
                model: Level.maxHealth

                Image {
                    required property int index

                    width: 36
                    height: 36
                    smooth: false
                    opacity: index < Level.health ? 1 : 0.55
                    source: root.iconPath(index < Level.health ? "heart" : "heart_lost")
                }
            }
        }

        Row {
            spacing: 6
            visible: Level.items.length > 0 || Level.potionCount > 0

            Repeater {
                model: Level.items

                Rectangle {
                    id: slot

                    required property string modelData

                    width: 52
                    height: 52
                    color: "#cc0a0806"
                    border.color: "#a87a35"
                    border.width: 2

                    Image {
                        anchors.centerIn: parent
                        width: 36
                        height: 36
                        smooth: false
                        source: root.iconPath(slot.modelData)
                    }
                }
            }

            Rectangle {
                visible: Level.potionCount > 0
                width: 52
                height: 52
                color: "#cc0a0806"
                border.color: "#a87a35"
                border.width: 2

                Image {
                    anchors.centerIn: parent
                    width: 36
                    height: 36
                    smooth: false
                    source: root.iconPath("potion")
                }

                Text {
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 4
                    anchors.bottomMargin: 1
                    text: Level.potionCount
                    color: "#ffffff"
                    font.pixelSize: 16
                    font.bold: true
                    style: Text.Outline
                    styleColor: "#000000"
                }
            }
        }
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 24
        spacing: 8
        visible: Level.showAir

        Image {
            anchors.verticalCenter: parent.verticalCenter
            width: 36
            height: 36
            smooth: false
            source: root.iconPath("air")
        }

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            width: 260
            height: 14
            color: "#000000"

            Rectangle {
                x: 2
                y: 2
                width: Level.air * (parent.width - 4)
                height: parent.height - 4
                color: Level.air < 0.25 ? "#e04a3a" : "#e8eef4"
            }
        }
    }
}
