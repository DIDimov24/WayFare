import QtQuick

Column {
    id: root

    property string label
    property int from: 0
    property int to: 100
    property int value: 0

    signal moved(int newValue)
    signal released()

    spacing: 6

    Text {
        text: root.label
        color: "#8a96a8"
        font.pixelSize: 13
        font.letterSpacing: 2
    }

    Row {
        spacing: 20

        Item {
            id: slider

            readonly property double position: (root.value - root.from) / (root.to - root.from)

            function valueAt(x: double): int {
                const ratio = Math.min(Math.max(x / width, 0), 1)
                return Math.round(root.from + ratio * (root.to - root.from))
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
                onPressed: (mouse) => root.moved(slider.valueAt(mouse.x - 9))
                onPositionChanged: (mouse) => root.moved(slider.valueAt(mouse.x - 9))
                onReleased: root.released()
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            width: 60
            text: root.value + "%"
            color: "#ffffff"
            font.pixelSize: 20
        }
    }
}
