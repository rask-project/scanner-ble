import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.impl 2.15

Item {
    id: control

    property alias icon: iconLabel.icon
    property color color: iconLabel.color
    width: 24
    height: width

    IconLabel {
        id: iconLabel

        icon.width: control.width
        icon.height: control.height
        icon.color: control.color
    }
}
