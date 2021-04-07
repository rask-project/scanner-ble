import QtQuick 2.15
import QtQuick.Controls 2.15

import Rask.Ble 1.0
import "../navigation"
import "../components"

Page {
    id: page

    property QtObject service
    onServiceChanged: {
        if (page.service.status === BLEService.DiscoveryRequired)
            return service.details()
    }

    padding: 10

    header: HeaderBasic {
        title: page.getServiceTitle()
        titleSmall: true
    }

    ListView {
        id: listCharacteristics

        anchors.fill: parent
        spacing: 10
        clip: true

        model: page.service.characteristics
        delegate: ItemCharacteristic {
            width: parent.width
            characteristic: modelData

            onWrite: {
                dialogWriteData.currentChar = index
                dialogWriteData.open()
            }

            onNotify: page.service.notify(modelData)
        }
    }

    Dialog {
        id: dialogWriteData

        x: (parent.width / 2) - (width / 2)
        y: 150
        width: 350
        modal: true

        onVisibleChanged: if (visible) fieldData.forceActiveFocus()

        property int currentChar: -1

        title: qsTr("Data to sent")
        standardButtons: Dialog.Ok | Dialog.Cancel

        TextField {
            id: fieldData

            width: parent.width
            placeholderText: qsTr("Data")
        }

        onAccepted: {
            page.service.write(dialogWriteData.currentChar, fieldData.text)
            dialogWriteData.clearDialog()
        }

        onRejected: dialogWriteData.clearDialog()

        function clearDialog() {
            dialogWriteData.currentChar = -1
            fieldData.text = ""
        }
    }

    function getServiceTitle() {
        if (page.service.name)
            return page.service.uuid + " (" + page.service.name + ")"
        return page.service.uuid
    }
}
