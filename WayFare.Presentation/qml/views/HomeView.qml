import QtQuick
import wayfare.presentation

Item {
    HomeViewModel {
        id: viewModel
    }

    Text {
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.pointSize: 42
        text: viewModel.greeting
    }
}
