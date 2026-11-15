pragma Singleton

import QtQuick
import QtMultimedia
import wayfare.presentation

QtObject {
    id: root

    readonly property SoundEffect click: SoundEffect {
        source: Assets.url + "audio/click.wav"
        volume: Settings.sfxVolume / 100
    }

    readonly property SoundEffect hover: SoundEffect {
        source: Assets.url + "audio/hover.wav"
        volume: Settings.sfxVolume / 100
    }

    readonly property SoundEffect equip: SoundEffect {
        source: Assets.url + "audio/equip.wav"
        volume: Settings.sfxVolume / 100
    }

    readonly property SoundEffect warmUpDone: SoundEffect {
        source: Assets.url + "audio/warmup_done.wav"
        volume: Settings.sfxVolume / 100
    }

    readonly property SoundEffect gasp: SoundEffect {
        source: Assets.url + "audio/gasp.wav"
        volume: Settings.sfxVolume / 100
    }

    readonly property SoundEffect swordSwing: SoundEffect {
        source: Assets.url + "audio/sword_swing.wav"
        volume: Settings.sfxVolume / 100
    }

    readonly property SoundEffect swordHit: SoundEffect {
        source: Assets.url + "audio/sword_hit.wav"
        volume: Settings.sfxVolume / 100
    }

    readonly property SoundEffect pistolShot: SoundEffect {
        source: Assets.url + "audio/pistol_shot.wav"
        volume: 0.6 * Settings.sfxVolume / 100
    }

    readonly property SoundEffect pistolCock: SoundEffect {
        source: Assets.url + "audio/pistol_cock.wav"
        volume: Settings.sfxVolume / 100
    }

    readonly property SoundEffect potion: SoundEffect {
        source: Assets.url + "audio/potion_drink.wav"
        volume: 0.5 * Settings.sfxVolume / 100
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

    function attack(weapon: string, hit: bool) {
        if (weapon === "pistol") {
            root.pistolShot.play()
            return
        }
        if (hit) {
            root.swordHit.play()
            return
        }
        root.swordSwing.play()
    }

    function equipWeapon(weapon: string) {
        if (weapon === "pistol") {
            root.pistolCock.play()
            return
        }
        root.equip.play()
    }
}
