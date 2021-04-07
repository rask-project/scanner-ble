import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ItemDelegate {
    id: control

    property string uuid
    property string name

    width: parent.width
    height: 60

    contentItem: ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 0

        Label {
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: control.uuid

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
