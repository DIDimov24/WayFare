pragma ComponentBehavior: Bound

import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick.Effects
import wayfare.presentation

Item {
    id: root

    readonly property real tileSize: 2
    readonly property real wallHeight: 3
    readonly property real eyeHeight: 1.6
    readonly property real nicheDepth: 0.8
    readonly property int lastStage: 6
    readonly property bool temple: Level.theme === "temple"
    readonly property bool dungeon: Level.theme === "dungeon"
    readonly property bool village: Level.theme === "village"
    readonly property bool ladderExit: root.temple || root.dungeon
    readonly property var enemies: Level.enemies
    readonly property var trapHeights: Level.trapHeights
    property int loadedEnemies: 0
    property int stage: 0
    property real spin: 0
    property real strength: Level.air > 0.4 ? 0 : (Level.air > 0 ? 0.6 * (0.4 - Level.air) / 0.4 : 0.6 + 0.4 * (1 - Level.health / Level.maxHealth))
    readonly property bool shaking: root.strength > 0 && !Level.dead && !root.paused
    property real blur: root.strength > 0 ? 0.1 + 0.7 * root.strength : 0
    property real hurtTilt: 0
    property real quake: 0
    property real letterbox: Level.bossCutscene ? 1 : 0
    readonly property bool deathView: Level.bossCutscene && Level.boss.state === "dead"
    property real deathDistance: 3.4
    property real pulse: 0
    property real tinnitusLevel: 0

    Behavior on strength {
        NumberAnimation { duration: 800 }
    }

    Behavior on blur {
        NumberAnimation { duration: 600 }
    }

    Behavior on letterbox {
        NumberAnimation { duration: 400; easing.type: Easing.InOutQuad }
    }

    onShakingChanged: {
        if (root.shaking) {
            root.tinnitusLevel = 0
            tinnitus.play()
            tinnitusRise.restart()
            return
        }
        tinnitusRise.stop()
        tinnitus.stop()
        pulseAnimation.stop()
        root.hurtTilt = 0
        root.pulse = 0
    }

    MediaPlayer {
        id: ambience
        source: Assets.url + "audio/temple_ambience.ogg"
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100
        }
    }

    SoundEffect {
        id: tinnitus
        source: Assets.url + "audio/tinnitus.wav"
        loops: SoundEffect.Infinite
        volume: root.tinnitusLevel * Settings.sfxVolume / 100
    }

    BossAudio {
        active: root.readyFrames >= 3
    }

    NumberAnimation {
        id: tinnitusRise
        target: root
        property: "tinnitusLevel"
        from: 0
        to: 1
        duration: 9500
        easing.type: Easing.InCubic
    }

    property int readyFrames: 0
    property bool captured: false
    property bool forwardKey: false
    property bool backKey: false
    property bool leftKey: false
    property bool rightKey: false
    property bool mapLarge: false
    property bool paused: false

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
        const yaw = root.exitYaw()
        const nicheX = yaw === -90 ? Level.exitX + 1 : Level.exitX
        const nicheY = yaw === -90 ? Level.exitY : Level.exitY + 1
        for (let i = 0; i < walls.length; i++) {
            const position = Qt.vector3d((walls[i].x + 0.5) * root.tileSize, root.wallHeight / 2, (walls[i].y + 0.5) * root.tileSize)
            const scale = Qt.vector3d(root.tileSize / 100, root.wallHeight / 100, root.tileSize / 100)
            if (root.ladderExit && walls[i].x === nicheX && walls[i].y === nicheY) {
                if (yaw === -90) {
                    position.x = position.x + root.nicheDepth / 2
                    scale.x = (root.tileSize - root.nicheDepth) / 100
                } else {
                    position.z = position.z + root.nicheDepth / 2
                    scale.z = (root.tileSize - root.nicheDepth) / 100
                }
            }
            entries.push(wallEntry.createObject(wallList, {
                position: position,
                scale: scale
            }))
        }
        wallList.instances = entries
    }

    function deathCameraSpot(along: real, height: real): vector3d {
        const low = (Level.boss.arenaFirst + 0.4) * root.tileSize
        const high = (Level.boss.arenaLast + 0.6) * root.tileSize
        const x = (Level.boss.x + Math.cos(Level.boss.facing) * along) * root.tileSize
        const z = (Level.boss.y + Math.sin(Level.boss.facing) * along) * root.tileSize
        return Qt.vector3d(Math.max(low, Math.min(high, x)), height, Math.max(low, Math.min(high, z)))
    }

    function exitYaw(): real {
        const walls = Level.walls
        for (let i = 0; i < walls.length; i++) {
            if (walls[i].x === Level.exitX - 1 && walls[i].y === Level.exitY) {
                return 180
            }
        }
        return -90
    }

    function releaseInput() {
        root.captured = false
        root.forwardKey = false
        root.backKey = false
        root.leftKey = false
        root.rightKey = false
    }

    function setPaused(value: bool) {
        root.paused = value
        if (value) {
            root.releaseInput()
            return
        }
        root.forceActiveFocus()
        root.captured = root.Window.active
    }

    Component.onCompleted: root.buildWalls()

    onCapturedChanged: {
        if (root.captured) {
            Cursor.center(root)
        }
    }

    Keys.onPressed: (event) => {
        if (event.key === Qt.Key_Escape) {
            if (root.readyFrames < 3 || Level.dead) {
                return
            }
            if (root.paused && pauseMenu.panel !== "") {
                pauseMenu.panel = ""
                return
            }
            root.setPaused(!root.paused)
            return
        }
        if (root.paused) {
            return
        }
        if (event.key === Qt.Key_M && !event.isAutoRepeat) {
            root.mapLarge = !root.mapLarge
            return
        }
        if (!event.isAutoRepeat) {
            root.setKey(event.key, true)
            if (event.key === Qt.Key_1) {
                Level.selectWeapon("sword")
            }
            if (event.key === Qt.Key_2) {
                Level.selectWeapon("pistol")
            }
            if (event.key === Qt.Key_Q) {
                Level.drinkPotion()
            }
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
            if (root.loadedEnemies < Level.enemyCount || !troll.ready) {
                return
            }
            root.readyFrames++
            if (root.readyFrames === 3) {
                root.forceActiveFocus()
                root.captured = root.Window.active
                if (root.temple) {
                    ambience.play()
                }
            }
        }
    }

    Connections {
        target: root.Window.window

        function onActiveChanged() {
            if (!root.Window.active) {
                root.releaseInput()
                if (root.readyFrames >= 3 && !Level.dead) {
                    root.paused = true
                }
            }
        }
    }

    Connections {
        target: Level

        function onItemCollected(item: string) {
            Sounds.pickUp(item)
        }

        function onPlayerDamaged() {
            pulseAnimation.restart()
        }

        function onWeaponUsed(weapon: string, hit: bool) {
            Sounds.attack(weapon, hit)
        }

        function onWeaponChanged() {
            if (root.readyFrames >= 3) {
                Sounds.equipWeapon(Level.weapon)
            }
        }

        function onPotionUsed() {
            Sounds.potion.play()
        }

        function onBossSlammed() {
            quakeAnimation.restart()
        }

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

    NumberAnimation {
        target: root
        property: "deathDistance"
        running: root.deathView
        from: 3.4
        to: 2.4
        duration: 3000
        easing.type: Easing.InOutSine
    }

    SequentialAnimation {
        id: quakeAnimation

        NumberAnimation { target: root; property: "quake"; to: 1; duration: 50 }
        NumberAnimation { target: root; property: "quake"; to: -0.8; duration: 90 }
        NumberAnimation { target: root; property: "quake"; to: 0.5; duration: 100 }
        NumberAnimation { target: root; property: "quake"; to: -0.25; duration: 110 }
        NumberAnimation { target: root; property: "quake"; to: 0; duration: 150 }
    }

    FrameAnimation {
        running: root.readyFrames >= 3 && !Level.dead && !root.paused
        onTriggered: {
            if (root.captured) {
                const delta = Cursor.takeDelta(root)
                if (delta.x !== 0 || delta.y !== 0) {
                    Level.look(delta.x, delta.y)
                }
            }
            Level.move((root.forwardKey ? 1 : 0) - (root.backKey ? 1 : 0), (root.rightKey ? 1 : 0) - (root.leftKey ? 1 : 0), frameTime)
        }
    }

    Item {
        id: screen

        anchors.fill: parent

        View3D {
            id: view

            anchors.fill: parent

            camera: root.deathView ? deathCamera : playerCamera
            environment: SceneEnvironment {
                backgroundMode: SceneEnvironment.Color
                clearColor: root.temple ? "#06232a" : (root.dungeon ? "#05070b" : "#2a3342")
                antialiasingMode: SceneEnvironment.MSAA
                antialiasingQuality: SceneEnvironment.Medium
                tonemapMode: SceneEnvironment.TonemapModeFilmic
                fog: Fog {
                    enabled: true
                    color: root.temple ? "#0b3a44" : (root.dungeon ? "#05070b" : "#2a3342")
                    density: root.temple ? 0.95 : (root.dungeon ? 1 : 0.9)
                    depthEnabled: true
                    depthNear: root.temple ? 2.5 : (root.dungeon ? 2 : 4)
                    depthFar: root.temple ? 22 : (root.dungeon ? 17 : 24)
                    depthCurve: root.temple ? 0.8 : 1
                }
            }

            Node {
                id: deathFocus

                position: root.deathCameraSpot(0, 2.4)
            }

            PerspectiveCamera {
                id: deathCamera

                position: root.deathCameraSpot(root.deathDistance, 1.7)
                lookAtNode: deathFocus
                fieldOfView: 55
                clipNear: 0.05
                clipFar: 200
            }

            PerspectiveCamera {
                id: playerCamera

                position: Qt.vector3d(Level.playerX * root.tileSize, root.eyeHeight + root.quake * 0.08, Level.playerY * root.tileSize)
                eulerRotation.x: Level.pitch * 180 / Math.PI + root.quake * 2.5
                eulerRotation.y: -Level.facing * 180 / Math.PI - 90
                eulerRotation.z: root.hurtTilt
                fieldOfView: 70
                clipNear: 0.05
                clipFar: 200

                PointLight {
                    color: root.temple ? "#7fd0dc" : (root.dungeon ? "#ffe6c4" : "#d5ddef")
                    brightness: root.temple ? 2.5 : (root.dungeon ? 0.75 : 0.7)
                    quadraticFade: root.temple ? 300 : (root.dungeon ? 3000 : 800)
                }

                FirstPersonWeapon {
                    visible: root.stage >= 3 && Level.armed
                }
            }

            DirectionalLight {
                visible: !root.temple
                eulerRotation: Qt.vector3d(-60, 30, 0)
                color: root.dungeon ? "#7c8aa8" : "#a9bbdc"
                brightness: root.dungeon ? 0.04 : 1.15
                ambientColor: root.dungeon ? "#1c1814" : "#364256"
            }

            TempleScene {
                visible: root.temple
                tileSize: root.tileSize
                stage: root.stage
            }

            Loader3D {
                active: root.dungeon
                sourceComponent: DungeonScene {
                    tileSize: root.tileSize
                    stage: root.stage
                }
            }

            Loader3D {
                active: root.village
                sourceComponent: SnowyVillageScene {
                    tileSize: root.tileSize
                    wallHeight: root.wallHeight
                    stage: root.stage
                }
            }

            Node {
                visible: root.stage >= 5

                Repeater3D {
                    model: Level.traps

                    delegate: SpikeTrapModel {
                        required property var modelData
                        required property int index

                        position: Qt.vector3d((modelData.x + 0.5) * root.tileSize, 0, (modelData.y + 0.5) * root.tileSize)
                        tileSize: root.tileSize
                        rise: root.trapHeights[index]
                    }
                }

                Repeater3D {
                    model: root.dungeon ? Level.enemyCount : 0

                    delegate: ZombieModel {
                        id: zombie

                        required property int index

                        enemy: root.enemies[zombie.index]
                        tileSize: root.tileSize
                        phase: zombie.index * 870
                        onReadyChanged: {
                            if (zombie.ready) {
                                root.loadedEnemies++
                            }
                        }
                    }
                }

                Repeater3D {
                    model: root.village ? Level.enemyCount : 0

                    delegate: NightmareCreatureModel {
                        id: creature

                        required property int index

                        enemy: root.enemies[creature.index]
                        tileSize: root.tileSize
                        phase: creature.index * 210
                        onReadyChanged: {
                            if (creature.ready) {
                                root.loadedEnemies++
                            }
                        }
                    }
                }

                TrollModel {
                    id: troll

                    active: Level.hasBoss
                    visible: Level.hasBoss
                    boss: Level.boss
                    tileSize: root.tileSize
                    animated: Level.boss.state !== "waiting" || Math.abs(Level.boss.x - Level.playerX) + Math.abs(Level.boss.y - Level.playerY) < 20
                }
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
                    visible: root.ladderExit
                    position: Qt.vector3d((Level.exitX + 0.5) * root.tileSize, 0, (Level.exitY + 0.5) * root.tileSize)
                    eulerRotation.y: root.exitYaw()

                    LadderModel {
                        z: -root.tileSize / 2 - root.nicheDepth + 0.08
                        height: root.wallHeight
                    }

                    Model {
                        position: Qt.vector3d(0, root.wallHeight - 0.01, -root.tileSize / 2 - root.nicheDepth / 2)
                        source: "#Rectangle"
                        eulerRotation.x: 90
                        scale: Qt.vector3d(root.tileSize * 0.0045, root.nicheDepth * 0.01, 1)
                        castsShadows: false
                        receivesShadows: false
                        materials: PrincipledMaterial {
                            lighting: PrincipledMaterial.NoLighting
                            baseColor: "#010405"
                        }
                    }

                    PointLight {
                        position: Qt.vector3d(0, root.wallHeight - 0.4, -root.tileSize / 2)
                        color: root.dungeon ? "#ffb060" : (Level.exitUnlocked ? "#9ff4ff" : "#e09040")
                        brightness: Level.exitUnlocked ? 1 : 0.5
                        quadraticFade: 6000
                    }
                }

                Node {
                    visible: !root.ladderExit && (!Level.hasBoss || (Level.boss.state === "dead" && !Level.bossCutscene))
                    position: Qt.vector3d((Level.exitX + 0.5) * root.tileSize, 0, (Level.exitY + 0.5) * root.tileSize)

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
                    specularAmount: root.temple ? 0.5 : 0
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
                    specularAmount: 0
                }

                TempleWallMaterial {
                    id: templeWall

                    wallTop: root.wallHeight
                }
            }
        }

        Hud {
            anchors.fill: parent
            visible: !root.deathView
            flash: root.pulse
        }

        Minimap {
            anchors.fill: parent
            visible: !root.deathView
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

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height * 0.11 * root.letterbox
        color: "#000000"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height * 0.11 * root.letterbox
        color: "#000000"
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: root.captured ? Qt.BlankCursor : Qt.ArrowCursor

        onPressed: {
            if (root.readyFrames < 3 || Level.dead || root.paused) {
                return
            }
            if (root.captured) {
                Level.attack()
                return
            }
            root.forceActiveFocus()
            root.captured = true
        }
    }

    DeathScreen {
        anchors.fill: parent
        visible: Level.dead
        message: Level.deathMessage
        onRespawnClicked: Level.respawn()
        onMenuClicked: Level.quitToMenu()
    }

    PauseMenu {
        id: pauseMenu

        anchors.fill: parent
        visible: root.paused
        onResumeClicked: root.setPaused(false)
        onMenuClicked: Level.saveAndQuit()
    }

    LoadingCover {
        anchors.fill: parent
        loading: root.readyFrames < 3
    }
}
