import QtQuick
import QtQuick3D
import QtQuick.Timeline
import wayfare.presentation

Node {
    id: root

    property string mode: "idle"
    property bool hurt: false
    property bool animated: true
    property real phase: 0
    property real sink: 0
    property real clock: 0
    property real clipStart: 0
    property real damageLeft: 0
    property real attackLeft: 0
    property real movingLeft: 0
    property vector3d lastPosition: root.position
    property string clip: "Idle"
    property Timeline current: null
    readonly property real idleLength: 24958
    readonly property real attackLength: 1792
    readonly property real damageLength: 625
    readonly property real deathLength: 1167
    readonly property real runLength: 1292
    readonly property real screamLength: 4417
    readonly property real damageSpeed: 1.6
    readonly property real runSpeed: 1.4
    readonly property real screamSpeed: 2
    property bool loaded: false
    readonly property bool ready: root.loaded || !Assets.exists("models/zombie_fantasy/ZombieFantasy.qml")

    Behavior on sink {
        enabled: root.mode === "dead"

        NumberAnimation { duration: 1500 }
    }

    onModeChanged: {
        if (root.mode !== "dead") {
            root.sink = 0
        }
        if (root.mode === "attacking") {
            root.attackLeft = root.attackLength
            root.clip = ""
        }
    }

    onHurtChanged: {
        if (root.hurt && root.mode !== "dead") {
            root.damageLeft = root.damageLength / root.damageSpeed
            root.attackLeft = 0
            root.clip = ""
        }
    }

    function stopClips() {
        const objects = (loader.item as Node).data
        for (let i = 0; i < objects.length; i++) {
            if (objects[i].keyframeGroups === undefined) {
                continue
            }
            const timeline = objects[i] as Timeline
            for (let j = 0; j < timeline.animations.length; j++) {
                timeline.animations[j].running = false
            }
            timeline.enabled = false
        }
    }

    function nextClip(): string {
        if (root.mode === "dead") {
            return "death"
        }
        if (root.damageLeft > 0) {
            return "damage"
        }
        if (root.attackLeft > 0) {
            return "attackA"
        }
        if (root.mode === "alerted") {
            return "scream"
        }
        if (root.mode === "chasing" && root.movingLeft > 0) {
            return "running"
        }
        return "Idle"
    }

    function clipFrame(): real {
        const time = root.clock - root.clipStart
        if (root.clip === "Idle") {
            return (time + root.phase) % root.idleLength
        }
        if (root.clip === "running") {
            return (time * root.runSpeed + root.phase) % root.runLength
        }
        if (root.clip === "attackA") {
            return Math.min(time, root.attackLength)
        }
        if (root.clip === "damage") {
            return Math.min(time * root.damageSpeed, root.damageLength)
        }
        if (root.clip === "scream") {
            return Math.min(time * root.screamSpeed, root.screamLength)
        }
        return Math.min(time, root.deathLength)
    }

    function showClip() {
        const name = "Zombie|" + root.clip
        if (root.current !== null && root.current.objectName === name) {
            root.current.currentFrame = root.clipFrame()
            return
        }

        if (root.current !== null) {
            root.current.enabled = false
        }
        root.current = null
        const objects = (loader.item as Node).data
        for (let i = 0; i < objects.length; i++) {
            if (objects[i].objectName === name) {
                root.current = objects[i] as Timeline
            }
        }
        if (root.current !== null) {
            root.current.currentFrame = root.clipFrame()
            root.current.enabled = true
        }
    }

    FrameAnimation {
        running: root.loaded && root.sink < 1

        onTriggered: {
            const step = Math.min(frameTime, 0.1) * 1000
            root.clock = root.clock + step
            root.damageLeft = Math.max(root.damageLeft - step, 0)
            root.attackLeft = Math.max(root.attackLeft - step, 0)
            root.movingLeft = Math.max(root.movingLeft - step, 0)

            if (root.position.x !== root.lastPosition.x || root.position.z !== root.lastPosition.z) {
                root.movingLeft = 150
                root.attackLeft = 0
            }
            root.lastPosition = root.position

            const next = root.nextClip()
            if (next !== root.clip) {
                root.clip = next
                root.clipStart = root.clock
            }
            if (root.animated) {
                root.showClip()
            }
        }
    }

    Timer {
        interval: 5000
        running: root.mode === "dead"
        onTriggered: root.sink = 1
    }

    Loader3D {
        id: loader

        asynchronous: true
        source: Assets.url + "models/zombie_fantasy/ZombieFantasy.qml"
        visible: root.sink < 1
        position: Qt.vector3d(0, -root.sink * 0.7, 0)
        scale: Qt.vector3d(0.125, 0.125, 0.125)
        onLoaded: {
            root.stopClips()
            root.showClip()
            root.loaded = true
        }
    }
}
