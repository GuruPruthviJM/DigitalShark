import QtQuick 2.15
import QtQuick.Window 2.15
// use item to place the rectamgle
// on clicking the item the box should move
// should not go out of the window
Window {
    id: a
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Item{
        id: rectitem
        width: a.width*0.8
        height: a.height*0.5
        Mbutton{
            id:b1
            x:0
            width: rectitem.width
            height: rectitem.height
        }

        Mbutton{
            bname: "button1"
            width: rectitem.width * 0.25
            height: rectitem.height * 0.25
            x:b1.x

        }
        Mbutton{
            bname: "button2"
            width: rectitem.width * 0.25
            height: rectitem.height * 0.25
            x: b1.x+rectitem.width*0.3
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(b1.x+b1.width<a.width*1.175){
                    b1.x+=10
                }
            }
        }
    }
}
