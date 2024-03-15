import QtQuick 2.15

Item {
    property int count: 0
    signal notify(string count)
    function reciverInfo(count){
        notifierTextId.text=count
    }
    width: notifierRectId.width
    height: notifierRectId.height
    Rectangle{
        id: notifierRectId
        width: windowId.width*0.25
        height: windowId.width*0.25
        color: "greenyellow"
        Text {
            id: notifierTextId
            text: "0"
            anchors.centerIn: parent
            font.pixelSize: parent.width*0.2
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                count++
                notify(count)
            }
        }
        Component.onCompleted: {
            notify.connect(reciveinfo)
        }
    }
}
