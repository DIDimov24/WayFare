pragma ComponentBehavior: Bound

import QtQuick

Item {
    id: root

    property bool running: false
    property real speed: 55
    signal finished()

    clip: true

    onRunningChanged: {
        if (root.running) {
            column.y = root.height
        }
    }

    FrameAnimation {
        running: root.running

        onTriggered: {
            column.y = column.y - Math.min(frameTime, 0.1) * root.speed
            if (column.y + thanks.y + thanks.height / 2 <= root.height / 2) {
                root.running = false
                hold.start()
            }
        }
    }

    Timer {
        id: hold

        interval: 4000
        onTriggered: root.finished()
    }

    ListModel {
        id: sections

        ListElement { heading: "Made by"; names: "Denislav Dimov\nVsevolod Bolotov\nGeorgi Georgiev\nDimitar Rusev" }
        ListElement { heading: "Hero"; names: "Remy and animations from Mixamo (Adobe)" }
        ListElement { heading: "Zombies"; names: "\"Zombie Fantasy Animated\" by Larnox Assets" }
        ListElement { heading: "Nightmare Creatures"; names: "\"Nightmare Creature 1#\" by Idk" }
        ListElement { heading: "Cave Troll"; names: "\"Troll Cave\" by Vasian-Digital3D" }
        ListElement { heading: "Items"; names: "Sword and potion: KayKit by Kay Lousberg\nPistol: Quaternius\nDiving gear: Steren Giannini,\npixelated_stars (mask) and arifduman (fins)" }
        ListElement { heading: "Environment"; names: "Nature Kit, Platformer Kit and 1-Bit Pack by Kenney\nSpike traps, torches and stone statues: KayKit by Kay Lousberg\nSeaweed: Laney XR Labs\nOrange coral: Device Lab\nFan coral: God Appeasers\nCaustics: Calinou\nLake water: zookeeper" }
        ListElement { heading: "Textures and sky"; names: "Poly Haven" }
        ListElement { heading: "Hero voice"; names: "Piper, with a voice trained on the OpenSLR 83 dataset" }
        ListElement { heading: "Audio"; names: "Freesound:\nklankbeeld, Tim_Verberne, thanvannispen, aphom000,\ndyingSatyr, SoundsExciting, cheesepuff, abbahoot,\nsoykevin, tonsil5, kathol, worthahep88,\nthegoose09, punisherman, Perel, simonjeffery13,\nmrickey13, Qvantor, ihitokage, Deathscyp,\ncryanrautha, Yoyamen1212, oscaraudiogeek, facklere,\ncylon8472, jasonLON, Anthousai and DeVern\n\nPixabay:\nmeditativetiger, DRAGON-STUDIO, freesound_community,\nUniversfield and yodguard\n\nOpenGameArt:\nSketchMan3, IgnasD, Thimras, cinameng,\nyd, Indieteur, rubberduck, Emma_MA,\ntrazzz123 and spookymodem\n\nImpact Sounds by Kenney" }
    }

    Column {
        id: column

        width: root.width
        y: root.height
        spacing: 44

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "WayFare"
            color: "#ffffff"
            font.pixelSize: 64
            font.weight: Font.Light
            font.letterSpacing: 2
        }

        Repeater {
            model: sections

            Column {
                id: section

                required property string heading
                required property string names

                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 8

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: section.heading.toUpperCase()
                    color: "#8a96a8"
                    font.pixelSize: 15
                    font.letterSpacing: 2
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: section.names
                    color: "#d6dde6"
                    font.pixelSize: 22
                    horizontalAlignment: Text.AlignHCenter
                    lineHeight: 1.2
                }
            }
        }

        Item {
            width: 1
            height: root.height * 0.3
        }

        Text {
            id: thanks

            anchors.horizontalCenter: parent.horizontalCenter
            text: "Thanks for playing"
            color: "#e6f4f6"
            font.pixelSize: 40
            font.weight: Font.Light
            font.letterSpacing: 2
        }
    }
}
