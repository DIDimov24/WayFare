import QtQuick
import QtQuick3D
import QtMultimedia
import wayfare.presentation

Node {
    id: root

    property real rise: 0
    property int tileX: 0
    property int tileY: 0
    property bool active: true
    readonly property real distance: Math.hypot(root.tileX + 0.5 - Level.playerX, root.tileY + 0.5 - Level.playerY)
    readonly property real near: Math.max(0, 1 - root.distance / 5)
    readonly property bool up: root.rise > 0.5

    onUpChanged: {
        if (root.up && root.active && root.near > 0) {
            spikes.play()
        }
    }

    SoundEffect {
        id: spikes
        source: Assets.url + "audio/spike_out.wav"
        volume: root.near * Settings.sfxVolume / 100
    }
}
