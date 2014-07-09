import QtQuick 2.2
import QtQuick.Controls 1.2

Item {
    id:  root

    property string activeText: qsTr("ON")
    property string inactiveText: qsTr("OFF")
    property alias pixelSize: label.font.pixelSize
    property bool active: false

    signal clicked()

    width: 100
    height: 100

    Label {
        id: label
        anchors.fill: parent
        color: "#dd5800"
        text: root.active ? activeText : inactiveText
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            active = !active
            root.clicked()
        }
    }
}
