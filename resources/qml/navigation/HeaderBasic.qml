import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ToolBar {
    id: header

    property string title
    property bool titleSmall: false

    height: 48
    background: Item {}

    contentItem: RowLayout {
        anchors.fill: parent

        ToolButton {
            id: button

            visible: stack.depth > 1
            icon.name: "arrow-back"
            onClicked: stack.pop()
        }

        Label {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.rightMargin: button.width

            text: header.title
            font.pixelSize: header.titleSmall ? 12 : 16
            font.bold: true
            font.capitalization: Font.AllUppercase

            elide: Label.ElideRight
            wrapMode: Label.WordWrap

            horizontalAlignment: Label.AlignHCenter
            verticalAlignment: Label.AlignVCenter
        }
    }
}
