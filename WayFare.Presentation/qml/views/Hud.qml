import QtQuick
import wayfare.presentation

Item {
    id: root

    Column {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 24
        spacing: 12

        Row {
            spacing: 4

            Repeater {
                model: Level.maxHealth

                Text {
                    required property int index

                    text: String.fromCharCode(0x2665)
                    color: index < Level.health ? "#e0404a" : "#40ffffff"
                    font.pixelSize: 34
                    style: Text.Outline
                    styleColor: "#99080b12"
                }
            }
        }

        Row {
            spacing: 8
            visible: Level.items.length > 0 || Level.potionCount > 0

            Repeater {
                model: Level.items

                Rectangle {
                    required property string modelData

                    width: itemLabel.implicitWidth + 24
                    height: 32
                    radius: 6
                    color: "#99080b12"
                    border.color: "#33ffffff"

                    Text {
                        id: itemLabel
                        anchors.centerIn: parent
                        text: parent.modelData
                        color: "#ffffff"
                        font.pixelSize: 15
                    }
                }
            }

            Rectangle {
                visible: Level.potionCount > 0
                width: potionLabel.implicitWidth + 24
                height: 32
                radius: 6
                color: "#99080b12"
                border.color: "#33ffffff"

                Text {
                    id: potionLabel
                    anchors.centerIn: parent
                    text: "Potion x" + Level.potionCount
                    color: "#ffffff"
                    font.pixelSize: 15
                }
            }
        }
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 28
        spacing: 6
        visible: Level.showAir

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "AIR"
            color: "#d6dde6"
            font.pixelSize: 13
            font.letterSpacing: 2
            style: Text.Outline
            styleColor: "#99080b12"
        }

        Rectangle {
            width: 260
            height: 8
            radius: 4
            color: "#33ffffff"

            Rectangle {
                width: Level.air * parent.width
                height: parent.height
                radius: 4
                color: Level.air < 0.25 ? "#e0404a" : "#7cc4ff"
            }
        }
    }
}
