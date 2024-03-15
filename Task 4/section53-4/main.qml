import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "red"
    Rectangle{
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        Column{
            width: parent.width
            height: parent.height
            x:parent.width*0.4
            y: parent.height*0.2
            spacing: parent.height*0.01
            TextField{
                id:nameId
                placeholderText: "Name"
                width: parent.width*0.2
                height: parent.height*0.1
                // Keys.onPressed: {
                //     if(event.key===Qt.Key_Tab){
                //         ageId.focus=true
                //     }
                // }
            }
            TextField{
                id:ageId
                placeholderText: "age"
                width: parent.width*0.2
                height: parent.height*0.1
                // Keys.onPressed: {
                //     if(event.key===Qt.Key_Tab){
                //         mailId.focus=true
                //     }
                // }
            }
            TextField{
                id:mailId
                placeholderText: "E-mail"
                width: parent.width*0.2
                height: parent.height*0.1
                Keys.onPressed: {
                    if(event.key===Qt.Key_Tab){
                        phoneId.focus=true
                    }
                }
            }
            TextField{
                id:phoneId
                placeholderText: "phone number"
                width: parent.width*0.2
                height: parent.height*0.1
                Keys.onPressed: {
                    if(event.key===Qt.Key_Tab){
                        dateId.focus=true
                    }
                }
            }
            TextField{
                id:dateId
                placeholderText: "date"
                width: parent.width*0.2
                height: parent.height*0.1
                Keys.onPressed: {
                    if(event.key===Qt.Key_Tab){
                        cityId.focus=true
                    }
                }
            }
            TextField{
                id:cityId
                placeholderText: "city"
                width: parent.width*0.2
                height: parent.height*0.1
                Keys.onPressed: {
                    if(event.key===Qt.Key_Tab){
                        nameId.focus=true
                    }
                }
            }
        }
    }
}
