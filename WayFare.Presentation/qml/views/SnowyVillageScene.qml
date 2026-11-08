import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D
import wayfare.presentation

Node {
    id: root

    property real tileSize: 2
    property real wallHeight: 3
    property int stage: 0
    readonly property real capHeight: 0.2
    readonly property real capOverhang: 0.08
    readonly property real roofRise: 1.25
    readonly property real gableRise: 1.15
    readonly property var torches: root.decorOf("torch")
    readonly property real doorHeight: 3.6
    readonly property real gateHeight: 4.4
    readonly property real gateWidth: root.tileSize * 3
    readonly property bool gateUnlocked: Level.hasBoss && Level.boss.state === "dead" && !Level.bossCutscene
    property real gateOpen: root.gateUnlocked ? 1 : 0

    Behavior on gateOpen {
        NumberAnimation { duration: 1800; easing.type: Easing.InOutQuad }
    }

    function decorOf(kind: string): var {
        const decor = Level.decor
        const list = []
        for (let i = 0; i < decor.length; i++) {
            if (decor[i].kind === kind) {
                list.push(decor[i])
            }
        }
        return list
    }

    function boxScale(sizeX: real, sizeY: real, sizeZ: real): vector3d {
        return Qt.vector3d(sizeX / 100, sizeY / 100, sizeZ / 100)
    }

    function buildCaps() {
        const walls = Level.walls
        const caps = []
        const side = root.tileSize + root.capOverhang * 2
        for (let i = 0; i < walls.length; i++) {
            caps.push(entry.createObject(capList, {
                position: Qt.vector3d((walls[i].x + 0.5) * root.tileSize, root.wallHeight + root.capHeight / 2, (walls[i].y + 0.5) * root.tileSize),
                scale: root.boxScale(side, root.capHeight, side)
            }))
        }
        capList.instances = caps
    }

    function addCabin(cabin: var, roofs: var, gables: var) {
        const yaw = cabin.yaw * Math.PI / 180
        const acrossX = Math.sin(yaw)
        const acrossZ = Math.cos(yaw)
        const alongX = Math.cos(yaw)
        const alongZ = -Math.sin(yaw)
        const x = cabin.x * root.tileSize
        const z = cabin.y * root.tileSize
        const length = cabin.scale * root.tileSize
        const slope = root.roofRise * Math.SQRT2
        const offset = root.roofRise / 2
        const gableSide = root.gableRise * Math.SQRT2

        for (let side = -1; side <= 1; side += 2) {
            roofs.push(entry.createObject(roofList, {
                position: Qt.vector3d(x + acrossX * offset * side, root.wallHeight + offset, z + acrossZ * offset * side),
                eulerRotation: Qt.vector3d(45 * side, cabin.yaw, 0),
                scale: root.boxScale(length + 0.4, 0.14, slope)
            }))
        }
        gables.push(entry.createObject(gableList, {
            position: Qt.vector3d(x, root.wallHeight, z),
            eulerRotation: Qt.vector3d(45, cabin.yaw, 0),
            scale: root.boxScale(length - 0.1, gableSide, gableSide)
        }))
        gables.push(entry.createObject(gableList, {
            position: Qt.vector3d(x + alongX * length * 0.25 + acrossX * 0.4, root.wallHeight + 1.1, z + alongZ * length * 0.25 + acrossZ * 0.4),
            eulerRotation: Qt.vector3d(0, cabin.yaw, 0),
            scale: root.boxScale(0.5, 1.3, 0.5)
        }))
    }

    function buildDecor() {
        const decor = Level.decor
        const roofs = []
        const gables = []
        const frames = []
        const panes = []
        const doors = []
        const tallPines = []
        const pines = []
        const rocks = []
        const grass = []
        const stumps = []
        const logs = []

        for (let i = 0; i < decor.length; i++) {
            const item = decor[i]
            const position = Qt.vector3d(item.x * root.tileSize, 0, item.y * root.tileSize)
            const rotation = Qt.vector3d(0, item.yaw, 0)
            const size = Qt.vector3d(item.scale, item.scale, item.scale)
            switch (item.kind) {
                case "cabin":
                    root.addCabin(item, roofs, gables)
                    break
                case "window":
                    position.y = 1.7
                    frames.push(entry.createObject(frameList, {
                        position: position,
                        eulerRotation: rotation,
                        scale: root.boxScale(0.95, 0.95, 0.06)
                    }))
                    panes.push(entry.createObject(paneList, {
                        position: position,
                        eulerRotation: rotation,
                        scale: root.boxScale(0.75, 0.75, 0.09),
                        color: item.phase > 0.5 ? "#ffb45c" : "#141a24"
                    }))
                    break
                case "door":
                    position.y = 1.15
                    frames.push(entry.createObject(frameList, {
                        position: position,
                        eulerRotation: rotation,
                        scale: root.boxScale(1.35, 2.3, 0.06)
                    }))
                    doors.push(entry.createObject(doorList, {
                        position: position,
                        eulerRotation: rotation,
                        scale: root.boxScale(1.1, 2.1, 0.08)
                    }))
                    break
                case "pine":
                    if (item.phase > 0.5) {
                        tallPines.push(entry.createObject(tallPineList, { position: position, eulerRotation: rotation, scale: size }))
                    } else {
                        pines.push(entry.createObject(pineList, { position: position, eulerRotation: rotation, scale: size }))
                    }
                    break
                case "rock":
                    rocks.push(entry.createObject(rockList, { position: position, eulerRotation: rotation, scale: size }))
                    break
                case "grass":
                    grass.push(entry.createObject(grassList, { position: position, eulerRotation: rotation, scale: size }))
                    break
                case "stump":
                    stumps.push(entry.createObject(stumpList, { position: position, eulerRotation: rotation, scale: size }))
                    break
                case "logs":
                    logs.push(entry.createObject(logList, { position: position, eulerRotation: rotation, scale: size }))
                    break
            }
        }

        roofList.instances = roofs
        gableList.instances = gables
        frameList.instances = frames
        paneList.instances = panes
        doorList.instances = doors
        tallPineList.instances = tallPines
        pineList.instances = pines
        rockList.instances = rocks
        grassList.instances = grass
        stumpList.instances = stumps
        logList.instances = logs
    }

    component GateLeaf: Node {
        id: leaf

        property real side: 1
        property real width: 2.7
        property real height: 3.6
        property Material wood
        property Material trim
        readonly property real brace: Math.sqrt(leaf.width * leaf.width + leaf.height * leaf.height * 0.25)

        Model {
            source: "#Cube"
            position: Qt.vector3d(leaf.side * leaf.width / 2, leaf.height / 2, 0)
            scale: Qt.vector3d(leaf.width / 100, leaf.height / 100, 0.0014)
            materials: leaf.wood
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(leaf.side * leaf.width / 2, leaf.height * 0.25, -0.09)
            scale: Qt.vector3d((leaf.width - 0.1) / 100, 0.0016, 0.0005)
            materials: leaf.trim
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(leaf.side * leaf.width / 2, leaf.height * 0.75, -0.09)
            scale: Qt.vector3d((leaf.width - 0.1) / 100, 0.0016, 0.0005)
            materials: leaf.trim
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(leaf.side * leaf.width / 2, leaf.height / 2, -0.09)
            eulerRotation.z: leaf.side * Math.atan2(leaf.height * 0.5, leaf.width) * 180 / Math.PI
            scale: Qt.vector3d((leaf.brace - 0.15) / 100, 0.0014, 0.0005)
            materials: leaf.trim
        }
    }

    component OutsideCabin: Node {
        id: cabin

        property real width: 5
        property real depth: 4
        property real height: 2.8
        property Material wood
        property Material trim
        property Material snow
        property Material pane
        readonly property real slope: (cabin.width / 2 + 0.35) * Math.SQRT2

        Model {
            source: "#Cube"
            y: cabin.height / 2
            scale: Qt.vector3d(cabin.width / 100, cabin.height / 100, cabin.depth / 100)
            materials: cabin.wood
        }

        Model {
            source: "#Cube"
            y: cabin.height
            eulerRotation.z: 45
            scale: Qt.vector3d(cabin.width / Math.SQRT2 / 100, cabin.width / Math.SQRT2 / 100, cabin.depth / 100)
            materials: cabin.trim
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(-(cabin.width / 2 + 0.35) / 2, cabin.height + (cabin.width / 2 + 0.35) / 2, 0)
            eulerRotation.z: 45
            scale: Qt.vector3d(cabin.slope / 100, 0.0018, (cabin.depth + 0.6) / 100)
            materials: cabin.snow
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d((cabin.width / 2 + 0.35) / 2, cabin.height + (cabin.width / 2 + 0.35) / 2, 0)
            eulerRotation.z: -45
            scale: Qt.vector3d(cabin.slope / 100, 0.0018, (cabin.depth + 0.6) / 100)
            materials: cabin.snow
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(cabin.width * 0.25, cabin.height + 1.1, -cabin.depth * 0.2)
            scale: Qt.vector3d(0.005, 0.014, 0.005)
            materials: cabin.trim
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(-cabin.width * 0.22, 1.05, cabin.depth / 2)
            scale: Qt.vector3d(0.0095, 0.021, 0.001)
            materials: cabin.trim
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(cabin.width * 0.22, 1.6, cabin.depth / 2)
            scale: Qt.vector3d(0.0095, 0.0085, 0.0008)
            materials: cabin.trim
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(cabin.width * 0.22, 1.6, cabin.depth / 2)
            scale: Qt.vector3d(0.0075, 0.0065, 0.0012)
            materials: cabin.pane
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(cabin.width / 2, 1.6, 0)
            eulerRotation.y: 90
            scale: Qt.vector3d(0.0075, 0.0065, 0.0012)
            materials: cabin.pane
        }
    }

    Component.onCompleted: {
        root.buildCaps()
        root.buildDecor()
    }

    Component {
        id: entry

        InstanceListEntry {}
    }

    PrincipledMaterial {
        id: snowMaterial

        baseColor: "#dfe6f0"
        roughness: 0.9
    }

    PrincipledMaterial {
        id: darkWood

        baseColor: "#1d1712"
        roughness: 1
    }

    PrincipledMaterial {
        id: warmPane

        lighting: PrincipledMaterial.NoLighting
        baseColor: "#ffb45c"
    }

    PrincipledMaterial {
        id: doorWood

        baseColor: "#5a4432"
        roughness: 1
    }

    Model {
        visible: root.stage >= 2
        source: "#Rectangle"
        position: Qt.vector3d(Level.size * root.tileSize / 2, -0.02, Level.size * root.tileSize / 2)
        eulerRotation.x: -90
        scale: Qt.vector3d((Level.size + 30) * root.tileSize / 100, (Level.size + 30) * root.tileSize / 100, 1)
        materials: PrincipledMaterial {
            baseColorMap: Texture {
                source: Assets.url + "textures/village/floor_diffuse.jpg"
                scaleU: Level.size + 30
                scaleV: Level.size + 30
            }
            normalMap: Texture {
                source: Assets.url + "textures/village/floor_normal.jpg"
                scaleU: Level.size + 30
                scaleV: Level.size + 30
            }
            roughnessMap: Texture {
                source: Assets.url + "textures/village/floor_roughness.jpg"
                scaleU: Level.size + 30
                scaleV: Level.size + 30
            }
            roughnessChannel: Material.R
            specularAmount: 0
        }
    }

    Node {
        visible: root.stage >= 2 && Level.hasBoss
        position: Qt.vector3d((Level.exitX + 0.5) * root.tileSize, 0, Level.exitY * root.tileSize)

        Model {
            source: "#Cube"
            position: Qt.vector3d(-root.gateWidth / 2, root.gateHeight / 2, root.tileSize / 2)
            scale: root.boxScale(0.6, root.gateHeight, root.tileSize + 0.2)
            materials: darkWood
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(root.gateWidth / 2, root.gateHeight / 2, root.tileSize / 2)
            scale: root.boxScale(0.6, root.gateHeight, root.tileSize + 0.2)
            materials: darkWood
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(0, root.gateHeight - 0.25, root.tileSize / 2)
            scale: root.boxScale(root.gateWidth + 1, 0.5, root.tileSize + 0.3)
            materials: darkWood
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(0, root.gateHeight + 0.1, root.tileSize / 2)
            scale: root.boxScale(root.gateWidth + 1.2, 0.2, root.tileSize + 0.5)
            materials: snowMaterial
        }

        GateLeaf {
            position: Qt.vector3d(-root.gateWidth / 2 + 0.3, 0, 0.1)
            eulerRotation.y: -100 * root.gateOpen
            side: 1
            width: root.gateWidth / 2 - 0.3
            height: root.doorHeight
            wood: doorWood
            trim: darkWood
        }

        GateLeaf {
            position: Qt.vector3d(root.gateWidth / 2 - 0.3, 0, 0.1)
            eulerRotation.y: 100 * root.gateOpen
            side: -1
            width: root.gateWidth / 2 - 0.3
            height: root.doorHeight
            wood: doorWood
            trim: darkWood
        }
    }

    Node {
        visible: root.stage >= 4 && Level.hasBoss
        position: Qt.vector3d((Level.exitX + 0.5) * root.tileSize, 0, Level.size * root.tileSize)

        OutsideCabin {
            position: Qt.vector3d(-11, 0, 10)
            eulerRotation.y: 132
            wood: doorWood
            trim: darkWood
            snow: snowMaterial
            pane: warmPane
        }

        OutsideCabin {
            position: Qt.vector3d(13, 0, 11)
            eulerRotation.y: -130
            width: 4.4
            depth: 3.6
            height: 2.6
            wood: doorWood
            trim: darkWood
            snow: snowMaterial
            pane: warmPane
        }

        LogStackModel {
            position: Qt.vector3d(-7, 0, 12.5)
            eulerRotation.y: 40
        }

        StumpModel {
            position: Qt.vector3d(9, 0, 7.5)
            scale: Qt.vector3d(1.4, 1.4, 1.4)
        }
    }

    Model {
        visible: root.stage >= 2
        source: "#Cube"
        castsShadows: false
        receivesShadows: false
        materials: snowMaterial
        instancing: InstanceList {
            id: capList
        }
    }

    Node {
        visible: root.stage >= 3

        PineModel {
            variant: 0
            scale: Qt.vector3d(1, 1, 1)
            instancing: InstanceList {
                id: tallPineList
            }
        }

        PineModel {
            variant: 3
            scale: Qt.vector3d(1, 1, 1)
            instancing: InstanceList {
                id: pineList
            }
        }
    }

    Node {
        visible: root.stage >= 4

        Model {
            source: "#Cube"
            materials: snowMaterial
            instancing: InstanceList {
                id: roofList
            }
        }

        Model {
            source: "#Cube"
            materials: darkWood
            instancing: InstanceList {
                id: gableList
            }
        }

        Model {
            source: "#Cube"
            materials: darkWood
            instancing: InstanceList {
                id: frameList
            }
        }

        Model {
            source: "#Cube"
            materials: doorWood
            instancing: InstanceList {
                id: doorList
            }
        }

        Model {
            source: "#Cube"
            materials: PrincipledMaterial {
                lighting: PrincipledMaterial.NoLighting
                baseColor: "#ffffff"
            }
            instancing: InstanceList {
                id: paneList
            }
        }

        WallTorches {
            tileSize: root.tileSize
            torches: root.torches
            brightness: 1.5
        }
    }

    Node {
        visible: root.stage >= 5

        RockModel {
            instancing: InstanceList {
                id: rockList
            }
        }

        GrassModel {
            scale: Qt.vector3d(1, 1, 1)
            instancing: InstanceList {
                id: grassList
            }
        }

        StumpModel {
            scale: Qt.vector3d(1, 1, 1)
            instancing: InstanceList {
                id: stumpList
            }
        }

        LogStackModel {
            scale: Qt.vector3d(1, 1, 1)
            instancing: InstanceList {
                id: logList
            }
        }
    }

    ParticleSystem3D {
        visible: root.stage >= 6
        running: root.stage >= 6

        ModelParticle3D {
            id: snowflake

            maxAmount: 1000
            color: "#dfe6f0"
            delegate: Model {
                source: "#Sphere"
                scale: Qt.vector3d(0.0003, 0.0003, 0.0003)
                castsShadows: false
                receivesShadows: false
                materials: PrincipledMaterial {
                    baseColor: "#ffffff"
                    lighting: PrincipledMaterial.NoLighting
                }
            }
        }

        ParticleEmitter3D {
            particle: snowflake
            position: Qt.vector3d(Level.playerX * root.tileSize, 7, Level.playerY * root.tileSize)
            shape: ParticleShape3D {
                type: ParticleShape3D.Cube
                extents: Qt.vector3d(11, 0.1, 11)
            }
            emitRate: 280
            lifeSpan: 3500
            velocity: VectorDirection3D {
                direction: Qt.vector3d(0.4, -2.2, 0)
                directionVariation: Qt.vector3d(0.3, 0.3, 0.3)
            }
        }
    }
}
