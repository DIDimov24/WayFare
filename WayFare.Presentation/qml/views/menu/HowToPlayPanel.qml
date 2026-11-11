import QtQuick
import wayfare.presentation

Column {
    id: root

    signal backClicked()

    spacing: 4

    Text {
        text: "How to Play"
        color: "#ffffff"
        font.pixelSize: 40
        font.weight: Font.Light
        font.letterSpacing: 1
    }

    Item {
        width: 1
        height: 12
    }

    Text {
        text: "GOAL"
        color: "#8a96a8"
        font.pixelSize: 13
        font.letterSpacing: 2
    }

    Text {
        width: 460
        text: "Find the way out of three mazes, then defeat the boss."
        color: "#d6dde6"
        font.pixelSize: 18
        wrapMode: Text.WordWrap
    }

    Item {
        width: 1
        height: 12
    }

    Text {
        text: "CONTROLS"
        color: "#8a96a8"
        font.pixelSize: 13
        font.letterSpacing: 2
    }

    Item {
        width: 460
        height: 30

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "W"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "A"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "S"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "D"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }
        }

        Text {
            x: 150
            anchors.verticalCenter: parent.verticalCenter
            text: "Move"
            color: "#d6dde6"
            font.pixelSize: 18
        }
    }

    Item {
        width: 460
        height: 30

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Mouse"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }
        }

        Text {
            x: 150
            anchors.verticalCenter: parent.verticalCenter
            text: "Look around"
            color: "#d6dde6"
            font.pixelSize: 18
        }
    }

    Item {
        width: 460
        height: 30

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Left click"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }
        }

        Text {
            x: 150
            anchors.verticalCenter: parent.verticalCenter
            text: "Attack"
            color: "#d6dde6"
            font.pixelSize: 18
        }
    }

    Item {
        width: 460
        height: 30

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "1"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "2"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }
        }

        Text {
            x: 150
            anchors.verticalCenter: parent.verticalCenter
            text: "Sword / Pistol"
            color: "#d6dde6"
            font.pixelSize: 18
        }
    }

    Item {
        width: 460
        height: 30

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Q"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }
        }

        Text {
            x: 150
            anchors.verticalCenter: parent.verticalCenter
            text: "Drink a potion"
            color: "#d6dde6"
            font.pixelSize: 18
        }
    }

    Item {
        width: 460
        height: 30

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "M"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }
        }

        Text {
            x: 150
            anchors.verticalCenter: parent.verticalCenter
            text: "Bigger map"
            color: "#d6dde6"
            font.pixelSize: 18
        }
    }

    Item {
        width: 460
        height: 30

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4

            Text {
                width: Math.max(28, implicitWidth)
                height: 26
                leftPadding: 8
                rightPadding: 8
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Esc"
                color: "#ffffff"
                font.pixelSize: 14

                Rectangle {
                    anchors.fill: parent
                    z: -1
                    radius: 4
                    color: "#1affffff"
                    border.color: "#66ffffff"
                    border.width: 1
                }
            }
        }

        Text {
            x: 150
            anchors.verticalCenter: parent.verticalCenter
            text: "Pause"
            color: "#d6dde6"
            font.pixelSize: 18
        }
    }

    Item {
        width: 1
        height: 12
    }

    Text {
        text: "TIPS"
        color: "#8a96a8"
        font.pixelSize: 13
        font.letterSpacing: 2
    }

    Text {
        width: 460
        text: "Your air runs out in the temple. Find the diving gear.\nThe temple exit opens once you have the sword and the pistol.\nSpikes in the dungeon rise and fall. Wait for them to drop."
        color: "#d6dde6"
        font.pixelSize: 16
        lineHeight: 1.3
        wrapMode: Text.WordWrap
    }

    Item {
        width: 1
        height: 12
    }

    MainMenuButton {
        text: "Back"
        onClicked: root.backClicked()
    }
}
