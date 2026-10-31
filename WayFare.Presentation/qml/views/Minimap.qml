import QtQuick
import QtQuick.Shapes
import wayfare.presentation

Item {
    id: root

    property bool large: false
    readonly property real side: root.large ? Math.min(root.width, root.height) * 0.8 : 340
    readonly property real cell: map.width / Math.max(Level.size, 1)
    readonly property real markerSize: Math.max(root.cell * 1.4, 16)

    function markerColor(type: string): color {
        switch (type) {
            case "divingGear":
                return "#40c4ff"
            case "sword":
                return "#e0e6ef"
            case "pistol":
                return "#ffa040"
        }
        return "#66d96b"
    }

    function markerName(type: string): string {
        switch (type) {
            case "divingGear":
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
        color: "#99080b12"
        opacity: root.large ? 1 : 0
        visible: opacity > 0

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }
    }

    Rectangle {
        id: frame
        x: root.large ? (root.width - root.side) / 2 : root.width - root.side - 24
        y: root.large ? (root.height - root.side) / 2 : 24
        width: root.side
        height: root.side
        radius: 6
        color: "#f0080b12"
        border.color: "#33ffffff"

        Item {
            id: map
            anchors.fill: parent
            anchors.margins: 8

            Canvas {
                id: wallCanvas
                anchors.fill: parent

                onWidthChanged: wallCanvas.requestPaint()

                onPaint: {
                    const context = wallCanvas.getContext("2d")
                    context.reset()
                    context.fillStyle = "#4a5568"
                    const walls = Level.walls
                    for (let i = 0; i < walls.length; i++) {
                        const left = Math.floor(walls[i].x * root.cell)
                        const top = Math.floor(walls[i].y * root.cell)
                        context.fillRect(left, top, Math.ceil((walls[i].x + 1) * root.cell) - left, Math.ceil((walls[i].y + 1) * root.cell) - top)
                    }
                }

                Connections {
                    target: Level

                    function onMazeChanged() {
                        wallCanvas.requestPaint()
                    }
                }
            }

            Rectangle {
                x: Level.exitX * root.cell
                y: Level.exitY * root.cell
                width: root.cell
                height: root.cell
                color: "#b388ff"
            }

            Repeater {
                model: Level.pickups

                Rectangle {
                    required property var modelData

                    x: (modelData.x + 0.5) * root.cell - width / 2
                    y: (modelData.y + 0.5) * root.cell - height / 2
                    width: root.markerSize
                    height: root.markerSize
                    radius: width / 2
                    color: root.markerColor(modelData.type)
                    border.color: "#080b12"
                    border.width: 2
                }
            }

            Shape {
                x: Level.playerX * root.cell - width / 2
                y: Level.playerY * root.cell - height / 2
                width: root.markerSize
                height: root.markerSize
                rotation: Level.facing * 180 / Math.PI + 90
                preferredRendererType: Shape.CurveRenderer

                ShapePath {
                    fillColor: "#ffeb3b"
                    strokeColor: "#080b12"
                    strokeWidth: 2
                    startX: root.markerSize / 2
                    startY: 0

                    PathLine { x: root.markerSize; y: root.markerSize }
                    PathLine { x: root.markerSize / 2; y: root.markerSize * 0.7 }
                    PathLine { x: 0; y: root.markerSize }
                    PathLine { x: root.markerSize / 2; y: 0 }
                }
            }
        }
    }

    Flow {
        anchors.top: frame.bottom
        anchors.topMargin: 12
        anchors.left: frame.left
        width: frame.width
        spacing: 18
        visible: root.large

        Row {
            spacing: 8

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: 18
                height: 18
                color: "#b388ff"
            }

            Text {
                text: "Exit"
                color: "#ffffff"
                font.pixelSize: 18
            }
        }

        Repeater {
            model: root.legendTypes()

            Row {
                id: legendEntry

                required property string modelData

                spacing: 8

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    width: 18
                    height: 18
                    radius: 9
                    color: root.markerColor(legendEntry.modelData)
                }

                Text {
                    text: root.markerName(legendEntry.modelData)
                    color: "#ffffff"
                    font.pixelSize: 18
                }
            }
        }
    }
}
