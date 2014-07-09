import QtQuick 2.2

MouseArea {
    height: dpi * 0.35
    width: height
    enabled: parent.visible
    onClicked: stackView.push(settingsPage)

    Rectangle {
        anchors.fill: parent
        opacity: 0.3
        visible: parent.pressed && parent.containsMouse
    }

    Image {
        anchors {
            top: parent.top; topMargin: parent.height * 0.1
            bottom: parent.bottom; bottomMargin: parent.height * 0.1
            left: parent.left; leftMargin: parent.width * 0.1
            right: parent.right; rightMargin: parent.width * 0.1
        }

        fillMode: Image.PreserveAspectFit
        antialiasing: true
        visible: !display

        source: "qrc:/images/" + getBestIconSize(height) + "settings" + (darkTheme ? "" : "_dark")
    }
}
