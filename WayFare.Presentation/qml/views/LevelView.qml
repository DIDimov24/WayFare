import QtQuick
import QtQuick3D
import wayfare.presentation

Item {
    id: root

    readonly property real tileSize: 2
    readonly property real wallHeight: 3
    readonly property real eyeHeight: 1.6
    readonly property int lastStage: 2
    property int stage: 0
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

    Component {
        id: wallEntry

        InstanceListEntry {}
    }

    FrameAnimation {
        running: root.readyFrames >= 3
        onTriggered: Level.move((root.forwardKey ? 1 : 0) - (root.backKey ? 1 : 0), (root.rightKey ? 1 : 0) - (root.leftKey ? 1 : 0), frameTime)
    }

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.Color
            clearColor: "#05070b"
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            fog: Fog {
                enabled: true
                color: "#05070b"
                depthEnabled: true
                depthNear: 4
                depthFar: 24
            }
        }

        PerspectiveCamera {
            position: Qt.vector3d(Level.playerX * root.tileSize, root.eyeHeight, Level.playerY * root.tileSize)
            eulerRotation.x: Level.pitch * 180 / Math.PI
            eulerRotation.y: -Level.facing * 180 / Math.PI - 90
            fieldOfView: 70
            clipNear: 0.05
            clipFar: 200

            PointLight {
                color: "#ffe6c4"
                brightness: 6
                quadraticFade: 1.2
            }
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-60, 30, 0)
            color: "#7c8aa8"
            brightness: 0.3
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
            materials: PrincipledMaterial {
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
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: root.captured ? Qt.BlankCursor : Qt.ArrowCursor

        onPressed: {
            if (root.readyFrames >= 3) {
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

    Hud {
        anchors.fill: parent
    }

    Minimap {
        anchors.fill: parent
        large: root.mapLarge
    }

    LoadingCover {
        anchors.fill: parent
        loading: root.readyFrames < 3
    }
}
