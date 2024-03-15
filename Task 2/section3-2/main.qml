import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:a
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: rect
        anchors.centerIn: parent
        width: mtext.implicitWidth+ parent.width*0.1
        height: mtext.implicitHeight + parent.height*0.1
        color: "red"
        border{
            width: 3
            color: "blue"
        }
        Text {
            id: mtext
            text: "increase"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                mtext.font.pixelSize+=1
                rect.width=mtext.implicitWidth + a.width*0.1
                rect.height=mtext.implicitHeight + a.height*0.1
            }
        }
    }
}
