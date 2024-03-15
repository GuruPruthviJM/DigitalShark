import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: a
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "greenyellow"
    Row{
        id: row1
        spacing: 20
        anchors.centerIn: parent
        Rectangle{
        Image {
            id: img1
            width: a.width*0.2
            height: a.height*0.2
            opacity: 0.5
            source: "file:///C:/Users/gurup/OneDrive/Pictures/Shiva/god-lord-shiva-wallpaper-preview.jpg"
            Mrect{
                anchors.bottom: parent.bottom
                bname: "+"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        img1.opacity+=0.1
                    }
                }
            }
            Text {
                id: img1Text
                text: qsTr("direct")
                font.pixelSize: img1.width*0.05
            }
            Mrect{
                bname: "-"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                MouseArea{

                    anchors.fill: parent
                    onClicked: {
                        img1.opacity-=0.1
                    }
                }
            }
        }
        }
        Rectangle{
        Image {
            id: img2
            width: a.width*0.2
            height: a.height*0.2
            opacity: 0.5
            source: "data:image/jpeg;base64,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"
            Mrect{
                anchors.bottom: parent.bottom
                bname: "+"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        img2.opacity+=0.1
                    }
                }
            }
            Mrect{
                bname: "-"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                MouseArea{

                    anchors.fill: parent
                    onClicked: {
                        img2.opacity-=0.1
                    }
                }
            }
        }
        }
        Image {
            id: img3
            width: a.width*0.2
            height: a.height*0.2
            opacity: 0.5
            source: "file:download.jpeg"
            Mrect{
                anchors.bottom: parent.bottom
                bname: "+"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        img3.opacity+=0.1
                    }
                }
            }
            Mrect{
                bname: "-"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                MouseArea{

                    anchors.fill: parent
                    onClicked: {
                        img3.opacity-=0.1
                    }
                }
            }
        }
        Image {
            id: img4
            width: a.width*0.2
            height: a.height*0.2
            opacity: 0.5
            source: "images/download1.jpeg"
            Mrect{
                anchors.bottom: parent.bottom
                bname: "+"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        img2.opacity+=0.1
                    }
                }
            }
            Mrect{
                bname: "-"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                MouseArea{

                    anchors.fill: parent
                    onClicked: {
                        img2.opacity-=0.1
                    }
                }
            }
        }
    }
}
