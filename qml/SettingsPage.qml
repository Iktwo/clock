import QtQuick 2.2
import QtQuick.Controls 1.1

Item {
    property var date: new Date()

    Rectangle {
        anchors.fill: parent

        color: darkTheme ? "#000000" : "#ECF0F1"
    }

    Image {
        id: lightDark

        anchors {
            left: parent.left; leftMargin: 10
            top: parent.top; topMargin: 10
        }

        height: parent.height / 8
        width: parent.width / 8
        fillMode: Image.PreserveAspectFit
        smooth: true
        antialiasing: true

        source: darkTheme ? "qrc:/images/sun" : "qrc:/images/moon"

        MouseArea {
            anchors.fill: parent

            onClicked: darkTheme = !darkTheme
        }
    }

    ListView {
        id: view

        anchors {
            top: lightDark.bottom
            left: parent.left
            right: parent.right
            bottom: backButton.top
        }

        //        clip: true

        orientation: ListView.Horizontal

        snapMode: ListView.SnapOneItem

        model: ListModel {
            ListElement {
                name: "BCD"
                element: "BinaryClockPage.qml"
            }

            ListElement {
                name: "Analog"
                element: "AnalogClockPage.qml"
            }
        }

        delegate: Loader {
            height: view.height
            width: view.width

            source: element

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    stackView.pop({immediate: true})

                    if (name == "BCD")
                        stackView.replace({item: binaryClock, immediate: true})
                    else if (name == "Analog")
                        stackView.replace({item: analogClock, immediate: true})
                }
            }
        }
    }

    Button {
        id: backButton

        anchors {
            left: parent.left; leftMargin: 10
            bottom: parent.bottom; bottomMargin: 10
        }

        text: "Back"

        onClicked: stackView.pop()
    }
}
