import QtQuick
import QtQuick.Shapes

Rectangle {
    id: root

    property bool loading: true

    color: "#080b12"
    opacity: root.loading ? 1 : 0
    visible: opacity > 0

    Behavior on opacity {
        NumberAnimation { duration: 1500; easing.type: Easing.InOutQuad }
    }

    Shape {
        anchors.centerIn: parent
        width: 48
        height: 48
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            strokeColor: "#d6dde6"
            strokeWidth: 4
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap

            PathAngleArc {
                centerX: 24
                centerY: 24
                radiusX: 20
                radiusY: 20
                startAngle: 0
                sweepAngle: 270
            }
        }

        RotationAnimator on rotation {
            from: 0
            to: 360
            duration: 1000
            loops: Animation.Infinite
            running: root.visible
        }
    }
}
