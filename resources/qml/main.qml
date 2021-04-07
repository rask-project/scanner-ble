import QtQuick 2.15
import QtQuick.Controls 2.15

import Rask.Ble 1.0
import "./pages"

ApplicationWindow {
    id: window

    width: 480
    height: 640
    visible: true
    title: qsTr("Scanner BLE")

    StackView {
        id: stack

        width: window.width
        height: window.height

        initialItem: Discovery {}
    }

    BLEController {
        id: bleController
    }

    onClosing: {
        if (stack.depth > 1) {
            close.accepted = false
            stack.pop()
        }
    }
}
