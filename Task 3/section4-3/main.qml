import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        width: parent.width*0.25
        height: parent.width*0.25
        color: "red"
        Text {
            id: window1
            anchors.centerIn: parent
            text: qsTr("click Me:)")
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                Window{
                    width: 640
                    height: 480
                    visible: true
                    title: qsTr("sub window")
                }
            }
        }
    }
}
