import QtQuick
import QtMultimedia
import wayfare.presentation

Item {
    id: root

    property bool active: true
    readonly property string mode: Level.hasBoss ? Level.boss.state : "waiting"
    readonly property real distance: Level.hasBoss ? Math.hypot(Level.boss.x - Level.playerX, Level.boss.y - Level.playerY) : 99
    readonly property real near: Math.max(0.2, Math.min(1, 1.4 - root.distance * 0.08))
    readonly property real effects: root.near * Settings.sfxVolume / 100
    readonly property bool fighting: root.active && !Level.dead && root.mode !== "waiting" && root.mode !== "intro" && root.mode !== "dead"
    property real musicLevel: root.fighting ? 1 : 0
    property real lastX: 0
    property real lastY: 0
    property real movedAt: 0
    property bool hurt: Level.hasBoss && Level.boss.hurt
    property string caption: ""

    function say(voice: string, text: string, duration: int) {
        speech.source = Assets.url + "audio/voice/" + voice + ".wav"
        speech.play()
        root.caption = text
        captionEnd.interval = duration
        captionEnd.restart()
    }

    Behavior on musicLevel {
        NumberAnimation { duration: root.fighting ? 1500 : 3000 }
    }

    onMusicLevelChanged: {
        if (root.musicLevel > 0 && music.playbackState !== MediaPlayer.PlayingState) {
            music.play()
        }
        if (root.musicLevel === 0) {
            music.stop()
        }
    }

    onModeChanged: {
        if (!root.active) {
            return
        }
        switch (root.mode) {
            case "intro":
                introRoar.restart()
                root.say("boss_1", "Where is my daughter?", 2400)
                break
            case "roaring":
                roar.play()
                summon.restart()
                break
            case "swiping":
                grunt.play()
                break
            case "charging":
                charge.play()
                break
            case "dead":
                deathRoar.play()
                stone.restart()
                deathLine.restart()
                break
        }
    }

    onHurtChanged: {
        if (root.hurt && root.active && !hurtCooldown.running) {
            hurtSound.play()
            hurtCooldown.restart()
        }
    }

    Connections {
        target: Level

        function onBossSlammed() {
            slam.play()
        }

        function onBossChanged() {
            if (Level.boss.x !== root.lastX || Level.boss.y !== root.lastY) {
                root.movedAt = Date.now()
            }
            root.lastX = Level.boss.x
            root.lastY = Level.boss.y
        }
    }

    MediaPlayer {
        id: music
        source: Assets.url + "audio/boss_music.ogg"
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: root.musicLevel * Settings.musicVolume / 100
        }
    }

    MediaPlayer {
        id: speech
        audioOutput: AudioOutput {
            volume: Settings.sfxVolume / 100
        }
    }

    Timer {
        id: captionEnd
        interval: 3000
        onTriggered: root.caption = ""
    }

    Timer {
        id: deathLine
        interval: 3200
        onTriggered: root.say("boss_2", "It turned to stone, just like the statues outside.", 4200)
    }

    Timer {
        id: introRoar
        interval: 1200
        onTriggered: roar.play()
    }

    Timer {
        id: summon
        interval: 700
        onTriggered: summonSound.play()
    }

    Timer {
        id: stone
        interval: 700
        onTriggered: stoneSound.play()
    }

    Timer {
        id: hurtCooldown
        interval: 900
    }

    Timer {
        interval: root.mode === "charging" ? 260 : (Level.boss.phase === 3 ? 380 : 540)
        repeat: true
        running: root.active && (root.mode === "chasing" || root.mode === "charging")
        onTriggered: {
            if (Date.now() - root.movedAt < 150) {
                step.play()
            }
        }
    }

    SoundEffect {
        id: roar
        source: Assets.url + "audio/troll_roar.wav"
        volume: root.effects
    }

    SoundEffect {
        id: grunt
        source: Assets.url + "audio/troll_grunt.wav"
        volume: root.effects
    }

    SoundEffect {
        id: charge
        source: Assets.url + "audio/troll_charge.wav"
        volume: root.effects
    }

    SoundEffect {
        id: slam
        source: Assets.url + "audio/troll_slam.wav"
        volume: root.effects
    }

    SoundEffect {
        id: hurtSound
        source: Assets.url + "audio/troll_hurt.wav"
        volume: root.effects
    }

    SoundEffect {
        id: summonSound
        source: Assets.url + "audio/troll_summon.wav"
        volume: root.effects
    }

    SoundEffect {
        id: step
        source: Assets.url + "audio/troll_step.wav"
        volume: root.effects
    }

    SoundEffect {
        id: deathRoar
        source: Assets.url + "audio/troll_death_roar.wav"
        volume: Settings.sfxVolume / 100
    }

    SoundEffect {
        id: stoneSound
        source: Assets.url + "audio/troll_stone.wav"
        volume: Settings.sfxVolume / 100
    }
}
