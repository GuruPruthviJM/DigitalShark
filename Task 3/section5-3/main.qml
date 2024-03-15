import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property var idholder: ""
    Column{
        spacing: parent.width*0.02
        Row{
            spacing: windowId.width*0.02
            Rectangle{
                width: windowId.width*0.2
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                Text {
                    anchors.centerIn: parent
                    text: "Name"
                }
            }
            Rectangle{
                width: windowId.width*0.05
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                Text {
                    anchors.centerIn: parent
                    text: ":"
                }
            }
            Rectangle{
                width: nameTextId.implicitWidth+windowId.width*0.01
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                TextEdit {
                    id: nameTextId
                    anchors.centerIn: parent
                    text: "----------------"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        idholder=nameTextId
                    }
                }
            }
        }
        Row{
            spacing: windowId.width*0.02
            Rectangle{
                width: windowId.width*0.2
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                Text {
                    anchors.centerIn: parent
                    text: "Age"
                }

            }
            Rectangle{
                width: windowId.width*0.05
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                Text {
                    anchors.centerIn: parent
                    text: ":"
                }
            }
            Rectangle{
                width: ageTextId.implicitWidth+windowId.width*0.01
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                Text {
                    id: ageTextId
                    anchors.centerIn: parent
                    text: "----------------"
                }
                MouseArea{
                    onClicked: {
                        idholder=ageTextId
                    }
                }
            }
        }
        Row{
            spacing: windowId.width*0.02
            Rectangle{
                width: windowId.width*0.2
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                Text {
                    anchors.centerIn: parent
                    text: "Email id"
                }
            }
            Rectangle{
                width: windowId.width*0.05
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                Text {
                    anchors.centerIn: parent
                    text: ":"
                }
            }
            Rectangle{
                width: mailTextId.implicitWidth+windowId.width*0.01
                height: windowId.height*0.09
                color: "greenyellow"
                border.width: 2
                Text {
                    id: mailTextId
                    anchors.centerIn: parent
                    text: "----------------"
                }
                MouseArea{
                    onClicked: {
                        idholder=mailTextId
                    }
                }
            }
        }
    }
    Rectangle{
        anchors.centerIn: parent
        width: windowId.width*0.5
        height: windowId.height*0.05
        color: "green"
        border.width: 2
        TextEdit {
            id: editorId
            anchors.centerIn: parent
            text: ""
            focus: true
            onEditingFinished: {
                idholder.text=text
            }
        }
    }

}
