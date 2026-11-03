pragma Singleton

import QtQuick
import QtMultimedia
import wayfare.presentation

QtObject {
    id: root

    readonly property SoundEffect click: SoundEffect {
        source: Assets.url + "audio/click.wav"
    }

    readonly property SoundEffect hover: SoundEffect {
        source: Assets.url + "audio/hover.wav"
    }

    readonly property SoundEffect equip: SoundEffect {
        source: Assets.url + "audio/equip.wav"
    }

    readonly property SoundEffect gasp: SoundEffect {
        source: Assets.url + "audio/gasp.wav"
    }

    readonly property Timer gaspDelay: Timer {
        interval: 750
        onTriggered: root.gasp.play()
    }

    function pickUp(item: string) {
        root.equip.play()
        if (item === "diving_gear") {
            root.gaspDelay.restart()
        }
    }
}
