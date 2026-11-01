pragma ComponentBehavior: Bound

import QtQuick
import QtQuick3D
import QtQuick.Effects
import wayfare.presentation

Item {
    id: root

    readonly property real tileSize: 2
    readonly property real wallHeight: 3
    readonly property real eyeHeight: 1.6
    readonly property int lastStage: 6
    readonly property bool temple: Level.theme === "temple"
    property int stage: 0
    property real spin: 0
    property real strength: Level.air > 0.4 ? 0 : (Level.air > 0 ? 0.6 * (0.4 - Level.air) / 0.4 : 0.6 + 0.4 * (1 - Level.health / Level.maxHealth))
    readonly property bool shaking: root.strength > 0 && !Level.dead
    property real blur: root.strength > 0 ? 0.1 + 0.7 * root.strength : 0
    property real hurtTilt: 0
    property real pulse: 0

    Behavior on strength {
        NumberAnimation { duration: 800 }
    }

    Behavior on blur {
        NumberAnimation { duration: 600 }
    }

    onShakingChanged: {
        if (!root.shaking) {
            pulseAnimation.stop()
            root.hurtTilt = 0
            root.pulse = 0
        }
    }

    property int readyFrames: 0
    property bool captured: false
    property bool forwardKey: false
    property bool backKey: false
    property bool leftKey: false
    property bool rightKey: false
    property bool mapLarge: false

    focus: true

    function texture(name: string): string {
        return Assets.url + "textures/" + Level.theme + "/" + name + ".jpg"
    }

    function setKey(key: int, pressed: bool) {
        switch (key) {
            case Qt.Key_W:
                root.forwardKey = pressed
                break
            case Qt.Key_S:
                root.backKey = pressed
                break
            case Qt.Key_A:
                root.leftKey = pressed
                break
            case Qt.Key_D:
                root.rightKey = pressed
                break
        }
    }

    function buildWalls() {
        const walls = Level.walls
        const entries = []
        for (let i = 0; i < walls.length; i++) {
            entries.push(wallEntry.createObject(wallList, {
                position: Qt.vector3d((walls[i].x + 0.5) * root.tileSize, root.wallHeight / 2, (walls[i].y + 0.5) * root.tileSize),
                scale: Qt.vector3d(root.tileSize / 100, root.wallHeight / 100, root.tileSize / 100)
            }))
        }
        wallList.instances = entries
    }

    function releaseInput() {
        root.captured = false
        root.forwardKey = false
        root.backKey = false
        root.leftKey = false
        root.rightKey = false
    }

    Component.onCompleted: root.buildWalls()

    onCapturedChanged: {
        if (root.captured) {
            Cursor.center(root)
        }
    }

    Keys.onPressed: (event) => {
        if (event.key === Qt.Key_Escape) {
            root.releaseInput()
            return
        }
        if (event.key === Qt.Key_M && !event.isAutoRepeat) {
            root.mapLarge = !root.mapLarge
            return
        }
        if (!event.isAutoRepeat) {
            root.setKey(event.key, true)
        }
    }

    Keys.onReleased: (event) => {
        if (!event.isAutoRepeat) {
            root.setKey(event.key, false)
        }
    }

    Connections {
        target: root.Window.window
        enabled: root.readyFrames < 3

        function onAfterAnimating() {
            if (root.stage < root.lastStage) {
                root.stage++
                return
            }
            root.readyFrames++
            if (root.readyFrames === 3) {
                root.forceActiveFocus()
                root.captured = root.Window.active
            }
        }
    }

    Connections {
        target: root.Window.window

        function onActiveChanged() {
            if (!root.Window.active) {
                root.releaseInput()
            }
        }
    }

    Connections {
        target: Level

        function onDeadChanged() {
            if (Level.dead) {
                root.releaseInput()
                return
            }
            if (root.readyFrames >= 3) {
                Cursor.center(root)
                root.forceActiveFocus()
                root.captured = true
            }
        }
    }

    Component {
        id: wallEntry

        InstanceListEntry {}
    }

    NumberAnimation on spin {
        loops: Animation.Infinite
        from: 0
        to: 360
        duration: 6000
    }

    Timer {
        interval: 900
        repeat: true
        running: root.shaking
        triggeredOnStart: true
        onTriggered: pulseAnimation.restart()
    }

    SequentialAnimation {
        id: pulseAnimation

        NumberAnimation { target: root; property: "pulse"; from: 0; to: 1; duration: 70 }

        ParallelAnimation {
            NumberAnimation { target: root; property: "hurtTilt"; from: 0; to: 18; duration: 90; easing.type: Easing.OutQuad }
            NumberAnimation { target: root; property: "pulse"; to: 0.7; duration: 90 }
        }

        ParallelAnimation {
            NumberAnimation { target: root; property: "hurtTilt"; to: 0; duration: 300; easing.type: Easing.InOutQuad }
            NumberAnimation { target: root; property: "pulse"; to: 0; duration: 390 }
        }
    }

    FrameAnimation {
        running: root.readyFrames >= 3 && !Level.dead
        onTriggered: Level.move((root.forwardKey ? 1 : 0) - (root.backKey ? 1 : 0), (root.rightKey ? 1 : 0) - (root.leftKey ? 1 : 0), frameTime)
    }

    Item {
        id: screen

        anchors.fill: parent

        View3D {
            id: view

            anchors.fill: parent

            environment: SceneEnvironment {
                backgroundMode: SceneEnvironment.Color
                clearColor: root.temple ? "#06232a" : "#05070b"
                antialiasingMode: SceneEnvironment.MSAA
                antialiasingQuality: SceneEnvironment.Medium
                tonemapMode: SceneEnvironment.TonemapModeFilmic
                fog: Fog {
                    enabled: true
                    color: root.temple ? "#0b3a44" : "#05070b"
                    density: root.temple ? 0.95 : 1
                    depthEnabled: true
                    depthNear: root.temple ? 2.5 : 4
                    depthFar: root.temple ? 22 : 24
                    depthCurve: root.temple ? 0.8 : 1
                }
            }

            PerspectiveCamera {
                position: Qt.vector3d(Level.playerX * root.tileSize, root.eyeHeight, Level.playerY * root.tileSize)
                eulerRotation.x: Level.pitch * 180 / Math.PI
                eulerRotation.y: -Level.facing * 180 / Math.PI - 90
                eulerRotation.z: root.hurtTilt
                fieldOfView: 70
                clipNear: 0.05
                clipFar: 200

                PointLight {
                    color: root.temple ? "#7fd0dc" : "#ffe6c4"
                    brightness: root.temple ? 2.5 : 6
                    quadraticFade: root.temple ? 300 : 1.2
                }
            }

            DirectionalLight {
                visible: !root.temple
                eulerRotation: Qt.vector3d(-60, 30, 0)
                color: "#7c8aa8"
                brightness: 0.3
            }

            TempleScene {
                visible: root.temple
                tileSize: root.tileSize
                stage: root.stage
            }

            Node {
                visible: root.stage >= 3

                Repeater3D {
                    model: Level.pickups

                    delegate: ItemModel {
                        required property var modelData

                        item: modelData.type
                        position: Qt.vector3d((modelData.x + 0.5) * root.tileSize, 0.7 + Math.sin(root.spin * Math.PI / 90) * 0.08, (modelData.y + 0.5) * root.tileSize)
                        eulerRotation.y: root.spin
                    }
                }

                Node {
                    position: Qt.vector3d((Level.exitX + 0.5) * root.tileSize, 0, (Level.exitY + 0.5) * root.tileSize)

                    Model {
                        y: 0.04
                        source: "#Rectangle"
                        eulerRotation.x: -90
                        scale: Qt.vector3d(root.tileSize * 0.008, root.tileSize * 0.008, 1)
                        castsShadows: false
                        receivesShadows: false
                        materials: PrincipledMaterial {
                            lighting: PrincipledMaterial.NoLighting
                            alphaMode: PrincipledMaterial.Blend
                            baseColor: Level.exitUnlocked ? "#7ff4ff" : "#d9822b"
                            opacity: 0.6
                        }
                    }

                    PointLight {
                        y: 1.2
                        color: Level.exitUnlocked ? "#9ff4ff" : "#e09040"
                        brightness: 1
                        quadraticFade: 6000
                    }
                }
            }

            Model {
                visible: root.stage >= 1
                source: "#Rectangle"
                position: Qt.vector3d(Level.size * root.tileSize / 2, 0, Level.size * root.tileSize / 2)
                eulerRotation.x: -90
                scale: Qt.vector3d(Level.size * root.tileSize / 100, Level.size * root.tileSize / 100, 1)
                materials: PrincipledMaterial {
                    baseColorMap: Texture {
                        source: root.texture("floor_diffuse")
                        scaleU: Level.size
                        scaleV: Level.size
                    }
                    normalMap: Texture {
                        source: root.texture("floor_normal")
                        scaleU: Level.size
                        scaleV: Level.size
                    }
                    roughnessMap: Texture {
                        source: root.texture("floor_roughness")
                        scaleU: Level.size
                        scaleV: Level.size
                    }
                    roughnessChannel: Material.R
                }
            }

            Model {
                visible: root.stage >= 2
                source: "#Cube"
                instancing: InstanceList {
                    id: wallList
                }
                materials: root.temple ? [templeWall] : [plainWall]

                PrincipledMaterial {
                    id: plainWall

                    baseColorMap: Texture {
                        source: root.texture("wall_diffuse")
                        scaleV: root.wallHeight / root.tileSize
                    }
                    normalMap: Texture {
                        source: root.texture("wall_normal")
                        scaleV: root.wallHeight / root.tileSize
                    }
                    roughnessMap: Texture {
                        source: root.texture("wall_roughness")
                        scaleV: root.wallHeight / root.tileSize
                    }
                    roughnessChannel: Material.R
                }

                TempleWallMaterial {
                    id: templeWall

                    wallTop: root.wallHeight
                }
            }
        }

        Hud {
            anchors.fill: parent
            flash: root.pulse
        }

        Minimap {
            anchors.fill: parent
            large: root.mapLarge
        }
    }

    MultiEffect {
        anchors.fill: screen
        source: screen
        visible: root.blur > 0
        blurEnabled: true
        blurMax: 40
        blur: root.blur
    }

    Rectangle {
        anchors.fill: parent
        color: "#c01010"
        opacity: root.pulse * (0.25 + 0.2 * root.strength)
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: root.captured ? Qt.BlankCursor : Qt.ArrowCursor

        onPressed: {
            if (root.readyFrames >= 3 && !Level.dead) {
                root.forceActiveFocus()
                root.captured = true
            }
        }

        onPositionChanged: (mouse) => {
            if (!root.captured) {
                return
            }
            const deltaX = mouse.x - width / 2
            const deltaY = mouse.y - height / 2
            if (Math.abs(deltaX) < 1 && Math.abs(deltaY) < 1) {
                return
            }
            Level.look(deltaX, deltaY)
            Cursor.center(root)
        }
    }

    DeathScreen {
        anchors.fill: parent
        visible: Level.dead
        message: Level.deathMessage
        onRespawnClicked: Level.respawn()
        onMenuClicked: Level.quitToMenu()
    }

    LoadingCover {
        anchors.fill: parent
        loading: root.readyFrames < 3
    }
}
