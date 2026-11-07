pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects
import wayfare.presentation

Item {
    id: root

    property string message: ""
    property real flash: 0

    function iconPath(name: string): url {
        return Assets.url + "icons/" + name + ".png"
    }

    Connections {
        target: Level

        function onExitLocked(message: string) {
            root.message = message
            messageFade.restart()
        }
    }

    Rectangle {
        anchors.centerIn: parent
        visible: Level.armed
        width: 6
        height: 6
        radius: 3
        color: "#d0ffffff"
        border.color: "#a0000000"
        border.width: 1
    }

    Text {
        id: messageText

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height * 0.15
        text: root.message
        color: "#ffffff"
        font.pixelSize: 26
        font.bold: true
        style: Text.Outline
        styleColor: "#000000"
        opacity: 0

        SequentialAnimation {
            id: messageFade

            NumberAnimation { target: messageText; property: "opacity"; to: 1; duration: 200 }
            PauseAnimation { duration: 2000 }
            NumberAnimation { target: messageText; property: "opacity"; to: 0; duration: 800 }
        }
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

                Item {
                    id: heart

                    required property int index
                    readonly property string icon: root.iconPath(heart.index < Level.health ? "heart" : "heart_lost")

                    width: 36
                    height: 36

                    Image {
                        y: root.flash * 4
                        width: 36
                        height: 36
                        smooth: false
                        scale: 1.25
                        visible: root.flash > 0
                        opacity: root.flash
                        source: heart.icon
                        layer.enabled: true
                        layer.effect: MultiEffect {
                            brightness: 1
                        }
                    }

                    Image {
                        y: root.flash * 4
                        width: 36
                        height: 36
                        smooth: false
                        opacity: heart.index < Level.health ? 1 : 0.55
                        source: heart.icon
                    }
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
                    readonly property bool selected: Level.armed && Level.weapon === slot.modelData

                    color: "#cc0a0806"
                    border.color: slot.selected ? "#f3d48e" : "#a87a35"
                    border.width: slot.selected ? 3 : 2

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
