import QtQuick 2.2
import QtQuick.Controls 1.1

Canvas {
    id: root

    // blue #008ece
    // light #dedfce
    // black #212029

    property alias running: timer.running
    property point center: Qt.point(width / 2, height / 2)
    property real radius: center.x
    property var colors: ["#B4D137", "#90C24F", "#EA9440", "#3AADD9", "#FF6E01"]
    property var backgrounds: ["#E5E6E8", "#DDDDDD", "#F0F0F0", "#4B4B4B"]
    property var paintNumbers: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    //[1,0,0,0,0,0,0,0,0,0,0,0]

    property color mainColor: colors[3]
    property color secondaryColor: backgrounds[3]
    property var date: new Date()

    property int outerCircleWidth: radius / 22
    property int numbersHeight: Math.max(1, height / 20)

    width: Math.min(parent.width, parent.height) * 0.85
    height: Math.min(parent.width, parent.height) * 0.85

    onDateChanged: requestPaint()

    onPaint: {
        if (radius == undefined || radius <= 0)
            return

        var start_angle = 0
        var end_angle = Math.PI * 2
        var ctx = getContext('2d')

        ctx.reset()
        ctx.clearRect(0, 0, width, height)

        ctx.strokeStyle = darkTheme ? "#ECF0F1" : "#2c3e50"
        ctx.fillStyle = darkTheme ? "#ECF0F1" : "#2c3e50"

        ctx.lineWidth = outerCircleWidth

        ctx.font = numbersHeight +'px sans-serif'


        var nos = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        var angle = 0
        var nowidth = 0

        nos.forEach(function (number) {
            if (root.paintNumbers[number - 1] === 1) {
                angle = Math.PI / 6 * (number - 3);
                nowidth = ctx.measureText(number).width;
                context.fillText(number, root.width / 2 + Math.cos(angle) * (radius * 0.75) -nowidth / 2, root.height / 2 + Math.sin(angle) * (radius * 0.75) + numbersHeight / 3)
            }
        })

        ctx.beginPath()
        ctx.arc(center.x, center.y, root.radius - ctx.lineWidth / 2, start_angle, end_angle)
        ctx.stroke()

        var markLength = (Math.PI * 2) / 12
        var markWidth = ((Math.PI * 2) / 60) / 5

        for (var i = 0; i < 12; ++i) {
            ctx.beginPath()
            ctx.arc(center.x, center.y, radius * 0.90, i * markLength - (markWidth / 2), i * markLength + (markWidth / 2))
            ctx.stroke()
        }

        ctx.strokeStyle = darkTheme ? "#ECF0F1" : "#2c3e50"
        //ctx.strokeStyle = "#7f8c8d"

        markLength = (Math.PI * 2) / 60
        markWidth = ((Math.PI * 2) / 60) / 12

        for (var i = 1; i < 60; ++i) {
            if (i % 5 == 0)
                continue

            ctx.beginPath()
            ctx.arc(center.x, center.y, radius * 0.90, i * markLength - (markWidth / 2), i * markLength + (markWidth / 2))
            ctx.stroke()
        }

        ctx.beginPath()
        ctx.strokeStyle = mainColor

        var degree = ((date.getHours() % 12) * 360) / 12 + ((date.getMinutes() * 360) / 60) * (1/12)
        hoursRotation.angle = degree

        // var angle = (degree - 90) * (Math.PI / 180)
        // var x = center.x + (radius * 0.45) * Math.cos(angle)
        // var y = center.y + (radius * 0.45) * Math.sin(angle)

        // ctx.moveTo(center.x , center.y)
        // ctx.lineTo(x, y)
        // ctx.stroke()

        degree = (date.getMinutes() * 360) / 60
        minutesRotation.angle = degree
//        minutesRotation2.angle = degree

        // angle = (degree - 90) * (Math.PI / 180)
        // x = center.x + (radius * 0.75) * Math.cos(angle)
        // y = center.y + (radius * 0.75) * Math.sin(angle)

        // ctx.moveTo(center.x , center.y)
        // ctx.lineTo(x, y)
        // ctx.stroke()

        degree = (date.getSeconds() * 360) / 60
        secondsRotation.angle = degree

//        secondsRotation2.angle = degree
    }

    //    Rectangle {
    //        id: test
    //        height: 5
    //        width: 5
    //        color: "green"
    //        opacity: 0.7
    //        z: 100
    //    }

    Rectangle {
        id: minutes

        property int yOffset: (parent.radius * 0.75) * 0.10

        height: parent.radius * 0.75 + yOffset
        width: parent.radius / 38
        color: darkTheme ? "#ECF0F1" : "#2c3e50"
        x: center.x - width / 2
        y: center.y - height + yOffset

        antialiasing: true

        transform: Rotation {
            id: minutesRotation

            origin.x: minutes.width / 2
            origin.y: minutes.height - minutes.yOffset

            Behavior on angle { RotationAnimation {  duration: 100; direction: RotationAnimation.Shortest } }
        }
    }

    Rectangle {
        id: hours

        property int yOffset: (parent.radius * 0.75) * 0.10

        height: parent.radius * 0.45 + yOffset
        width: parent.radius / 38
        color: darkTheme ? "#ECF0F1" : "#2c3e50"
        x: center.x - width / 2
        y: center.y - height + yOffset

        antialiasing: true

        transform: Rotation {
            id: hoursRotation

            origin.x: hours.width / 2
            origin.y: hours.height - hours.yOffset

            Behavior on angle { RotationAnimation {  duration: 100; direction: RotationAnimation.Shortest } }
        }
    }

    Rectangle {
        id: seconds

        property int yOffset: (parent.radius * 0.85) * 0.15

        height: parent.radius * 0.85 + yOffset
        width: parent.radius / 38
        color: "#e74c3c"
        x: center.x - width / 2
        y: center.y - height + yOffset

        antialiasing: true

        transform: Rotation {
            id: secondsRotation

            origin.x: seconds.width / 2
            origin.y: seconds.height - seconds.yOffset

            Behavior on angle { RotationAnimation {  duration: 100; direction: RotationAnimation.Shortest } }
        }
    }

//    Image {
//        id: minutesHandle

//        property int yOffset: (parent.radius * 0.85) * 0.15

//        source: darkTheme ? "qrc:/images/minutes_dark" : "qrc:/images/minutes"

//        height: parent.height / 2.25
//        visible: false

//        x: center.x - (width / 2)
//        y: center.y - height + yOffset
//        smooth: true
//        antialiasing: true

//        transform: Rotation {
//            id: minutesRotation2

//            origin.x: minutesHandle.width / 2
//            origin.y: minutesHandle.height - minutesHandle.yOffset

//            Behavior on angle { RotationAnimation {  duration: 100; direction: RotationAnimation.Shortest } }
//        }
//    }

//    Image {
//        id: secondsHandle
//        property int yOffset: (parent.radius * 1) * 0.25

//        source: "qrc:/images/seconds"
//        height: parent.height / 1.8
//        visible: false

//        x: center.x - (width / 2)
//        y: center.y - height + yOffset
//        smooth: true
//        antialiasing: true

//        transform: Rotation {
//            id: secondsRotation2

//            origin.x: secondsHandle.width / 2
//            origin.y: secondsHandle.height - secondsHandle.yOffset

//            Behavior on angle { RotationAnimation {  duration: 100; direction: RotationAnimation.Shortest } }
//        }
//    }

//    MouseArea {
//        anchors.fill: parent

//        onClicked: {
//            secondsHandle.visible = !secondsHandle.visible
//            seconds.visible = !seconds.visible

//            minutesHandle.visible = !minutesHandle.visible
//            minutes.visible = !minutes.visible

////            rows.visible = !rows.visible
////            columns.visible = !columns.visible
//        }
//    }

//    Repeater {
//        id: columns
//        anchors.fill: parent
//        model: 7

//        Rectangle {
//            height: parent.height
//            width: 1
//            x: (index + 1) * (root.width / 8)
//        }
//    }


//    Repeater {
//        id: rows
//        anchors.fill: parent
//        model: 7

//        Rectangle {
//            width: parent.width
//            height: 1
//            y: (index + 1) * (root.width / 8)
//        }
//    }

    //    Rectangle {
    //        id: bar
    //        width: parent.width
    //        height: 5

    //    }

    //    MouseArea {
    //        anchors.fill: parent
    //        drag.target: bar
    //        drag.axis: Drag.YAxis
    //        drag.minimumY: 0
    //        drag.maximumY: root.height
    //    }





    //    Rectangle {
    //        height: 30
    //        width: 9
    //        y: center.y
    //        x: center.x

    //        opacity: 0.4

    //        color: "green"
    //    }

    //        Rectangle {
    //            height: 1
    //            width: parent.width
    //            y: parent.height / 2
    //        }

    //        Rectangle {
    //            height: parent.height
    //            width: 1
    //            x: parent.width / 2
    //        }

    Timer {
        id: timer

        repeat: true
        interval: 1000
        running: true
        onTriggered: date = new Date()
    }

    //    Text {
    //        anchors.centerIn: parent
    //        text: (date.getHours() % 12) + ":" + date.getMinutes() + ":" + date.getSeconds()
    //        color: "green"
    //        font.pointSize: 54
    //    }
}
