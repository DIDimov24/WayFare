import QtQuick
import QtMultimedia
import wayfare.presentation

Item {
    id: root

    property var lines: []
    property real time: 0
    property int current: -1
    property string shown: ""

    onTimeChanged: {
        let next = -1
        for (let i = 0; i < root.lines.length; i++) {
            if (root.time >= root.lines[i].start && root.time < root.lines[i].end) {
                next = i
            }
        }
        if (next === root.current) {
            return
        }

        root.current = next
        voice.stop()
        if (next < 0) {
            return
        }

        root.shown = root.lines[next].text
        const file = "audio/voice/" + root.lines[next].voice + ".wav"
        if (root.lines[next].voice !== "" && Assets.exists(file)) {
            voice.source = Assets.url + file
            voice.play()
        }
    }

    MediaPlayer {
        id: voice

        audioOutput: AudioOutput {
            volume: Settings.sfxVolume / 100
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.13
        width: parent.width * 0.7
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        text: root.shown
        color: "#f2f4f6"
        font.pixelSize: 26
        style: Text.Outline
        styleColor: "#000000"
        opacity: root.current >= 0 ? 1 : 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }
}
