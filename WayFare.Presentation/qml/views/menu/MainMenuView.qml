import QtQuick
import QtMultimedia
import wayfare.presentation

Item {
    id: root

    property string panel: ""
    property int sceneFrames: 0

    focus: true
    Keys.onEscapePressed: root.panel = ""

    onVisibleChanged: {
        if (root.visible) {
            menuMusic.play()
        } else {
            menuMusic.pause()
        }
    }

    Component.onCompleted: {
        if (root.visible) {
            menuMusic.play()
        }
    }

    MediaPlayer {
        id: menuMusic
        source: Assets.url + "audio/menu_music.ogg"
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100
        }
    }

    Connections {
        target: root.Window.window
        enabled: root.sceneFrames < 3 && root.visible

        function onAfterAnimating() {
            if (!sceneLoader.active) {
                sceneLoader.active = true
                return
            }
            if (sceneLoader.status !== Loader.Ready) {
                return
            }
            const scene = sceneLoader.item as VillageScene
            if (scene.stage < scene.lastStage) {
                scene.stage++
                return
            }
            root.sceneFrames++
        }
    }

    Loader {
        id: sceneLoader
        anchors.fill: parent
        active: false
        asynchronous: true
        sourceComponent: VillageScene {}
    }

    LoadingCover {
        anchors.fill: parent
        loading: root.sceneFrames < 3
    }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#e6080b12" }
            GradientStop { position: 0.35; color: "#99080b12" }
            GradientStop { position: 0.65; color: "#00080b12" }
        }
    }

    Rectangle {
        anchors.fill: parent
        opacity: root.panel === "" ? 0 : 1
        visible: opacity > 0
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#99080b12" }
            GradientStop { position: 0.45; color: "#80080b12" }
            GradientStop { position: 0.75; color: "#00080b12" }
        }

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }
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

        Row {
            spacing: 20

            Image {
                anchors.verticalCenter: parent.verticalCenter
                width: 72
                height: 72
                sourceSize.width: 144
                sourceSize.height: 144
                source: Assets.url + "logo/wayfare-logo.svg"
                smooth: true
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "WayFare"
                color: "#ffffff"
                font.pixelSize: 64
                font.weight: Font.Light
                font.letterSpacing: 2
            }
        }

        Item {
            width: 1
            height: 40
        }

        MainMenuButton {
            text: "New Game"
            onClicked: MainMenu.newGame()
        }

        MainMenuButton {
            text: "Resume"
            enabled: MainMenu.hasSave
            onClicked: MainMenu.resume()
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
            text: "Quit"
            onClicked: MainMenu.quit()
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
