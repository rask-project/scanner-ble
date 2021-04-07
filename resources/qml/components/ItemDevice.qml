import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ItemDelegate {
    id: control

    property string address
    property string name
    property bool connected: false

    width: parent.width
    height: 60

    contentItem: RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 15

        Icon {
            icon.name: control.connected ? "bluetooth-connected" : "bluetooth"
            color: control.connected ? "#08f" : "#fff"
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            Label {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: control.address

                font.bold: true
                verticalAlignment: Label.AlignVCenter
            }

            Label {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: control.name

                verticalAlignment: Label.AlignVCenter
                opacity: 0.5
            }
        }
    }
}
