import QtQuick 2.15
import QtQuick.Controls 2.15

import Rask.Ble 1.0
import "../navigation"
import "../components"

Page {
    id: page

    property QtObject device
    onDeviceChanged: {
        if (page.device.status === BLEDevice.Disconnected)
            page.device.connect()
    }

    header: HeaderBasic {
        title: page.getDeviceName()
    }

    footer: FooterBasic {
        Button {
            enabled: page.device.status !== BLEDevice.Connecting
            anchors.centerIn: parent

            text: statusText(page.device.status)

            icon.name: page.device.status === BLEDevice.Connected ? "bluetooth-connected" : "bluetooth"
            highlighted: true

            onClicked: {
                if (page.device.status === BLEDevice.Disconnected)
                    page.device.connect()
                else if (page.device.status === BLEDevice.Connected)
                    page.device.disconnect()
            }
        }
    }

    ListView {
        id: listServices

        anchors.fill: parent
        spacing: 10
        clip: true

        model: page.device.services
        delegate: ItemService {
            width: parent.width
            uuid: modelData.uuid
            name: modelData.name

            onClicked: stack.push("Characteristics.qml", { service: modelData })
        }
    }

    function statusText(status) {
        switch (status) {
        case BLEDevice.Disconnected: return qsTr("Connect")
        case BLEDevice.Connecting: return qsTr("Connecting")
        case BLEDevice.Connected: return qsTr("Disconnect")
        default: return ""
        }
    }

    function getDeviceName() {
        if (page.device.name)
            return page.device.address + " (" + page.device.name + ")"
        return page.device.address
    }
}
