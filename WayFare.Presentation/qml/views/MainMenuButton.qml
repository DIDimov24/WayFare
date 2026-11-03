import QtQuick
import wayfare.presentation

Item {
    id: root

    property string text
    signal clicked()

    width: 280
    height: 52
    opacity: enabled ? 1 : 0.35

    Text {
        anchors.verticalCenter: parent.verticalCenter
        text: root.text
        color: "#ffffff"
        font.pixelSize: 26
        opacity: mouseArea.containsMouse ? 0.5 : 1

        Behavior on opacity {
            NumberAnimation { duration: 120 }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: root.enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
        onContainsMouseChanged: {
            if (mouseArea.containsMouse && root.enabled) {
                Sounds.hover.play()
            }
        }
        onClicked: {
            Sounds.click.play()
            root.clicked()
        }
    }
}
