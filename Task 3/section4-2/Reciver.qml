import QtQuick 2.15

Item {
    function reciverInfo(count){
        reciverTextId.text=count
    }
    signal notify(string count)
    property int count: 0
    width: reciverRectid.width
    height: reciverRectid.height
    Rectangle{
        id: reciverRectid
        width: windowId.width*0.25
        height: windowId.width*0.25
        color: "greenyellow"
        Text {
            id: reciverTextId
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
