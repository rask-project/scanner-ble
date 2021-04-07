import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Rask.Ble 1.0
import "../navigation"
import "../components"

Page {
    id: page

    header: HeaderBasic {
        title: qsTr("Discovery Devices")
    }

    footer: FooterBasic {
        Button {
            enabled: !bleController.discovering

            anchors.centerIn: parent

            text: bleController.discovering ? qsTr("Discovering...") : qsTr("Discover")
            icon.name: "search"
            highlighted: true

            onClicked: bleController.startDiscovering()
        }
    }

    ListView {
        id: listDevicesDiscovered
        anchors.fill: parent
        spacing: 10
        clip: true

        model: bleController.devices
        delegate: ItemDevice {
            address: modelData.address
            name: modelData.name
            connected: modelData.status === BLEDevice.Connected

            onClicked: stack.push("Device.qml", { device: modelData })
        }
    }
}
