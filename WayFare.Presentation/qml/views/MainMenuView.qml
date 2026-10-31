import QtQuick
import QtQuick.Shapes
import wayfare.presentation

Item {
    id: root

    property string panel: ""
    property int sceneFrames: 0

    focus: true
    Keys.onEscapePressed: root.panel = ""

    Connections {
        target: root.Window.window
        enabled: root.sceneFrames < 3

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

    Rectangle {
        id: cover
        anchors.fill: parent
        color: "#080b12"
        opacity: root.sceneFrames >= 3 ? 0 : 1
        visible: opacity > 0

        Behavior on opacity {
            NumberAnimation { duration: 1500; easing.type: Easing.InOutQuad }
        }

        Shape {
            anchors.centerIn: parent
            width: 48
            height: 48
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                strokeColor: "#d6dde6"
                strokeWidth: 4
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: 24
                    centerY: 24
                    radiusX: 20
                    radiusY: 20
                    startAngle: 0
                    sweepAngle: 270
                }
            }

            RotationAnimator on rotation {
                from: 0
                to: 360
                duration: 1000
                loops: Animation.Infinite
                running: cover.visible
            }
        }
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

        Text {
            text: "WayFare"
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
