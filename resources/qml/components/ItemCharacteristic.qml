import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Rask.Ble 1.0

Item {
    id: control

    property QtObject characteristic
    signal write
    signal notify

    height: content.implicitHeight

    Column {
        id: content

        anchors.fill: parent
        spacing: 5

        Label {
            width: parent.width
            height: 32

            text: control.characteristic.uuid + ( control.characteristic.name ? " (" + control.characteristic.name + ")" : "")
            font.bold: true
            elide: Label.ElideRight
            wrapMode: Label.WrapAnywhere
            verticalAlignment: Label.AlignVCenter
        }

        Row {
            spacing: 15
            anchors.right: parent.right

            ToolButton {
                enabled: characteristic.hasPermission(BLECharacteristic.Read)
                text: "R"
                highlighted: true

                onClicked: control.getReadData()
            }

            ToolButton {
                enabled: characteristic.hasPermission(BLECharacteristic.Write)
                text: "W"
                highlighted: true

                onClicked: control.write()
            }

            ToolButton {
                enabled: characteristic.hasPermission(BLECharacteristic.Notify)
                text: "N"
                highlighted: true

                onClicked: control.notify()
            }
        }

        Label {
            id: labelReadData

            width: parent.width
            text: qsTr("Value: ") + control.characteristic.value
        }
    }

    function getReadData() {
        labelReadData.text = qsTr("Value: ") + control.characteristic.value
    }
}
