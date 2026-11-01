import QtQuick
import wayfare.presentation

Window {
    visibility: Window.FullScreen
    width: 1280
    height: 720
    title: "WayFare"
    color: "#080b12"

    MainMenuView {
        anchors.fill: parent
        visible: Game.phase === "menu"
        focus: Game.phase === "menu"
    }

    Loader {
        anchors.fill: parent
        active: Game.phase === "intro"
        asynchronous: true
        focus: Game.phase === "intro"
        sourceComponent: IntroCutscene {}
    }

    Loader {
        anchors.fill: parent
        active: Game.phase === "level"
        asynchronous: true
        focus: Game.phase === "level"
        sourceComponent: LevelView {}
    }
}
