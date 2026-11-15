import QtQuick
import wayfare.presentation

Rectangle {
    id: root

    property string panel: ""
    signal resumeClicked()
    signal menuClicked()

    color: "#b3080b12"
    opacity: visible ? 1 : 0

    onVisibleChanged: root.panel = ""

    Behavior on opacity {
        NumberAnimation { duration: 150 }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
    }

    Column {
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.verticalCenter: parent.verticalCenter
        spacing: 6
        opacity: root.panel === "" ? 1 : 0
        visible: opacity > 0

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }

        Text {
            text: "Paused"
            color: "#ffffff"
            font.pixelSize: 64
            font.weight: Font.Light
            font.letterSpacing: 2
        }

        Item {
            width: 1
            height: 40
        }

        MainMenuButton {
            text: "Resume"
            onClicked: root.resumeClicked()
        }

        MainMenuButton {
            text: "How to Play"
            onClicked: root.panel = "howToPlay"
        }

        MainMenuButton {
            text: "Settings"
            onClicked: root.panel = "settings"
        }

        MainMenuButton {
            text: "Main Menu"
            onClicked: root.menuClicked()
        }
    }

    HowToPlayPanel {
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.verticalCenter: parent.verticalCenter
        opacity: root.panel === "howToPlay" ? 1 : 0
        visible: opacity > 0
        onBackClicked: root.panel = ""

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }
    }

    SettingsPanel {
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.verticalCenter: parent.verticalCenter
        opacity: root.panel === "settings" ? 1 : 0
        visible: opacity > 0
        onBackClicked: root.panel = ""

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }
    }
}
