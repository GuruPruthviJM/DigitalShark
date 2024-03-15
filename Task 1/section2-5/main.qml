import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Magic Wala")
    color: "greenyellow"
    property string c1: "red"
    property string c2: "greenyellow"
    Row{
        anchors.centerIn: parent
        spacing: 20
        Rectangle{
            id: r1
            width: 150
            height: 150
            color: "orange"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    r1.opacity = 1
                    r2.opacity =0.5
                    r3.opacity = 0.5
                }
            }
        }
        Rectangle{
            id: r2
            width: 150
            height: 150
            color: "white"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    r1.opacity =0.5
                    r2.opacity = 1
                    r3.opacity =0.5
                }
            }
        }
        Rectangle{
            id: r3
            width: 150
            height: 150
            color: "green"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    r1.opacity =0.5
                    r2.opacity =0.5
                    r3.opacity = 1
                }
            }
        }
    }
}
