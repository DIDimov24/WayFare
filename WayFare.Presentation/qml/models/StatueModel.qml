import QtQuick
import QtQuick3D
import wayfare.presentation

Model {
    id: root

    property string kind: "mila"
    property real fade: 1
    property real grow: 1
    readonly property string path: root.kind === "mila" ? "models/statue_mila/meshes/cube_001_mesh.mesh" : "models/hero/statues/statue_" + root.kind + ".mesh"
    readonly property bool found: Assets.exists(root.path)

    visible: root.found
    source: root.found ? Assets.url + root.path : ""
    readonly property real size: (root.kind === "mila" ? 0.42 : 0.6) * root.grow

    scale: Qt.vector3d(root.size, root.size, root.size)
    materials: PrincipledMaterial {
        baseColor: "#84878d"
        roughness: 0.95
        opacity: root.fade
        alphaMode: root.fade < 1 ? PrincipledMaterial.Blend : PrincipledMaterial.Opaque
    }
}
