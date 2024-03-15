import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Digital Shark -- Form")

    Column{
        anchors.centerIn: parent
        Text {
            text: "Forms"
            font{
                pixelSize: parent.width*0.5
                italic: true
                bold: true
            }
        }
        Rectangle{

        }
    }
}
