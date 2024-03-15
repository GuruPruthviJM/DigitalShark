import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: rectId
        width: parent.width*0.5
        height: parent.height*0.25
        color: "greenyellow"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(rectId.x<windowId.width-rectId.width){
                    parent.x+=5
                }
            }
            onDoubleClicked: {
                if(rectId.x<windowId.width-rectId.width){
                    parent.width+=30
                    parent.height+=30
                }
            }
            onPressed: {
                timerId.running=true
            }
            onReleased: {
                timerId.running=false
                rectId.color="greenyellow"
            }
        }
    }
    Timer{
        id:timerId
        interval: 500
        running: false
        onTriggered: {
            rectId.color="blue"
        }

    }
}
