
import QtQuick 2.15
import QtQuick.Window 2.15
//enable need to do for button not for rectangle
Window {
    id:abcd
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Column{
        id:xyz
        spacing: 20
        anchors.centerIn: parent
        Mrectangle{
            id: r1
           // x:50;y:100
            buttonText: "rect.1"
            onButtonClicked: {
                r5.buttonvisi=!r5.buttonvisi
                r2.buttonvisi=!r2.buttonvisi
                r3.buttonvisi=!r3.buttonvisi
            }

        }
        Mrectangle{
            //x:100;y:100
            id:r2
            buttonText: "rect.2"
            onButtonClicked: {
                r1.buttonvisi=!r1.buttonvisi
                r5.buttonvisi=!r5.buttonvisi
                r3.buttonvisi=!r3.buttonvisi
            }

        }
        Mrectangle{
            //x:150;y:100
            id: r3
            buttonText: "rect.3"
            onButtonClicked: {
                r1.buttonvisi=!r1.buttonvisi
                r2.buttonvisi=!r2.buttonvisi
                r5.buttonvisi=!r5.buttonvisi
            }
        }

        Mrectangle{
            //x:250;y:100
            id: r5
            buttonText: "rect.4"
            onButtonClicked: {
                r1.buttonvisi=!r1.buttonvisi
                r2.buttonvisi=!r2.buttonvisi
                r3.buttonvisi=!r3.buttonvisi
            }
        }

    }
}

