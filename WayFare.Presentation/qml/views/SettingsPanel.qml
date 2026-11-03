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

    SettingsSlider {
        label: "MOUSE SENSITIVITY"
        from: 1
        value: Settings.sensitivity
        onMoved: (newValue) => Settings.setSensitivity(newValue)
    }

    Item {
        width: 1
        height: 12
    }

    SettingsSlider {
        label: "MUSIC VOLUME"
        value: Settings.musicVolume
        onMoved: (newValue) => Settings.setMusicVolume(newValue)
    }

    Item {
        width: 1
        height: 12
    }

    SettingsSlider {
        label: "EFFECTS VOLUME"
        value: Settings.sfxVolume
        onMoved: (newValue) => Settings.setSfxVolume(newValue)
        onReleased: Sounds.click.play()
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
