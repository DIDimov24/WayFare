import QtQuick
import wayfare.presentation

Rectangle {
    id: root

    property string message
    property color shade: "#cc1a0505"
    signal respawnClicked()
    signal menuClicked()

    color: root.shade
    opacity: visible ? 1 : 0

    Behavior on opacity {
        NumberAnimation { duration: 600; easing.type: Easing.OutQuad }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
    }

    Column {
        anchors.centerIn: parent
        spacing: 12

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: root.message
            color: "#f2e6e6"
            font.pixelSize: 64
            font.weight: Font.Light
            font.letterSpacing: 2
        }

        Item {
            width: 1
            height: 28
        }

        MainMenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            text: "Respawn"
            onClicked: root.respawnClicked()
        }

        MainMenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            text: "Main Menu"
            onClicked: root.menuClicked()
        }
    }
}
