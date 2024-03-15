import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item {
    id:loadingId
    width: windowId.width
    height: windowId.height
    visible: false

    signal thankyou()
    function loading_bar(){
        loadingId.visible=true
        timerId.running=true
    }

    Rectangle{
        anchors.centerIn: parent
        width: parent.width*0.4
        height: parent.height*0.2
        radius: parent.width*0.02
        color: "#808080"
        ProgressBar {
            id: progressBarID
            anchors.centerIn: parent
            width: parent.width*0.8
            value: 0
            from: 0
            to: 1.0

        }
    }
    Timer{
        id: timerId
        interval: 500
        repeat: true
        running: false
        onTriggered: {
            progressBarID.value+=0.1
            if(progressBarID.value>0.9){
                loadingId.visible=false
                timerId.running=false
                thankyou()
            }
        }
    }
}
