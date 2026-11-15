import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property real swing: 0
    property real kick: 0
    property real flash: 0
    property real sip: 0

    visible: Level.armed || Level.weapon === "potion"

    Connections {
        target: Level

        function onWeaponUsed(weapon: string, hit: bool) {
            if (weapon === "sword") {
                swingAnimation.restart()
                return
            }
            fireAnimation.restart()
        }

        function onPotionUsed() {
            sipAnimation.restart()
        }
    }

    SequentialAnimation {
        id: sipAnimation

        NumberAnimation { target: root; property: "sip"; from: 0; to: 1; duration: 220; easing.type: Easing.OutQuad }
        PauseAnimation { duration: 250 }
        NumberAnimation { target: root; property: "sip"; to: 0; duration: 300; easing.type: Easing.InOutQuad }
    }

    SequentialAnimation {
        id: swingAnimation

        NumberAnimation { target: root; property: "swing"; from: 0; to: 1; duration: 130; easing.type: Easing.OutQuad }
        NumberAnimation { target: root; property: "swing"; to: 0; duration: 260; easing.type: Easing.InOutQuad }
    }

    ParallelAnimation {
        id: fireAnimation

        SequentialAnimation {
            NumberAnimation { target: root; property: "kick"; from: 0; to: 1; duration: 40 }
            NumberAnimation { target: root; property: "kick"; to: 0; duration: 220; easing.type: Easing.OutQuad }
        }

        NumberAnimation { target: root; property: "flash"; from: 1; to: 0; duration: 90 }
    }

    ItemModel {
        visible: Level.weapon === "sword"
        item: "sword"
        position: Qt.vector3d(0.44 - root.swing * 0.5, -0.34 + root.swing * 0.08, -0.8 - root.swing * 0.15)
        eulerRotation: Qt.vector3d(-48 - root.swing * 35, 18 + root.swing * 30, -22 + root.swing * 60)
    }

    ItemModel {
        visible: Level.weapon === "pistol"
        item: "pistol"
        position: Qt.vector3d(0.32, -0.38 + root.kick * 0.03, -0.82 + root.kick * 0.05)
        eulerRotation: Qt.vector3d(root.kick * 12, 90, 0)
        scale: Qt.vector3d(0.85, 0.85, 0.85)
    }

    ItemModel {
        visible: Level.weapon === "potion" && Level.potionCount > 0
        item: "potion"
        position: Qt.vector3d(0.36 - root.sip * 0.3, -0.36 + root.sip * 0.22, -0.78 + root.sip * 0.22)
        eulerRotation: Qt.vector3d(root.sip * 70, -20, -8 + root.sip * 20)
        scale: Qt.vector3d(0.55, 0.55, 0.55)
    }

    Model {
        visible: root.flash > 0 && Level.weapon === "pistol"
        source: "#Sphere"
        position: Qt.vector3d(0.29, -0.28, -1.0)
        scale: Qt.vector3d(0.0011 * root.flash, 0.0011 * root.flash, 0.0011 * root.flash)
        castsShadows: false
        receivesShadows: false
        materials: PrincipledMaterial {
            lighting: PrincipledMaterial.NoLighting
            baseColor: "#ffd27a"
        }
    }

    PointLight {
        position: Qt.vector3d(0.3, -0.2, -1.1)
        color: "#ffc070"
        brightness: root.flash * 8
        quadraticFade: 1500
    }
}
