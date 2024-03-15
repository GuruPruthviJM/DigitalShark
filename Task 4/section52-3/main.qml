import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:windowId
    width: 260
    height: 300
    visible: true
    title: qsTr("Hello World")
    maximumHeight: 300
    maximumWidth: 260
    Rectangle{
        width:parent.width*0.25
        height: parent.width*0.25
        radius: (parent.width*0.25)/2
        border.width: 2
        onXChanged: {
            if(x<50){
                windowId.color='red'
            }else if(x>50 && x<150){
                windowId.color='blue'
            }else{
                windowId.color='black'
            }
        }
        MouseArea{
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: windowId.width-parent.width
        }
    }
}
