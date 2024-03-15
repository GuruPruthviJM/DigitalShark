import QtQuick 2.15

Item {
    id: confirmId
    width: windowId.width
    height: windowId.height
    visible: false
    signal saving()
    signal closing()
    function confirmed(){
        confirmId.visible=true
    }


    Rectangle{
        anchors.centerIn: parent
        width: parent.width*0.4
        height: parent.height*0.2
        // color: /*"#808080"*/
        radius: parent.width*0.02
        Rectangle{
            width: parent.width
            height: parent.height*0.5
            anchors.top: parent.top
            color: "#808080"
            Text {
                anchors.centerIn: parent
                text: qsTr("Do you want to save?")
            }
        }
        Rectangle{
            width: parent.width
            height: parent.height*0.5
            anchors.bottom: parent.bottom
            color: "#808080"
            Rectangle{
                width: parent.width*0.4
                height: parent.height*0.9
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.02
                border.width: parent.width*0.002
                Text{
                    anchors.centerIn: parent
                    text: "Yes"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        if(containsMouse)
                            parent.color="green"
                        else
                            parent.color="white"
                    }
                    onClicked: {
                        saving()
                        confirmId.visible=false
                    }
                }
            }
            Rectangle{
                width: parent.width*0.4
                height: parent.height*0.9
                anchors.right: parent.right
                anchors.rightMargin: parent.width*0.02
                border.width: parent.width*0.002
                Text{
                    anchors.centerIn: parent
                    text: "No"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        if(containsMouse)
                            parent.color="red"
                        else
                            parent.color="white"
                    }
                    onClicked: {
                        closing()
                        confirmId.visible=false
                    }
                }
            }
        }
    }
}
