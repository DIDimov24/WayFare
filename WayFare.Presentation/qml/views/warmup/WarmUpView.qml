import QtQuick
import QtQuick.Shapes
import wayfare.presentation

Item {
    id: root

    readonly property var steps: [
        { name: "Underwater Temple", level: 1 },
        { name: "Dungeon", level: 2 },
        { name: "Snowy Village", level: 3 },
        { name: "Intro", level: 0 },
        { name: "Temple Exit", level: 0 },
        { name: "Dungeon Exit", level: 0 },
        { name: "Ending", level: 0 }
    ]
    readonly property var stepComponents: [levelStep, levelStep, levelStep, introStep, templeExitStep, dungeonExitStep, endingStep]
    readonly property var pictures: ["temple-ruins", "dungeon-torch", "village-door", "snowy-woods"]
    readonly property int slideTime: 6500
    property int picture: 0
    property real shownAt: Date.now()
    property int step: 0
    property int shot: 0
    property int frames: 0
    property real part: 0
    property bool loading: false
    property bool done: false
    readonly property real progress: Math.min(1, (root.step + root.part) / root.steps.length)

    Component.onCompleted: root.startStep()

    function startStep() {
        root.loading = false
        root.frames = 0
        root.shot = 0
        root.part = 0
        const level = root.steps[root.step].level
        if (level > 0) {
            Level.preview(level)
        }
        root.loading = true
    }

    function nextStep() {
        root.loading = false
        if (root.step + 1 >= root.steps.length) {
            root.part = 1
            root.done = true
            Sounds.warmUpDone.play()
            finishTimer.start()
            return
        }
        root.step++
        root.startStep()
    }

    function stepLevel() {
        const view = stepLoader.item as LevelView
        if (view.readyFrames < 3) {
            root.part = 0.9 * view.stage / (view.lastStage + 1)
            return
        }
        root.frames++
        root.part = 0.9 + 0.1 * root.frames / 5
        if (root.frames >= 5) {
            root.nextStep()
        }
    }

    function stepCutscene() {
        const scene = stepLoader.item as Cutscene
        if (!scene.prepared) {
            root.part = 0.5 * scene.stage / (scene.lastStage + 1)
            return
        }
        scene.time = scene.shots[root.shot]
        root.frames++
        if (root.frames >= 3) {
            root.frames = 0
            root.shot++
        }
        root.part = 0.5 + 0.5 * root.shot / scene.shots.length
        if (root.shot >= scene.shots.length) {
            root.nextStep()
        }
    }

    Timer {
        interval: 250
        repeat: true
        running: true
        onTriggered: {
            if (Date.now() - root.shownAt < root.slideTime) {
                return
            }
            root.shownAt = Date.now()
            root.picture = (root.picture + 1) % root.pictures.length
        }
    }

    Timer {
        id: finishTimer

        interval: 1800
        onTriggered: Game.finishWarmUp()
    }

    Connections {
        target: root.Window.window
        enabled: root.loading && !root.done

        function onAfterAnimating() {
            if (stepLoader.status !== Loader.Ready) {
                return
            }
            if (root.steps[root.step].level > 0) {
                root.stepLevel()
                return
            }
            root.stepCutscene()
        }
    }

    Component {
        id: levelStep

        LevelView {
            preview: true
        }
    }

    Component {
        id: introStep

        IntroCutscene {
            preview: true
        }
    }

    Component {
        id: templeExitStep

        TempleExitCutscene {
            preview: true
        }
    }

    Component {
        id: dungeonExitStep

        DungeonExitCutscene {
            preview: true
        }
    }

    Component {
        id: endingStep

        EndingCutscene {
            preview: true
        }
    }

    Loader {
        id: stepLoader

        anchors.fill: parent
        active: root.loading
        asynchronous: true
        sourceComponent: root.stepComponents[root.step]
    }

    Rectangle {
        anchors.fill: parent
        color: "#080b12"

        Repeater {
            model: root.pictures

            Image {
                id: slide

                required property string modelData
                required property int index

                anchors.fill: parent
                anchors.bottomMargin: band.height
                source: Assets.url + "ui/warmup/" + slide.modelData + ".jpg"
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                smooth: true
                mipmap: true
                visible: slide.index === root.picture
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.08
            z: 10
            text: "WayFare"
            color: "#e6f4f6"
            font.pixelSize: 56
            font.weight: Font.Light
            font.letterSpacing: 6
            style: Text.Outline
            styleColor: "#80000000"
        }

        MouseArea {
            anchors.fill: parent
        }
    }

    Rectangle {
        id: band

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height * 0.17
        color: "#000000"

        Shape {
            anchors.left: bar.left
            anchors.verticalCenter: heading.verticalCenter
            width: 26
            height: 26
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                strokeColor: "#ffffff"
                strokeWidth: 3
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: 13
                    centerY: 13
                    radiusX: 10
                    radiusY: 10
                    startAngle: 0
                    sweepAngle: 270
                }
            }

            RotationAnimator on rotation {
                from: 0
                to: 360
                duration: 1000
                loops: Animation.Infinite
                running: !root.done
            }
        }

        Image {
            anchors.right: bar.right
            anchors.verticalCenter: heading.verticalCenter
            width: 30
            height: 30
            source: Assets.url + "logo/wayfare-logo.svg"
            sourceSize: Qt.size(60, 60)
            smooth: true
        }

        Text {
            id: heading

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: bar.top
            anchors.bottomMargin: 14
            text: "Preparing the game... " + Math.floor(root.progress * 100) + "%"
            color: "#f2f4f6"
            font.pixelSize: 26
            font.bold: true
        }

        Rectangle {
            id: bar

            anchors.centerIn: parent
            width: parent.width - 96
            height: 6
            radius: 3
            color: "#e6e9ee"

            Rectangle {
                width: parent.width * root.progress
                height: parent.height
                radius: 3
                color: "#1f6f78"

                Behavior on width {
                    NumberAnimation { duration: 250 }
                }
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: bar.bottom
            anchors.topMargin: 14
            text: "Loading: " + root.steps[root.step].name + " (step " + (root.step + 1) + " of " + root.steps.length + ")"
            color: "#c4ccd6"
            font.pixelSize: 20
        }
    }
}
