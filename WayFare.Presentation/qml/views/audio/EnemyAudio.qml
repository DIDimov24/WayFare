import QtQuick
import QtQuick3D
import QtMultimedia
import wayfare.presentation

Node {
    id: root

    property var enemy
    property string kind: "zombie"
    property bool active: true
    readonly property string mode: root.enemy.state
    readonly property real distance: Math.hypot(root.enemy.x - Level.playerX, root.enemy.y - Level.playerY)
    readonly property real near: Math.max(0, 1 - root.distance / 7)
    readonly property real effects: root.near * Settings.sfxVolume / 100
    property real lastX: 0
    property real lastY: 0

    onModeChanged: {
        if (!root.active || root.near <= 0) {
            return
        }
        if (root.mode === "attacking") {
            attack.play()
        }
        if (root.mode === "dead") {
            death.play()
        }
    }

    Timer {
        interval: root.kind === "zombie" ? 640 : 360
        repeat: true
        running: root.active && root.near > 0 && (root.mode === "chasing" || root.mode === "alerted")
        onTriggered: {
            if (root.enemy.x !== root.lastX || root.enemy.y !== root.lastY) {
                step.play()
            }
            root.lastX = root.enemy.x
            root.lastY = root.enemy.y
        }
    }

    SoundEffect {
        id: step
        source: Assets.url + "audio/" + root.kind + "_step.wav"
        volume: root.effects
    }

    SoundEffect {
        id: attack
        source: Assets.url + "audio/" + root.kind + "_attack.wav"
        volume: root.effects
    }

    SoundEffect {
        id: death
        source: Assets.url + "audio/" + root.kind + "_death.wav"
        volume: root.effects
    }
}
