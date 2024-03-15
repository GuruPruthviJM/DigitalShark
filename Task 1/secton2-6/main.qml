import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: a
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property bool isBlack: true
    color: a.isBlack ? "black" : "white"
    Row {
        anchors.centerIn: parent

        Rectangle {
            id: r1
            width: a.width * 0.5
            height: a.height * 0.5
            color: a.isBlack ? "black" : "white"

            Rectangle {
                id: r2
                width: r1.width * 0.5
                height: r1.height * 0.5
                color: a.isBlack ? "white" : "black"
                anchors.centerIn: r1

                Rectangle {
                    id: r3
                    width: r2.width * 0.5
                    height: r2.height * 0.5
                    color: a.isBlack ? "black" : "white"
                    anchors.centerIn: r2

                    Rectangle {
                        id: r4
                        width: r3.width * 0.5
                        height: r3.height * 0.5
                        color: a.isBlack ? "white" : "black"
                        anchors.centerIn: r3

                        Rectangle {
                            id: r5
                            width: r4.width * 0.5
                            height: r4.height * 0.5
                            color: a.isBlack ? "black" : "white"
                            anchors.centerIn: r4
                        }
                    }
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            a.isBlack = !a.isBlack;
        }
    }
}
