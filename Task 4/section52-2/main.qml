import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:windowid
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        height: parent.height*0.5
        width: parent.width
        color: "greenyellow"
        Column{
            spacing: parent.height*0.1
            anchors.fill: parent
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.2
                color: "red"
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        if(containsMouse===true){
                            parent.color="green"
                        }else{
                            parent.color="red"
                        }
                    }
                }
            }
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.2
                color: "blue"
                MouseArea{
                    anchors.fill: parent
                    drag.target: parent
                    drag.axis: Drag.XAxis
                    drag.minimumX: 0
                    drag.maximumX:windowid.width-parent.width

                }
            }
        }
    }
}
