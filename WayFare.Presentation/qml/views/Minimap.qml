pragma ComponentBehavior: Bound

import QtQuick
import wayfare.presentation

Item {
    id: root

    property bool large: false
    readonly property real side: root.large ? Math.min(root.width * 0.7, root.height - 240) : 280
    readonly property int bandWidth: root.large ? 6 : 4
    readonly property int spriteSize: root.large ? 36 : 18
    readonly property real wallSize: map.width / Math.max(Level.size * 2 - 1, 1)
    readonly property real roomSize: root.wallSize * 3
    readonly property int pixelSize: Math.max(2, Math.round(root.wallSize / 3))

    readonly property color goldColor: "#e2b866"
    readonly property color textColor: "#efe4cc"

    function floorColor(): string {
        switch (Level.theme) {
            case "dungeon":
                return "#16130f"
            case "village":
                return "#cdd6df"
        }
        return "#1c2321"
    }

    function wallShades(): list<string> {
        switch (Level.theme) {
            case "dungeon":
                return ["#76706a", "#6c665f", "#6c665f", "#827c75", "#5d5752"]
            case "village":
                return ["#6f6253", "#665a4c", "#665a4c", "#7b6d5d", "#574c40"]
        }
        return ["#b09566", "#a68b5c", "#a68b5c", "#bea473", "#927d50"]
    }

    function tileStart(index: int): real {
        return Math.ceil(index / 2) * root.wallSize + Math.floor(index / 2) * root.roomSize
    }

    function tileSize(index: int): real {
        return index % 2 === 0 ? root.wallSize : root.roomSize
    }

    function mapPosition(value: real): real {
        const index = Math.floor(value)
        return root.tileStart(index) + (value - index) * root.tileSize(index)
    }

    function levelName(): string {
        switch (Level.theme) {
            case "dungeon":
                return "Dungeon"
            case "village":
                return "Snowy Village"
        }
        return "Underwater Temple"
    }

    function iconPath(name: string): url {
        return Assets.url + "icons/" + name + ".png"
    }

    function markerName(type: string): string {
        switch (type) {
            case "diving_gear":
                return "Diving gear"
            case "sword":
                return "Sword"
            case "pistol":
                return "Pistol"
        }
        return "Potion"
    }

    function legendTypes(): list<string> {
        const types = []
        const pickups = Level.pickups
        for (let i = 0; i < pickups.length; i++) {
            if (types.indexOf(pickups[i].type) < 0) {
                types.push(pickups[i].type)
            }
        }
        return types
    }

    Rectangle {
        anchors.fill: parent
        color: "#b3000000"
        opacity: root.large ? 1 : 0
        visible: opacity > 0

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }
    }

    Text {
        anchors.bottom: frame.top
        anchors.bottomMargin: 18
        anchors.horizontalCenter: frame.horizontalCenter
        visible: root.large
        text: root.levelName().toUpperCase()
        color: root.goldColor
        font.pixelSize: 20
        font.bold: true
        font.letterSpacing: 4
        style: Text.Outline
        styleColor: "#000000"
    }

    Rectangle {
        id: frame
        x: Math.round(root.large ? (root.width - root.side) / 2 : root.width - root.side - 24)
        y: Math.round(root.large ? (root.height - root.side) / 2 : 24)
        width: Math.round(root.side)
        height: Math.round(root.side)
        color: "#140c05"

        Rectangle {
            anchors.fill: parent
            anchors.margins: 1

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#d4a453" }
                GradientStop { position: 0.5; color: "#a87a35" }
                GradientStop { position: 1.0; color: "#7a5422" }
            }
        }

        Rectangle {
            anchors.fill: parent
            anchors.margins: 1 + root.bandWidth
            color: "#2a1a0a"
        }

        Rectangle {
            anchors.fill: parent
            anchors.margins: 2 + root.bandWidth
            color: "#040507"
            clip: true

            Item {
                id: map
                anchors.fill: parent

                Canvas {
                    id: mazeCanvas
                    anchors.fill: parent

                    onWidthChanged: mazeCanvas.requestPaint()

                    onPaint: {
                        const context = mazeCanvas.getContext("2d")
                        context.reset()
                        const end = Math.round(root.tileStart(Level.size))
                        context.fillStyle = root.floorColor()
                        context.fillRect(0, 0, end, end)
                        const shades = root.wallShades()
                        const pixel = root.pixelSize
                        const walls = Level.walls
                        for (let i = 0; i < walls.length; i++) {
                            const left = Math.round(root.tileStart(walls[i].x))
                            const top = Math.round(root.tileStart(walls[i].y))
                            const right = Math.round(root.tileStart(walls[i].x + 1))
                            const bottom = Math.round(root.tileStart(walls[i].y + 1))
                            for (let blockY = Math.floor(top / pixel); blockY * pixel < bottom; blockY++) {
                                for (let blockX = Math.floor(left / pixel); blockX * pixel < right; blockX++) {
                                    const x0 = Math.max(blockX * pixel, left)
                                    const y0 = Math.max(blockY * pixel, top)
                                    const x1 = Math.min(blockX * pixel + pixel, right)
                                    const y1 = Math.min(blockY * pixel + pixel, bottom)
                                    const noise = (((blockX * 73856093) ^ (blockY * 19349663)) >>> 0) % shades.length
                                    context.fillStyle = shades[noise]
                                    context.fillRect(x0, y0, x1 - x0, y1 - y0)
                                }
                            }
                        }
                    }

                    Connections {
                        target: Level

                        function onMazeChanged() {
                            mazeCanvas.requestPaint()
                        }
                    }
                }

                Image {
                    x: Math.round(root.mapPosition(Level.exitX + 0.5) - width / 2)
                    y: Math.round(root.mapPosition(Level.exitY + 0.5) - height / 2)
                    width: root.spriteSize
                    height: root.spriteSize
                    smooth: false
                    source: root.iconPath("exit")
                }

                Repeater {
                    model: Level.pickups

                    Image {
                        required property var modelData

                        x: Math.round(root.mapPosition(modelData.x + 0.5) - width / 2)
                        y: Math.round(root.mapPosition(modelData.y + 0.5) - height / 2)
                        width: root.spriteSize
                        height: root.spriteSize
                        smooth: false
                        source: root.iconPath(modelData.type)
                    }
                }

                Rectangle {
                    x: Math.round(root.mapPosition(Level.playerX) - width / 2)
                    y: Math.round(root.mapPosition(Level.playerY) - height / 2)
                    width: root.large ? 16 : 10
                    height: width
                    radius: width / 2
                    color: "#ffffff"
                    border.color: "#000000"
                    border.width: 2
                }
            }
        }

        Repeater {
            model: 4

            Rectangle {
                id: corner

                required property int index

                readonly property int size: root.large ? 18 : 12

                x: corner.index % 2 === 0 ? -corner.size / 3 : frame.width - corner.size * 2 / 3
                y: corner.index < 2 ? -corner.size / 3 : frame.height - corner.size * 2 / 3
                width: corner.size
                height: corner.size
                color: "#140c05"

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: corner.size / 6
                    color: "#d4a453"

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: corner.size / 6
                        color: "#7a5422"

                        Rectangle {
                            anchors.centerIn: parent
                            width: corner.size / 6
                            height: corner.size / 6
                            color: "#f3d48e"
                        }
                    }
                }
            }
        }
    }

    Row {
        anchors.top: frame.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: frame.horizontalCenter
        spacing: 26
        visible: root.large

        Row {
            spacing: 8

            Image {
                anchors.verticalCenter: parent.verticalCenter
                width: 36
                height: 36
                smooth: false
                source: root.iconPath("exit")
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "Exit"
                color: root.textColor
                font.pixelSize: 16
                font.bold: true
                style: Text.Outline
                styleColor: "#000000"
            }
        }

        Repeater {
            model: root.legendTypes()

            Row {
                id: legendEntry

                required property string modelData

                spacing: 8

                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    width: 36
                    height: 36
                    smooth: false
                    source: root.iconPath(legendEntry.modelData)
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: root.markerName(legendEntry.modelData)
                    color: root.textColor
                    font.pixelSize: 16
                    font.bold: true
                    style: Text.Outline
                    styleColor: "#000000"
                }
            }
        }
    }
}
