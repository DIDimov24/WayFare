import QtQuick
import QtQuick3D
import QtQuick.Timeline
import wayfare.presentation

Node {
    id: root

    property string clip: "breathing_idle"
    property real time: -1
    property bool loop: true
    property Timeline current: null
    readonly property real firstFrame: 1000 / 30
    readonly property bool ready: !loader.active || loader.status === Loader3D.Ready || loader.status === Loader3D.Error

    onClipChanged: playClip()
    onTimeChanged: showFrame()

    Loader3D {
        id: loader
        active: Assets.exists("models/hero/Hero.qml")
        asynchronous: true
        source: Assets.url + "models/hero/Hero.qml"
        scale: Qt.vector3d(0.6, 0.6, 0.6)
        onLoaded: root.playClip()
    }

    function playClip() {
        if (loader.item === null) {
            return
        }

        root.current = null
        let next = null
        const objects = (loader.item as Node).data
        for (let i = 0; i < objects.length; i++) {
            const timeline = objects[i]
            if (timeline.keyframeGroups === undefined) {
                continue
            }
            if (timeline.objectName === root.clip) {
                next = timeline as Timeline
                continue
            }
            for (let j = 0; j < timeline.animations.length; j++) {
                timeline.animations[j].running = false
            }
            timeline.enabled = false
        }
        if (next === null) {
            return
        }

        for (let j = 0; j < next.animations.length; j++) {
            const animation = next.animations[j]
            animation.from = root.firstFrame
            animation.to = next.endFrame
            animation.duration = next.endFrame - root.firstFrame
        }
        if (root.time >= 0) {
            next.currentFrame = root.clipFrame(next)
        } else {
            next.currentFrame = root.firstFrame
        }
        next.enabled = true
        for (let j = 0; j < next.animations.length; j++) {
            next.animations[j].running = root.time < 0
        }
        root.current = next
    }

    function clipFrame(timeline: Timeline): real {
        const end = timeline.endFrame
        if (root.loop) {
            return root.firstFrame + root.time % (end - root.firstFrame)
        }
        return Math.max(root.firstFrame, Math.min(root.time, end))
    }

    function showFrame() {
        if (root.current === null || root.time < 0) {
            return
        }

        root.current.currentFrame = root.clipFrame(root.current)
    }
}
