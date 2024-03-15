import QtQuick 2.15

Item {
    id: thankId
    width: windowId.width
    height: windowId.height
    visible: false
    signal final_call()
    signal change_visible()
    function thank(){
        thankId.visible=true
        timerId1.running=true
    }
    function colorLogin(){
        if (windowId.color == "#000000") {
            textID.color="white"
        }else{
            textID.color="black"
        }
    }

    Rectangle {
        id:rect
        anchors.centerIn: parent
        width: parent.width * 0.4
        height: parent.height * 0.2
        color: "#808080"
        radius: parent.width*0.02
        Text {
            id: textID
            anchors.centerIn: parent
            width: parent.width * 0.8
            text: qsTr("Thank you!!\n\nWait a second, we are redirecting you to the login page")
            wrapMode: Text.Wrap
        }
    }
    Timer{
        id: timerId1
        interval: 2000
        running: false
        onTriggered: {
            thankId.visible=false
            timerId1.running=false
            change_visible()
            final_call()
        }
    }
}
