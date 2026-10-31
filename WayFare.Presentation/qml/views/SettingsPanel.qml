import QtQuick
import wayfare.presentation

Column {
    id: root

    signal backClicked()

    spacing: 6

    Text {
        text: "Settings"
        color: "#ffffff"
        font.pixelSize: 40
        font.weight: Font.Light
        font.letterSpacing: 1
    }

    Item {
        width: 1
        height: 18
    }

    Text {
        text: "MOUSE SENSITIVITY"
        color: "#8a96a8"
        font.pixelSize: 13
        font.letterSpacing: 2
    }

    Row {
        spacing: 20

        Item {
            id: slider

            property int from: 1
            property int to: 100
            readonly property double position: (Settings.sensitivity - from) / (to - from)

            function valueAt(x: double): int {
                const ratio = Math.min(Math.max(x / width, 0), 1)
                return Math.round(from + ratio * (to - from))
            }

            width: 320
            height: 40

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height: 4
                radius: 2
                color: "#33ffffff"
            }

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: slider.position * slider.width
                height: 4
                radius: 2
                color: "#ffffff"
            }

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                x: slider.position * slider.width - width / 2
                width: 18
                height: 18
                radius: 9
                color: "#ffffff"
                scale: sliderArea.pressed ? 1.25 : 1

                Behavior on scale {
                    NumberAnimation { duration: 100 }
                }
            }

            MouseArea {
                id: sliderArea
                anchors.fill: parent
                anchors.leftMargin: -9
                anchors.rightMargin: -9
                cursorShape: Qt.PointingHandCursor
                onPressed: (mouse) => Settings.setSensitivity(slider.valueAt(mouse.x - 9))
                onPositionChanged: (mouse) => Settings.setSensitivity(slider.valueAt(mouse.x - 9))
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            width: 60
            text: Settings.sensitivity + "%"
            color: "#ffffff"
            font.pixelSize: 20
        }
    }

    Item {
        width: 1
        height: 24
    }

    MainMenuButton {
        text: "Back"
        onClicked: root.backClicked()
    }
}
