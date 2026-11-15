import QtQuick
import QtQuick3D
import QtQuick.Timeline
import wayfare.presentation

Node {
    id: root

    property var boss
    property real tileSize: 2
    property bool active: true
    property bool animated: true
    readonly property string modelPath: "models/troll_cave/TrollCave.qml"
    readonly property real modelScale: 0.55
    readonly property string idleClip: "Frames.001"
    readonly property string roarClip: "Frames.002"
    readonly property string walkClip: "Frames.003"
    readonly property string runClip: "Frames.004"
    readonly property string slamClip: "Frames.006"
    readonly property string swipeClip: "Frames.008"
    readonly property string backhandClip: "Frames.009"
    readonly property string mode: root.boss.state
    readonly property bool hurt: root.boss.hurt
    readonly property bool ready: !root.active || root.loaded || !Assets.exists(root.modelPath)
    property bool loaded: false
    property real clock: 0
    property real clipStart: 0
    property real modeStart: 0
    property real movingLeft: 0
    property real stone: 0
    property var surfaces: []
    property var maps: []
    property real jolt: 0
    property vector3d lastPosition: root.position
    property string clip: root.idleClip
    property Timeline current: null

    position: Qt.vector3d(root.boss.x * root.tileSize, 0, root.boss.y * root.tileSize)
    eulerRotation.y: 90 - root.boss.facing * 180 / Math.PI

    onModeChanged: {
        root.modeStart = root.clock
        root.clip = ""
        if (root.mode === "dead") {
            stoneAnimation.start()
        }
    }

    onHurtChanged: {
        if (root.hurt) {
            joltAnimation.restart()
        }
    }

    onStoneChanged: {
        const grey = Qt.rgba(0.518, 0.529, 0.553, 1)
        const t = Math.min(1, root.stone / 0.85)
        for (let i = 0; i < root.surfaces.length; i++) {
            const surface = root.surfaces[i]
            if (root.stone >= 0.85) {
                surface.baseColorMap = null
                surface.baseColor = grey
                surface.roughness = 0.95
                continue
            }
            surface.baseColorMap = root.maps[i]
            surface.baseColor = Qt.rgba(1 + (grey.r * 0.7 - 1) * t, 1 + (grey.g * 0.7 - 1) * t, 1.03 + (grey.b * 0.7 - 1.03) * t, 1)
            surface.roughness = 0.5 + 0.45 * t
        }
    }

    SequentialAnimation {
        id: stoneAnimation

        PauseAnimation { duration: 600 }
        NumberAnimation { target: root; property: "stone"; from: 0; to: 1; duration: 1600; easing.type: Easing.InOutQuad }
    }

    SequentialAnimation {
        id: joltAnimation

        NumberAnimation { target: root; property: "jolt"; to: 1; duration: 60 }
        NumberAnimation { target: root; property: "jolt"; to: 0; duration: 200; easing.type: Easing.OutQuad }
    }

    function stopClips() {
        const objects = (loader.item as Node).data
        const surfaces = []
        for (let i = 0; i < objects.length; i++) {
            if (objects[i].metalness !== undefined) {
                objects[i].metalness = 0
                surfaces.push(objects[i])
            }
            if (objects[i].keyframeGroups === undefined) {
                continue
            }
            const timeline = objects[i] as Timeline
            for (let j = 0; j < timeline.animations.length; j++) {
                timeline.animations[j].running = false
            }
            timeline.enabled = false
        }
        const maps = []
        for (let i = 0; i < surfaces.length; i++) {
            maps.push(surfaces[i].baseColorMap)
        }
        root.maps = maps
        root.surfaces = surfaces
    }

    function nextClip(): string {
        const elapsed = root.clock - root.modeStart
        switch (root.mode) {
            case "intro":
                return elapsed < 1200 ? root.idleClip : root.roarClip
            case "roaring":
                return root.roarClip
            case "chasing":
                if (root.movingLeft <= 0) {
                    return root.idleClip
                }
                return root.boss.phase === 3 ? root.runClip : root.walkClip
            case "swiping":
                return root.boss.attack % 2 === 0 ? root.swipeClip : root.backhandClip
            case "slamming":
                return root.slamClip
            case "charging":
                return elapsed < 900 ? root.roarClip : root.runClip
            case "dead":
                return root.roarClip
            default:
                return root.idleClip
        }
    }

    function clipFrame(): real {
        const time = root.clock - root.clipStart
        if (root.mode === "dead") {
            return Math.min(time, 900)
        }
        switch (root.clip) {
            case root.idleClip:
                return time % 9134
            case root.walkClip:
                return (time * (root.boss.phase === 2 ? 1.25 : 1)) % 3034
            case root.runClip:
                return (time * (root.mode === "charging" ? 1.3 : 1)) % 1200
            case root.roarClip:
                return Math.min(time, 2300)
            case root.slamClip:
                return Math.min(time, 3734)
            default:
                return Math.min(time, 2034)
        }
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
        running: root.loaded

        onTriggered: {
            const step = Math.min(frameTime, 0.1) * 1000
            root.clock = root.clock + step
            root.movingLeft = Math.max(root.movingLeft - step, 0)

            if (root.position.x !== root.lastPosition.x || root.position.z !== root.lastPosition.z) {
                root.movingLeft = 150
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

    Node {
        x: Math.sin(root.clock * 0.08) * 0.12 * root.stone * (1 - root.stone)
        z: -root.jolt * 0.25

        Loader3D {
            id: loader

            active: root.active
            asynchronous: true
            source: Assets.url + root.modelPath
            scale: Qt.vector3d(root.modelScale, root.modelScale, root.modelScale)
            onLoaded: {
                root.stopClips()
                root.showClip()
                root.loaded = true
            }
        }
    }
}
