import QtQuick
import QtQuick.Window
import QtQuick.Controls

ApplicationWindow {
    id: root 
    minimumWidth: 580
    maximumWidth: 580
    minimumHeight: 500
    maximumHeight: 500
    visible: true
    title: qsTr("Color Generator | By Joel Dangmei")

    QtObject {
        id: internal
        function generateRandomColor() {
            for (let i = 0; i < 6; i++) {
                hexGenerated = "#" + Math.random().toString(16).substr(3, 6);
            };
        }
    }

    Component.onCompleted: {
        internal.generateRandomColor()
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
    }

    property string hexGenerated: ""
    Rectangle {
        width: root.width - 20
        height: root.height - 20
        color: hexGenerated
        anchors.centerIn: parent
        radius: 10

        Rectangle {
            width: parent.width - 320
            height: parent.height -320
            color: "#262626"
            anchors.centerIn: parent
            Text {
                id: hexValue
                text: hexGenerated
                color: "#f0f0f0"
                font {
                    family: "Roboto"
                    pixelSize: 14
                }
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                    topMargin: parent.height - 136
                }
            }



            RoundButton {
                text: qsTr("Generate Color")
                width: parent.width - 60
                height: parent.height - 90
                radius: 10
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                    topMargin: parent.height - 98
                }
                font {
                    family: "Roboto"
                    pixelSize: 14
                    letterSpacing: 1.4
                }
                onClicked: internal.generateRandomColor()
            }
        }
    }
}