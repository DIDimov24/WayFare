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
    property bool gear: false
    property bool suit: false
    property bool mask: false
    property bool maskInHand: false
    property bool mitten: false
    property real stone: 0
    property var surfaces: []
    property var maps: []
    property Node spine: null
    property Node head: null
    property Node leftFoot: null
    property Node rightFoot: null
    property Node rightHand: null
    property Node leftHand: null
    readonly property real firstFrame: 1000 / 30
    readonly property bool ready: !loader.active || loader.status === Loader3D.Ready || loader.status === Loader3D.Error

    onClipChanged: playClip()
    onTimeChanged: showFrame()
    onLoopChanged: showFrame()
    onStoneChanged: shade()
    onSuitChanged: shade()

    Loader3D {
        id: loader
        active: Assets.exists("models/hero/Hero.qml")
        asynchronous: true
        source: Assets.url + "models/hero/Hero.qml"
        scale: Qt.vector3d(0.6, 0.6, 0.6)
        onLoaded: {
            root.attachGear()
            root.playClip()
        }
    }

    component Worn: Model {
        id: worn

        property Node joint: null
        property vector3d at: Qt.vector3d(0, 0, 0)
        property quaternion turn: Qt.quaternion(1, 0, 0, 0)
        property color tint: "#15181c"
        readonly property quaternion jointTurn: worn.joint === null ? Qt.quaternion(1, 0, 0, 0) : root.sceneRotation.inverted().times(worn.joint.sceneRotation)

        position: worn.joint === null ? Qt.vector3d(0, 0, 0) : root.mapPositionFromScene(worn.joint.scenePosition.plus(worn.joint.sceneRotation.times(worn.at.times(worn.joint.sceneScale))))
        rotation: worn.jointTurn.times(worn.turn)
        scale: Qt.vector3d(0.6, 0.6, 0.6)
        materials: PrincipledMaterial {
            baseColor: worn.tint
            roughness: 0.45
            cullMode: Material.NoCulling
        }
    }

    Worn {
        visible: root.mask && root.head !== null
        joint: root.head
        source: Assets.url + "models/dive_mask/meshes/dive_mask.mesh"
        at: Qt.vector3d(14.617, -320.219, 92.245)
        turn: Qt.quaternion(0.98961, -0.14184, 0.00332, 0.02318)
    }

    Worn {
        visible: root.gear && root.leftFoot !== null
        joint: root.leftFoot
        source: Assets.url + "models/dive_fins/meshes/dive_fin_left.mesh"
        at: Qt.vector3d(20.151, 18.757, -14.934)
        turn: Qt.quaternion(0.0378, 0.01708, 0.41137, 0.91052)
        tint: "#0f2f42"
    }

    Worn {
        visible: root.gear && root.rightFoot !== null
        joint: root.rightFoot
        source: Assets.url + "models/dive_fins/meshes/dive_fin_right.mesh"
        at: Qt.vector3d(-20.377, 18.373, -15.104)
        turn: Qt.quaternion(0.04354, 0.01989, -0.41508, -0.90852)
        tint: "#0f2f42"
    }

    Node {
        visible: root.maskInHand && root.leftHand !== null
        position: root.leftHand === null ? Qt.vector3d(0, 0, 0) : root.mapPositionFromScene(root.leftHand.scenePosition.plus(root.leftHand.sceneRotation.times(Qt.vector3d(0, 0.1, 0.05))))
        rotation: root.leftHand === null ? Qt.quaternion(1, 0, 0, 0) : root.sceneRotation.inverted().times(root.leftHand.sceneRotation)

        Model {
            source: Assets.url + "models/dive_mask/meshes/dive_mask.mesh"
            position: Qt.vector3d(-0.018, -2.088, -0.084)
            scale: Qt.vector3d(0.6, 0.6, 0.6)
            materials: PrincipledMaterial {
                baseColor: "#15181c"
                roughness: 0.45
                cullMode: Material.NoCulling
            }
        }
    }

    Node {
        visible: root.mitten && root.rightHand !== null
        position: root.rightHand === null ? Qt.vector3d(0, 0, 0) : root.mapPositionFromScene(root.rightHand.scenePosition.plus(root.rightHand.sceneRotation.times(Qt.vector3d(0, 0.11, 0.04))))
        rotation: root.rightHand === null ? Qt.quaternion(1, 0, 0, 0) : root.sceneRotation.inverted().times(root.rightHand.sceneRotation)

        MittenModel {
            stone: root.stone >= 0.85
        }
    }

    ScubaGearModel {
        readonly property quaternion spineTurn: root.spine === null ? Qt.quaternion(1, 0, 0, 0) : root.sceneRotation.inverted().times(root.spine.sceneRotation)

        visible: root.gear && root.spine !== null
        position: root.spine === null ? Qt.vector3d(0, 0, 0) : root.mapPositionFromScene(root.spine.scenePosition).plus(spineTurn.times(Qt.vector3d(0, -0.072, -0.012)))
        rotation: spineTurn.times(Qt.quaternion(0, 0, 1, 0))
    }

    function findJoint(node: Node, name: string): Node {
        if (node === null) {
            return null
        }
        if (node.objectName === name) {
            return node
        }
        for (let i = 0; i < node.children.length; i++) {
            const found = root.findJoint(node.children[i] as Node, name)
            if (found !== null) {
                return found
            }
        }
        return null
    }

    function attachGear() {
        const item = loader.item as Node
        const spine = root.findJoint(item, "mixamorig:Spine2")
        root.spine = spine
        root.head = root.findJoint(item, "mixamorig:Head")
        root.leftFoot = root.findJoint(item, "mixamorig:LeftFoot")
        root.rightFoot = root.findJoint(item, "mixamorig:RightFoot")
        root.rightHand = root.findJoint(item, "mixamorig:RightHand")
        root.leftHand = root.findJoint(item, "mixamorig:LeftHand")

        const surfaces = []
        for (let i = 0; i < item.data.length; i++) {
            if (item.data[i].baseColor !== undefined) {
                surfaces.push(item.data[i])
            }
        }
        const maps = []
        for (let i = 0; i < surfaces.length; i++) {
            maps.push(surfaces[i].baseColorMap)
        }
        root.maps = maps
        root.surfaces = surfaces
        root.shade()
    }

    function shade() {
        const grey = Qt.rgba(0.518, 0.529, 0.553, 1)
        const t = Math.min(1, root.stone / 0.85)
        for (let i = 0; i < root.surfaces.length; i++) {
            const surface = root.surfaces[i]
            const cloth = surface.objectName === "Topmat" || surface.objectName === "Bottommat"
            if (root.stone >= 0.85) {
                surface.baseColorMap = null
                surface.baseColor = grey
                surface.roughness = 0.95
                continue
            }
            surface.baseColorMap = root.maps[i]
            const base = root.suit && cloth ? Qt.rgba(0.05, 0.06, 0.08, 1) : Qt.rgba(1, 1, 1.04, 1)
            surface.baseColor = Qt.rgba(base.r + (grey.r * 0.7 - base.r) * t, base.g + (grey.g * 0.7 - base.g) * t, base.b + (grey.b * 0.7 - base.b) * t, 1)
            surface.roughness = (root.suit && cloth ? 0.45 : 0.6) + 0.35 * t
        }
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
