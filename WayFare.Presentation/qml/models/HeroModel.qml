import QtQuick
import QtQuick3D
import wayfare.presentation

Node {
    id: root

    property string clip: "breathing_idle"
    readonly property bool ready: !loader.active || loader.status === Loader3D.Ready || loader.status === Loader3D.Error

    onClipChanged: playClip()

    Loader3D {
        id: loader
        active: Assets.exists("models/hero/Hero.qml")
        asynchronous: true
        source: Assets.url + "models/hero/Hero.qml"
        scale: Qt.vector3d(0.6, 0.6, 0.6)
        onLoaded: root.playClip()
    }

    function playClip() {
        if (loader.item === null) {
            return
        }

        const objects = (loader.item as Node).data
        for (let i = 0; i < objects.length; i++) {
            const timeline = objects[i]
            if (timeline.keyframeGroups === undefined) {
                continue
            }

            const playing = timeline.objectName === clip
            timeline.enabled = playing
            for (let j = 0; j < timeline.animations.length; j++) {
                timeline.animations[j].running = playing
            }
        }
    }
}
