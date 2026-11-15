import QtQuick
import wayfare.presentation

Item {
    id: root

    default property alias content: scene.data
    property alias overlay: overlayLayer.data
    property int lastStage: 0
    property real length: 1000
    property bool heroReady: true
    property string title: ""
    property bool titleAtBottom: false
    property real titleSize: 44
    property real titleSpacing: 2
    property real titleOpacity: 0
    property real fadeOpacity: 1
    property string hint: "Space to skip"
    property var lines: []
    property var shots: [0]
    property bool preview: false
    property bool prepared: false
    property int stage: 0
    property bool started: false
    property int warmFrames: 0
    property real waited: 0
    property real time: 0

    signal skipRequested()
    signal ended()

    focus: true

    Keys.onPressed: e => {
        if (!root.preview && (e.key === Qt.Key_Space || e.key === Qt.Key_Escape)) {
            root.skipRequested()
        }
    }

    Connections {
        target: root.Window.window
        enabled: !root.started && !root.prepared

        function onAfterAnimating() {
            if (root.stage < root.lastStage) {
                root.stage++
                return
            }
            if (root.heroReady) {
                root.warmFrames++
            }
            if (root.warmFrames >= 10) {
                root.begin()
            }
        }
    }

    Timer {
        interval: 100
        repeat: true
        running: !root.started && !root.prepared

        onTriggered: {
            root.waited = root.waited + 100
            if (root.waited >= 60000) {
                root.begin()
            }
        }
    }

    function begin() {
        if (root.preview) {
            root.prepared = true
            return
        }
        root.started = true
    }

    FrameAnimation {
        running: root.started && root.time < root.length

        onTriggered: {
            root.time = Math.min(root.length, root.time + Math.min(frameTime, 0.05) * 1000)
            if (root.time >= root.length) {
                root.ended()
            }
        }
    }

    Item {
        id: scene

        anchors.fill: parent
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height * 0.11
        color: "#000000"
    }

    Rectangle {
        id: bottomBar

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height * 0.11
        color: "#000000"
    }

    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: root.fadeOpacity
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.titleAtBottom ? parent.height * 0.82 - height : (parent.height - height) / 2
        text: root.title
        color: "#e6f4f6"
        font.pixelSize: root.titleSize
        font.weight: Font.Light
        font.letterSpacing: root.titleSpacing
        opacity: root.titleOpacity
    }

    Subtitles {
        anchors.fill: parent
        lines: root.preview ? [] : root.lines
        time: root.time
    }

    Item {
        id: overlayLayer

        anchors.fill: parent
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 24
        anchors.verticalCenter: bottomBar.verticalCenter
        text: root.hint
        color: "#8a96a8"
        font.pixelSize: 14
        font.letterSpacing: 1
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (!root.preview) {
                root.skipRequested()
            }
        }
    }

    LoadingCover {
        anchors.fill: parent
        loading: !root.started && !root.preview
    }
}
