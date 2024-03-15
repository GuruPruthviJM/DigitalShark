import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: windowid
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Row{
        anchors.centerIn: parent
        spacing: windowid.width*0.05
        Rectangle{
            id:rect1
            width: windowid.width*0.2
            height: windowid.height*0.2
            enabled: true
            color: "red"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    rect1.border.width=(rect1.border.width===windowid.width*0.001) ? 0: windowid.width*0.001
                    rect2.enabled=!rect2.enabled
                    rect3.enabled=!rect3.enabled
                    rect4.enabled=!rect4.enabled
                    windowid.color=(windowid.color===rect1.color)? "white" : rect1.color
                    console.log("I am rect1")
                }
            }
        }
        Rectangle{
            id:rect2
            width: windowid.width*0.2
            height: windowid.height*0.2
            enabled: true
            color: "orange"
            MouseArea{

                anchors.fill: parent
                onClicked: {
                    rect2.border.width=(rect2.border.width===windowid.width*0.001) ? 0: windowid.width*0.001
                    rect1.enabled=!rect1.enabled
                    rect3.enabled=!rect3.enabled
                    rect4.enabled=!rect4.enabled
                    windowid.color=(windowid.color===rect2.color)? "white" : rect2.color
                    console.log("I am rect2")
                }
            }
        }
        Rectangle{
            id:rect3
            width: windowid.width*0.2
            height: windowid.height*0.2
            enabled: true
            color: "greenyellow"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    rect3.border.width=(rect3.border.width===windowid.width*0.001) ? 0: windowid.width*0.001
                    rect3.border.color="black"
                    rect2.enabled=!rect2.enabled
                    rect1.enabled=!rect1.enabled
                    rect4.enabled=!rect4.enabled
                    windowid.color=(windowid.color===rect3.color)? "white" : rect3.color
                    console.log("I am rect3")
                }
            }
        }
        Rectangle{
            id:rect4
            width: windowid.width*0.2
            height: windowid.height*0.2
            enabled: true
            color: "magenta"
            MouseArea{

                anchors.fill: parent
                onClicked: {
                    rect4.border.width=(rect4.border.width===windowid.width*0.001) ? 0: windowid.width*0.001
                    rect2.enabled=!rect2.enabled
                    rect3.enabled=!rect3.enabled
                    rect1.enabled=!rect1.enabled
                    windowid.color=(windowid.color===rect4.color)? "white" : rect4.color
                    console.log("I am rect4")
                }
            }
        }
    }
}
