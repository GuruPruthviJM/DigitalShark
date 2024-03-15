import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column{
        anchors.centerIn: parent
        spacing: parent.width*0.02
        Rectangle{
            id:firstnameRectId
            width:firstnameTextid.implicitWidth + parent.width*0.2
            height:firstnameTextid.implicitHeight + parent.height*0.2
            color: "magenta"
            Text {
                id: firstnameTextid
                text: "FirstName: "
                anchors.centerIn: parent
            }
        }
        Rectangle{
            id:firstnameTextRectId
            width:firstnameTextEnterid.implicitWidth + parent.width*0.2
            height:firstnameTextEnterid.implicitHeight+parent.height*0.2
            color: "magenta"
            TextInput {
                id: firstnameTextEnterid
                text: " "
                anchors.centerIn: parent
                focus: true
                onTextChanged: {
                    firstnameTextid.text="FirstName: "+text
                }
            }
        }
    }
}
