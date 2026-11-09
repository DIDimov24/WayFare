import QtQuick
import QtQuick3D
import QtQuick.Timeline
import wayfare.presentation

Node {
    id: root

    property var enemy
    property real tileSize: 2
    property string modelPath
    property real modelScale: 1
    property real sinkDepth: 0.7
    property string idleClip
    property string attackClip
    property string damageClip
    property string deathClip
    property string runClip
    property string alertClip
    property real idleLength: 1
    property real attackLength: 1
    property real damageLength: 1
    property real deathLength: 1
    property real runLength: 1
    property real alertLength: 1
    property real damageSpeed: 1
    property real runSpeed: 1
    property real alertSpeed: 1
    property real phase: 0
    property real sink: 0
    property real clock: 0
    property real clipStart: 0
    property real damageLeft: 0
    property real attackLeft: 0
    property real movingLeft: 0
    property vector3d lastPosition: root.position
    property string clip: root.idleClip
    property Timeline current: null
    property bool loaded: false
    readonly property string mode: root.enemy.state
    readonly property bool hurt: root.enemy.hurt
    readonly property bool animated: root.enemy.seen
    readonly property bool ready: root.loaded || !Assets.exists(root.modelPath)

    visible: root.mode !== "dormant"
    position: Qt.vector3d(root.enemy.x * root.tileSize, 0, root.enemy.y * root.tileSize)
    eulerRotation.y: 90 - root.enemy.facing * 180 / Math.PI

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
            return root.deathClip
        }
        if (root.damageLeft > 0) {
            return root.damageClip
        }
        if (root.attackLeft > 0) {
            return root.attackClip
        }
        if (root.mode === "alerted") {
            return root.alertClip
        }
        if (root.mode === "chasing" && root.movingLeft > 0) {
            return root.runClip
        }
        return root.idleClip
    }

    function clipFrame(): real {
        const time = root.clock - root.clipStart
        if (root.clip === root.idleClip) {
            return (time + root.phase) % root.idleLength
        }
        if (root.clip === root.runClip) {
            return (time * root.runSpeed + root.phase) % root.runLength
        }
        if (root.clip === root.attackClip) {
            return Math.min(time, root.attackLength)
        }
        if (root.clip === root.damageClip) {
            return Math.min(time * root.damageSpeed, root.damageLength)
        }
        if (root.clip === root.alertClip) {
            return Math.min(time * root.alertSpeed, root.alertLength)
        }
        return Math.min(time, root.deathLength)
    }

    function showClip() {
        if (root.current !== null && root.current.objectName === root.clip) {
            root.current.currentFrame = root.clipFrame()
            return
        }

        if (root.current !== null) {
            root.current.enabled = false
        }
        root.current = null
        const objects = (loader.item as Node).data
        for (let i = 0; i < objects.length; i++) {
            if (objects[i].objectName === root.clip) {
                root.current = objects[i] as Timeline
            }
        }
        if (root.current !== null) {
            root.current.currentFrame = root.clipFrame()
            root.current.enabled = true
        }
    }

    FrameAnimation {
        running: root.loaded && root.sink < 1 && root.mode !== "dormant"

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
        source: Assets.url + root.modelPath
        visible: root.sink < 1
        position: Qt.vector3d(0, -root.sink * root.sinkDepth, 0)
        scale: Qt.vector3d(root.modelScale, root.modelScale, root.modelScale)
        onLoaded: {
            root.stopClips()
            root.showClip()
            root.loaded = true
        }
    }
}
