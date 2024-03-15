import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"
    Rectangle{
        id: rectId
        anchors.centerIn: parent
        width: parent.width*0.25
        height: parent.height*0.25
        border.color: "white"
        border.width: 8
        color: "greenyellow"
        focus: true
        Keys.onPressed: {
            if(event.key===Qt.Key_A){
                rectId.color="red"
            }else if(event.key===Qt.Key_B){
                rectId.color="yellow"
            }else if(event.key===Qt.Key_C){
                rectId.color="green"
            }else if(event.key===Qt.Key_D){
                rectId.color="blue"
            }
        }
    }
}
