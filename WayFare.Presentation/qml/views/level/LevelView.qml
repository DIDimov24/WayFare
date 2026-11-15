pragma ComponentBehavior: Bound

import QtQuick
import QtMultimedia
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Effects
import wayfare.presentation

Item {
    id: root

    readonly property real tileSize: 2
    readonly property real wallHeight: 3
    readonly property real eyeHeight: 1.6
    readonly property real nicheDepth: root.temple ? 1.5 : 0.8
    readonly property real shaftReach: 0.9
    readonly property int lastStage: 6
    readonly property bool temple: Level.theme === "temple"
    readonly property bool dungeon: Level.theme === "dungeon"
    readonly property bool village: Level.theme === "village"
    readonly property bool ladderExit: root.temple || root.dungeon
    readonly property var enemies: Level.enemies
    readonly property var trapHeights: Level.trapHeights
    property bool preview: false
    property int loadedEnemies: 0
    property int stage: 0
    property real spin: 0
    property real strength: Level.air > 0.4 ? 0 : (Level.air > 0 ? 0.6 * (0.4 - Level.air) / 0.4 : 0.6 + 0.4 * (1 - Level.health / Level.maxHealth))
    readonly property bool shaking: root.strength > 0 && !Level.dead && !root.paused
    property real blur: root.strength > 0 ? 0.1 + 0.7 * root.strength : 0
    property real hurtTilt: 0
    property real quake: 0
    property real letterbox: Level.bossCutscene || root.dying ? 1 : 0
    readonly property bool deathView: Level.bossCutscene && Level.boss.state === "dead"
    readonly property real dyingLength: 7600
    property real dyingTime: 0
    readonly property bool dying: Level.dead && root.dyingTime < root.dyingLength
    readonly property bool creatureDeath: Level.deathCause === "creature" || Level.deathCause === "boss"
    readonly property bool risen: Level.deathCause !== "drowned" && root.dyingTime >= 1500
    readonly property real ooze: Math.max(0, Math.min(1, (root.dyingTime - 1500) / 2000))
    readonly property real riseLinear: Math.max(0, Math.min(1, (root.dyingTime - 3500) / 2100))
    readonly property real rise: root.riseLinear * root.riseLinear * (3 - 2 * root.riseLinear)
    readonly property real reshape: 1 - root.rise
    readonly property bool heroReady: !heroBody.active || heroBody.status === Loader3D.Error || (heroBody.status === Loader3D.Ready && (heroBody.item as HeroModel).ready)
    readonly property real bodyFade: 1 - Math.max(0, Math.min(1, (root.dyingTime - 2000) / 2600))
    readonly property real crawl: -0.55 + 0.6 * root.ooze
    readonly property real bodyYaw: Math.atan2(root.viewDirection.x, root.viewDirection.z) * 180 / Math.PI
    property vector3d fallSpot: Qt.vector3d(0, 0, 0)
    property real fallYaw: 0
    property vector3d bodySpot: Qt.vector3d(0, 0, 0)
    property vector3d viewDirection: Qt.vector3d(0, 0, 1)
    property real viewDistance: 2.6
    property real backDistance: 0
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
        source: Assets.url + "audio/" + (root.temple ? "temple_ambience.ogg" : (root.dungeon ? "dungeon_music.ogg" : "village_music.ogg"))
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: Settings.musicVolume / 100 * root.levelMusic * (Level.dead ? 0.4 : 1)
        }
    }

    property real levelMusic: Level.hasBoss && Level.boss.state !== "waiting" ? 0 : 1

    Behavior on levelMusic {
        NumberAnimation { duration: 2500 }
    }

    SoundEffect {
        id: underwaterHurt
        source: Assets.url + "audio/underwater_hurt.wav"
        volume: Settings.sfxVolume / 100
    }

    SoundEffect {
        id: hurtSound
        source: Assets.url + "audio/hurt.wav"
        volume: Settings.sfxVolume / 100
    }

    SoundEffect {
        id: spikeHit
        source: Assets.url + "audio/spike_hit.wav"
        volume: Settings.sfxVolume / 100
    }

    SoundEffect {
        id: trollHit
        source: Assets.url + "audio/troll_hit.wav"
        volume: Settings.sfxVolume / 100
    }

    SoundEffect {
        id: deathSound
        source: Assets.url + "audio/" + (Level.deathCause === "drowned" ? "underwater_death.wav" : (Level.deathCause === "zombie" || Level.deathCause === "trap" ? "zombie_rise.wav" : "creature_rise.wav"))
        volume: Settings.sfxVolume / 100
    }

    NumberAnimation {
        id: dyingAnimation
        target: root
        property: "dyingTime"
        from: 0
        to: root.dyingLength
        duration: root.dyingLength
    }

    Timer {
        id: riseSound
        interval: 1600
        onTriggered: deathSound.play()
    }

    function wallAt(x: int, y: int): bool {
        if (x < 0 || y < 0 || x >= Level.size || y >= Level.size) {
            return true
        }
        const walls = Level.walls
        for (let i = 0; i < walls.length; i++) {
            if (walls[i].x === x && walls[i].y === y) {
                return true
            }
        }
        return false
    }

    function freeTiles(x: int, y: int, dx: int, dy: int): int {
        let count = 0
        while (count < 3 && !root.wallAt(x + dx * (count + 1), y + dy * (count + 1))) {
            count++
        }
        return count
    }

    function placeDeathView() {
        const x = Math.floor(Level.playerX)
        const y = Math.floor(Level.playerY)
        const directions = [Qt.point(1, 0), Qt.point(-1, 0), Qt.point(0, 1), Qt.point(0, -1)]
        let best = 0
        let bestScore = -1
        for (let i = 0; i < directions.length; i++) {
            const d = directions[i]
            const facing = d.x * Math.cos(Level.facing) + d.y * Math.sin(Level.facing)
            const away = -(d.x * (Level.boss.x - Level.playerX) + d.y * (Level.boss.y - Level.playerY))
            const bossBehind = Level.deathCause === "boss" && away > 0.5 ? 2 : 0
            const score = root.freeTiles(x, y, d.x, d.y) + (facing > 0.7 ? 0.5 : 0) + bossBehind
            if (score > bestScore) {
                bestScore = score
                best = i
            }
        }
        const view = directions[best]
        const ahead = root.freeTiles(x, y, view.x, view.y)
        const behind = root.freeTiles(x, y, -view.x, -view.y)
        root.bodySpot = Qt.vector3d((x + 0.5) * root.tileSize, 0, (y + 0.5) * root.tileSize)
        root.viewDirection = Qt.vector3d(view.x, 0, view.y)
        root.viewDistance = Math.min(root.creatureDeath ? 3.6 : 2.7, ahead * root.tileSize + 0.5)
        root.backDistance = Math.min(2.3, behind * root.tileSize + 0.3)
    }

    function riseClip(model: EnemyModel): string {
        if (!Level.dead || !root.risen) {
            return ""
        }
        if (root.dyingTime < 5600) {
            return model.deathClip
        }
        if (model.alertClip !== "") {
            return model.alertClip
        }
        return model.attackClip
    }

    function riseFrame(model: EnemyModel): real {
        if (root.dyingTime < 5600) {
            return model.deathLength * (1 - root.rise)
        }
        if (model.alertClip !== "") {
            return Math.min(model.alertLength, (root.dyingTime - 5600) * 1.7)
        }
        return Math.min(model.attackLength, (root.dyingTime - 5600) * 0.6)
    }

    function startDying() {
        const eye = playerCamera.position
        root.fallSpot = Qt.vector3d(eye.x, 0, eye.z)
        root.fallYaw = -Level.facing * 180 / Math.PI - 90
        root.placeDeathView()
        root.dyingTime = 0
        dyingAnimation.restart()
        if (Level.deathCause === "drowned") {
            deathSound.play()
            return
        }
        riseSound.restart()
    }

    function skipDying() {
        dyingAnimation.stop()
        root.dyingTime = root.dyingLength
    }

    SoundEffect {
        id: tinnitus
        source: Assets.url + "audio/tinnitus.wav"
        loops: SoundEffect.Infinite
        volume: root.tinnitusLevel * Settings.sfxVolume / 100
    }

    BossAudio {
        id: bossAudio

        active: root.readyFrames >= 3 && !root.preview
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

    function exitHole(): vector4d {
        const half = root.tileSize / 2
        const x = (Level.exitX + 0.5) * root.tileSize
        const z = (Level.exitY + 0.5) * root.tileSize
        if (root.exitYaw() === 180) {
            return Qt.vector4d(x - half + 0.05, z + half - root.shaftReach, x + half - 0.05, z + half + root.nicheDepth - 0.05)
        }
        return Qt.vector4d(x + half - root.shaftReach, z - half + 0.05, x + half + root.nicheDepth - 0.05, z + half - 0.05)
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
        if (root.dying && (event.key === Qt.Key_Space || event.key === Qt.Key_Escape)) {
            root.skipDying()
            return
        }
        if (Level.dead) {
            return
        }
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
            if (event.key === Qt.Key_3) {
                Level.selectWeapon("potion")
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
            if (root.loadedEnemies < Level.enemyCount || !troll.ready || !root.heroReady) {
                return
            }
            root.readyFrames++
            if (root.readyFrames === 3 && !root.preview) {
                root.forceActiveFocus()
                root.captured = root.Window.active
                ambience.play()
            }
        }
    }

    Connections {
        target: root.Window.window

        function onActiveChanged() {
            if (!root.Window.active) {
                root.releaseInput()
                if (root.readyFrames >= 3 && !Level.dead && !root.preview) {
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

        function onPlayerDamaged(source: string) {
            if (source === "drowning" && root.shaking) {
                underwaterHurt.play()
                return
            }
            pulseAnimation.restart()
            if (root.temple) {
                underwaterHurt.play()
            } else {
                hurtSound.play()
            }
            if (source === "trap") {
                spikeHit.play()
            }
            if (source === "boss") {
                trollHit.play()
            }
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
                root.startDying()
                return
            }
            dyingAnimation.stop()
            riseSound.stop()
            root.dyingTime = 0
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
        running: root.readyFrames >= 3 && !Level.dead && !root.paused && !root.preview
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

            camera: Level.dead ? (root.risen ? riseCamera : fallCamera) : (root.deathView ? deathCamera : playerCamera)
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

            Node {
                id: fallFocus

                position: root.bodySpot.plus(root.viewDirection.times(root.crawl)).plus(Qt.vector3d(0, 0.3 + (root.creatureDeath ? 1.1 : 0.75) * root.rise, 0))
            }

            PerspectiveCamera {
                id: fallCamera

                readonly property real drop: Math.min(1, root.dyingTime / 1400)
                readonly property real sink: Math.min(1, root.dyingTime / 3000)

                position: Level.deathCause === "drowned"
                    ? root.fallSpot.plus(Qt.vector3d(0, root.eyeHeight - (root.eyeHeight - 0.35) * fallCamera.sink, 0))
                    : root.fallSpot.plus(Qt.vector3d(0, root.eyeHeight - (root.eyeHeight - 0.25) * fallCamera.drop, 0))
                eulerRotation: Level.deathCause === "drowned"
                    ? Qt.vector3d(fallCamera.sink * 55, root.fallYaw, fallCamera.sink * 12)
                    : Qt.vector3d(-fallCamera.drop * 20, root.fallYaw, fallCamera.drop * 70)
                fieldOfView: 60
                clipNear: 0.05
                clipFar: 200
            }

            PerspectiveCamera {
                id: riseCamera

                readonly property real push: 1 - 0.14 * Math.max(0, Math.min(1, (root.dyingTime - 1500) / 6000))

                position: root.bodySpot.plus(root.viewDirection.times(root.viewDistance * riseCamera.push)).plus(Qt.vector3d(0, root.creatureDeath ? 2 : 1.45, 0))
                lookAtNode: fallFocus
                fieldOfView: 62
                clipNear: 0.05
                clipFar: 200
            }

            Model {
                visible: Level.dead && root.risen
                source: "#Cylinder"
                position: root.bodySpot.plus(root.viewDirection.times(-0.3)).plus(Qt.vector3d(0, 0.012, 0))
                scale: Qt.vector3d(0.012 * Math.min(1, root.ooze * 1.6) + 0.002, 0.0002, 0.01 * Math.min(1, root.ooze * 1.6) + 0.002)
                eulerRotation.y: root.bodyYaw
                castsShadows: false
                materials: PrincipledMaterial {
                    baseColor: root.creatureDeath ? "#1e0507" : "#121a08"
                    roughness: 0.15
                    specularAmount: 0.8
                }
            }

            Node {
                visible: Level.dead && root.risen
                position: root.bodySpot.plus(root.viewDirection.times(root.crawl)).plus(Qt.vector3d(0, -0.16 * (1 - root.ooze), 0))
                eulerRotation.y: root.bodyYaw

                Node {
                    id: reshaping

                    readonly property real t: root.dyingTime
                    readonly property real flat: 0.55 + 0.25 * root.ooze + 0.2 * root.rise

                    y: 0.05 * Math.sin(reshaping.t * 0.012) * root.reshape
                    scale: Qt.vector3d(1 + root.reshape * (0.26 * Math.sin(reshaping.t * 0.011) + 0.1 * Math.sin(reshaping.t * 0.027)),
                                       reshaping.flat * (1 + root.reshape * 0.18 * Math.sin(reshaping.t * 0.017 + 1)),
                                       1 + root.reshape * (0.22 * Math.cos(reshaping.t * 0.013) + 0.1 * Math.sin(reshaping.t * 0.031)))

                    Loader3D {
                        active: root.dungeon && root.readyFrames >= 3
                        visible: !root.creatureDeath
                        sourceComponent: ZombieModel {
                            id: risingZombie

                            enemy: ({ x: 0, y: 0, facing: Math.PI / 2, state: "idle", hurt: false, seen: true })
                            tileSize: root.tileSize
                            poseClip: root.riseClip(risingZombie)
                            poseFrame: root.riseFrame(risingZombie)
                        }
                    }

                    Loader3D {
                        active: root.village && root.readyFrames >= 3
                        visible: root.creatureDeath
                        sourceComponent: NightmareCreatureModel {
                            id: risingCreature

                            enemy: ({ x: 0, y: 0, facing: Math.PI / 2, state: "idle", hurt: false, seen: true })
                            tileSize: root.tileSize
                            poseClip: root.riseClip(risingCreature)
                            poseFrame: root.riseFrame(risingCreature)
                        }
                    }
                }
            }

            Node {
                id: heroBodySpot

                readonly property bool shown: Level.dead && root.risen && root.bodyFade > 0

                opacity: heroBodySpot.shown ? 0.999 * root.bodyFade : 1
                position: root.readyFrames < 3
                    ? Qt.vector3d(Level.playerX * root.tileSize + Math.cos(Level.facing) * 2.5, 0.9, Level.playerY * root.tileSize + Math.sin(Level.facing) * 2.5)
                    : (heroBodySpot.shown ? root.bodySpot.plus(root.viewDirection.times(-1.05)).plus(Qt.vector3d(0, 0.12, 0)) : Qt.vector3d(Level.playerX * root.tileSize, -6, Level.playerY * root.tileSize))
                eulerRotation: Qt.vector3d(-90, root.bodyYaw + 180, 0)

                Loader3D {
                    id: heroBody

                    active: (root.dungeon || root.village)
                    sourceComponent: HeroModel {
                        clip: "breathing_idle"
                        time: 0
                        loop: false
                    }
                }
            }

            Node {
                id: attacker

                readonly property vector3d side: Qt.vector3d(root.viewDirection.z, 0, -root.viewDirection.x)

                visible: Level.dead && root.risen && root.backDistance > 1.2 && Level.deathCause !== "boss"
                position: root.bodySpot.plus(root.viewDirection.times(-root.backDistance)).plus(attacker.side.times(0.45))
                eulerRotation.y: root.bodyYaw

                Loader3D {
                    active: root.dungeon && root.readyFrames >= 3
                    visible: !root.creatureDeath
                    sourceComponent: ZombieModel {
                        enemy: ({ x: 0, y: 0, facing: Math.PI / 2, state: "idle", hurt: false, seen: true })
                        tileSize: root.tileSize
                        phase: 400
                    }
                }

                Loader3D {
                    active: root.village && root.readyFrames >= 3
                    visible: root.creatureDeath
                    sourceComponent: NightmareCreatureModel {
                        enemy: ({ x: 0, y: 0, facing: Math.PI / 2, state: "idle", hurt: false, seen: true })
                        tileSize: root.tileSize
                        phase: 300
                    }
                }
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
                    visible: root.stage >= 3 && (Level.armed || Level.weapon === "potion") && !Level.dead
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
                hole: root.temple && Level.size > 0 ? root.exitHole() : Qt.vector4d(0, 0, 0, 0)
            }

            Loader3D {
                active: root.dungeon
                sourceComponent: DungeonScene {
                    tileSize: root.tileSize
                    stage: root.stage
                    hole: Level.size > 0 ? root.exitHole() : Qt.vector4d(0, 0, 0, 0)
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
                visible: root.stage >= 5 && !root.risen

                Repeater3D {
                    model: Level.traps

                    delegate: SpikeTrapModel {
                        id: trap

                        required property var modelData
                        required property int index

                        position: Qt.vector3d((modelData.x + 0.5) * root.tileSize, 0, (modelData.y + 0.5) * root.tileSize)
                        tileSize: root.tileSize
                        rise: root.trapHeights[index]

                        TrapAudio {
                            rise: trap.rise
                            tileX: trap.modelData.x
                            tileY: trap.modelData.y
                            active: root.readyFrames >= 3 && !Level.dead && !root.preview
                        }
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

                        EnemyAudio {
                            enemy: zombie.enemy
                            kind: "zombie"
                            active: root.readyFrames >= 3 && !Level.dead && !root.preview
                        }
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

                        EnemyAudio {
                            enemy: creature.enemy
                            kind: "creature"
                            active: root.readyFrames >= 3 && !Level.dead && !root.preview
                        }
                        onReadyChanged: {
                            if (creature.ready) {
                                root.loadedEnemies++
                            }
                        }
                    }
                }

            }

            Node {
                visible: root.stage >= 5 && Level.hasBoss && (!root.risen || Level.deathCause === "boss")

                TrollModel {
                    id: troll

                    active: Level.hasBoss
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
                        visible: root.dungeon
                        z: -root.tileSize / 2 - root.nicheDepth + 0.08
                        height: root.wallHeight
                    }

                    LadderModel {
                        visible: root.dungeon
                        y: root.wallHeight - 0.1
                        z: -root.tileSize / 2 - root.nicheDepth + 0.08
                        height: root.wallHeight
                    }

                    Node {
                        visible: root.dungeon

                        PrincipledMaterial {
                            id: shaftBrick

                            roughness: 1
                            baseColorMap: Texture {
                                source: Assets.url + "textures/dungeon/wall_diffuse.jpg"
                                scaleU: 1
                                scaleV: 3
                            }
                            normalMap: Texture {
                                source: Assets.url + "textures/dungeon/wall_normal.jpg"
                                scaleU: 1
                                scaleV: 3
                            }
                        }

                        PrincipledMaterial {
                            id: timber

                            baseColor: "#6b4428"
                            roughness: 0.9
                        }

                        PrincipledMaterial {
                            id: oldTimber

                            baseColor: "#4a3020"
                            roughness: 0.95
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0, root.wallHeight + 3, -root.tileSize / 2 - root.nicheDepth - 0.1)
                            scale: Qt.vector3d(root.tileSize / 100, 0.06, 0.002)
                            materials: shaftBrick
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0, root.wallHeight + 3, -root.tileSize / 2 + root.shaftReach + 0.1)
                            scale: Qt.vector3d(root.tileSize / 100, 0.06, 0.002)
                            materials: shaftBrick
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(-root.tileSize / 2, root.wallHeight + 3, -root.tileSize / 2 + (root.shaftReach - root.nicheDepth) / 2)
                            scale: Qt.vector3d(0.002, 0.06, (root.nicheDepth + root.shaftReach + 0.4) / 100)
                            materials: shaftBrick
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(root.tileSize / 2, root.wallHeight + 3, -root.tileSize / 2 + (root.shaftReach - root.nicheDepth) / 2)
                            scale: Qt.vector3d(0.002, 0.06, (root.nicheDepth + root.shaftReach + 0.4) / 100)
                            materials: shaftBrick
                        }

                        Model {
                            source: "#Rectangle"
                            position: Qt.vector3d(0, root.wallHeight + 5.9, -root.tileSize / 2 + (root.shaftReach - root.nicheDepth) / 2)
                            eulerRotation.x: 90
                            scale: Qt.vector3d(root.tileSize / 100, (root.nicheDepth + root.shaftReach) / 100, 1)
                            castsShadows: false
                            receivesShadows: false
                            materials: PrincipledMaterial {
                                lighting: PrincipledMaterial.NoLighting
                                baseColor: "#020101"
                                cullMode: Material.NoCulling
                            }
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0, root.wallHeight - 0.12, -root.tileSize / 2 + root.shaftReach - 0.1)
                            scale: Qt.vector3d(root.tileSize / 100, 0.0024, 0.0022)
                            materials: timber
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(-0.9, root.wallHeight - 0.12, -root.tileSize / 2 + (root.shaftReach - root.nicheDepth) / 2)
                            scale: Qt.vector3d(0.0018, 0.0022, (root.nicheDepth + root.shaftReach) / 100)
                            materials: oldTimber
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0.9, root.wallHeight - 0.12, -root.tileSize / 2 + (root.shaftReach - root.nicheDepth) / 2)
                            scale: Qt.vector3d(0.0018, 0.0022, (root.nicheDepth + root.shaftReach) / 100)
                            materials: oldTimber
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0.1, root.wallHeight + 1.3, -root.tileSize / 2 - root.nicheDepth + 0.02)
                            eulerRotation.z: 8
                            scale: Qt.vector3d(0.018, 0.0018, 0.0006)
                            materials: oldTimber
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(-0.05, root.wallHeight + 2.6, -root.tileSize / 2 - root.nicheDepth + 0.02)
                            eulerRotation.z: -6
                            scale: Qt.vector3d(0.018, 0.0018, 0.0006)
                            materials: oldTimber
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(-0.55, 0.03, 0.1)
                            eulerRotation.y: 28
                            scale: Qt.vector3d(0.012, 0.0006, 0.0022)
                            materials: oldTimber
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0.35, 0.05, -0.3)
                            eulerRotation: Qt.vector3d(4, -12, 3)
                            scale: Qt.vector3d(0.014, 0.0006, 0.0022)
                            materials: timber
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0.7, 0.02, 0.6)
                            eulerRotation.y: 75
                            scale: Qt.vector3d(0.009, 0.0005, 0.0018)
                            materials: oldTimber
                        }
                    }

                    ParticleSystem3D {
                        visible: root.temple
                        running: root.temple

                        ModelParticle3D {
                            id: shaftBubble

                            maxAmount: 60
                            color: "#b4e6f0"
                            fadeInDuration: 300
                            fadeOutDuration: 500
                            delegate: Model {
                                source: "#Sphere"
                                scale: Qt.vector3d(0.0005, 0.0005, 0.0005)
                                castsShadows: false
                                receivesShadows: false
                                materials: PrincipledMaterial {
                                    lighting: PrincipledMaterial.NoLighting
                                    alphaMode: PrincipledMaterial.Blend
                                    baseColor: "#ffffff"
                                    opacity: 0.6
                                }
                            }
                        }

                        ParticleEmitter3D {
                            particle: shaftBubble
                            position: Qt.vector3d(0, 0.2, -root.tileSize / 2 - root.nicheDepth / 2)
                            shape: ParticleShape3D {
                                type: ParticleShape3D.Cube
                                extents: Qt.vector3d(0.8, 0.05, 0.6)
                            }
                            emitRate: 18
                            lifeSpan: 6500
                            particleScale: 1
                            particleScaleVariation: 0.6
                            velocity: VectorDirection3D {
                                direction: Qt.vector3d(0, 1.1, 0)
                                directionVariation: Qt.vector3d(0.08, 0.2, 0.08)
                            }
                        }
                    }

                    Node {
                        visible: root.temple

                        TempleWallMaterial {
                            id: shaftStone

                            wallTop: 9
                            uvScale: Qt.vector2d(1, 3)
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0, root.wallHeight + 3, -root.tileSize / 2 - root.nicheDepth - 0.1)
                            scale: Qt.vector3d(root.tileSize / 100, 0.06, 0.002)
                            materials: shaftStone
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(0, root.wallHeight + 3, -root.tileSize / 2 + root.shaftReach + 0.1)
                            scale: Qt.vector3d(root.tileSize / 100, 0.06, 0.002)
                            materials: shaftStone
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(-root.tileSize / 2, root.wallHeight + 3, -root.tileSize / 2 + (root.shaftReach - root.nicheDepth) / 2)
                            scale: Qt.vector3d(0.002, 0.06, (root.nicheDepth + root.shaftReach + 0.4) / 100)
                            materials: shaftStone
                        }

                        Model {
                            source: "#Cube"
                            position: Qt.vector3d(root.tileSize / 2, root.wallHeight + 3, -root.tileSize / 2 + (root.shaftReach - root.nicheDepth) / 2)
                            scale: Qt.vector3d(0.002, 0.06, (root.nicheDepth + root.shaftReach + 0.4) / 100)
                            materials: shaftStone
                        }

                        Model {
                            source: "#Rectangle"
                            position: Qt.vector3d(0, root.wallHeight + 5.9, -root.tileSize / 2 + (root.shaftReach - root.nicheDepth) / 2)
                            eulerRotation.x: 90
                            scale: Qt.vector3d(root.tileSize / 100, (root.nicheDepth + root.shaftReach) / 100, 1)
                            castsShadows: false
                            receivesShadows: false
                            materials: PrincipledMaterial {
                                lighting: PrincipledMaterial.NoLighting
                                baseColor: "#010405"
                                cullMode: Material.NoCulling
                            }
                        }
                    }

                    PointLight {
                        position: Qt.vector3d(0, root.wallHeight - 0.4, -root.tileSize / 2)
                        color: root.dungeon ? "#ffb060" : (Level.exitUnlocked ? "#9ff4ff" : "#e09040")
                        brightness: Level.exitUnlocked ? 1 : 0.5
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
            visible: !root.deathView && !Level.dead
            flash: root.pulse
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.13
            text: bossAudio.caption
            color: "#f2f4f6"
            font.pixelSize: 26
            style: Text.Outline
            styleColor: "#000000"
        }

        Minimap {
            anchors.fill: parent
            visible: !root.deathView && !Level.dead
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

    Rectangle {
        anchors.fill: parent
        visible: root.dying
        color: Level.deathCause === "drowned" ? "#000000" : (Level.deathCause === "zombie" || Level.deathCause === "trap" ? "#2e4a1c" : "#3a0c10")
        opacity: Level.deathCause === "drowned" ? Math.min(1, root.dyingTime / root.dyingLength) * 0.9 : 0.2 * Math.min(1, root.dyingTime / 2000)
    }

    Rectangle {
        anchors.fill: parent
        visible: root.dying
        gradient: Gradient {
            GradientStop { position: 0; color: "#ee000000" }
            GradientStop { position: 0.3; color: "#00000000" }
            GradientStop { position: 0.7; color: "#00000000" }
            GradientStop { position: 1; color: "#ee000000" }
        }
        opacity: Math.min(1, root.dyingTime / 2000)
    }

    MouseArea {
        anchors.fill: parent
        visible: root.dying
        onClicked: root.skipDying()
    }

    DeathScreen {
        anchors.fill: parent
        visible: Level.dead && !root.dying
        message: Level.deathMessage
        shade: Level.deathCause === "drowned" ? "#b0021a20" : "#cc1a0505"
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
