import QtQuick 2.15

Item {
    property int count: 0
    signal notify (string count)

    function reciveinfo( c){
        rectTextId.text=c
    }

    Rectangle{
        id: rectid
        width: windowId.width*0.25
        height: windowId.width*0.25
        color: "red"
        border.width: 2
        Text {
            id: rectTextId
            text: "0"
            anchors.centerIn: parent
            font.pixelSize: parent.width*0.2
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                count++
                notify(count)
                if(count%10==0){
                    console.log("you have clicked: "+count)
                    windowId.color="greenyellow"
                }else{
                    windowId.color="white"
                }
            }
        }
    }
}
