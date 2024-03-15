import QtQuick 2.15
// display the image souce below the images
Item {
    property string col: "white"
    property alias bname: mtext.text
    width: rect.width
    height: rect.height
    Rectangle{
        id: rect
        width: mtext.width + parent.width*0.1
        height: mtext.height + parent.height*0.1
        color: col
        radius: rect.width/2
        border{
            width: 2
            color: "black"
        }

        Text {
            id: mtext
            text: "button"
            anchors.centerIn: parent
            font.pointSize: 20
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("I am a button")
            }
        }
    }
}
