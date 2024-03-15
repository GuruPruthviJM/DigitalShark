import QtQuick 2.15

import QtQuick.Controls 2.15
Item {
    property string fname: " "
    property string fage: " "
    property string fmail: " "
    property string fgender: " "
    signal backToMain()
    function last(name,age,mail,gender){
        fname=name
        fage=age
        fmail=mail
        fgender=gender
        lastMainColId.visible=true
    }

    Column{
        id: lastMainColId
        visible: false
        width: windowId.width*0.4
        height: windowId.height*0.8
        x:windowId.width*0.3
        y:windowId.height*0.03
        Text {
            anchors.top: windowId.top
            x: lastMainColId.width*0.2
            text: "Thank You!"
            font{
                pixelSize: windowId.width*0.05
                italic: true
                bold: true
                underline: true
            }
        }
        Item {
            id: formRectId
            y: lastMainColId.height*0.1
            width: lastMainColId.width
            height: lastMainColId.height
            Rectangle{
                width: formRectId.width
                height: formRectId.height
                radius: formRectId.width*0.05
                color: "beige"
            }
            Row{
                id: nameRowId
                width: lastMainColId.width
                height: lastMainColId.height*0.2
                Rectangle{
                    id:nameRectId
                    anchors.left: parent.left
                    anchors.leftMargin: lastMainColId.width*0.02
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "burlywood"
                    Text {
                        id: nameId
                        anchors.centerIn: parent
                        text: qsTr("Name: ")
                        font.bold: true
                        font.pixelSize: parent.width*0.1
                    }
                }
                Rectangle{
                    id:nameTextRectId
                    anchors.right: parent.right
                    anchors.rightMargin: lastMainColId.width*0.1
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "darkseagreen"
                    clip: true
                    Text{
                        id:nameTextInputId
                        anchors.centerIn: nameTextRectId
                        text:fname
                        font.pixelSize: parent.width*0.1
                    }
                }
            }
            Row{
                id:ageRowId
                width: lastMainColId.width
                height: lastMainColId.height*0.2
                // anchors.top: nameRowId.bottom
                Rectangle{
                    id:ageRectId
                    anchors.left: parent.left
                    anchors.leftMargin: lastMainColId.width*0.02
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "burlywood"
                    Text {
                        id: ageId
                        anchors.centerIn: parent
                        text: qsTr("Age: ")
                        font.bold: true
                        font.pixelSize: parent.width*0.1
                    }
                }
                Rectangle{
                    id:ageTextRectId
                    anchors.right: parent.right
                    anchors.rightMargin: lastMainColId.width*0.1
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "darkseagreen"
                    clip: true
                    Text{
                        id: ageTextInputId
                        anchors.centerIn: parent
                        font.pixelSize: parent.width*0.1
                        text: fage
                    }
                }
            }
            Row{
                id:mailRowId
                width: lastMainColId.width
                height: lastMainColId.height*0.2
                // anchors.top: ageRowId.bottom
                Rectangle{
                    id:mailRectId
                    anchors.left: parent.left
                    anchors.leftMargin: lastMainColId.width*0.02
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "burlywood"
                    Text {
                        id: mailId
                        anchors.centerIn: parent
                        text: qsTr("E-Mail: ")
                        font.bold: true
                        font.pixelSize: parent.width*0.1
                    }
                }
                Rectangle{
                    id:mailTextRectId
                    anchors.right: parent.right
                    anchors.rightMargin: lastMainColId.width*0.1
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "darkseagreen"
                    clip: true
                    Text{
                        id: mailTextInputId
                        anchors.centerIn: parent
                        wrapMode: TextEdit.Wrap
                        font.pixelSize: parent.width*0.1
                        text: fmail
                    }
                }
            }
            Row{
                id:genderRowId
                width: lastMainColId.width
                height: lastMainColId.height*0.2
                // anchors.top: mailRowId.bottom
                Rectangle{
                    id:genderRectId
                    anchors.left: parent.left
                    anchors.leftMargin: lastMainColId.width*0.02
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "burlywood"
                    Text {
                        id: genderId
                        anchors.centerIn: parent
                        text: qsTr("Gender: ")
                        font.bold: true
                        font.pixelSize: parent.width*0.1
                    }
                }
                Rectangle{
                    id:genderTextRectId
                    anchors.right: parent.right
                    anchors.rightMargin: lastMainColId.width*0.1
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "darkseagreen"
                    clip: true
                    Text {
                        anchors.centerIn: parent
                        text: fgender
                    }

                }
            }
            Row{
                id:backBottonId
                width: lastMainColId.width
                height: lastMainColId.height*0.2
                // anchors.top: genderRowId.bottom
                Rectangle{
                    id:submitRectId
                    anchors.left: parent.left
                    anchors.leftMargin: lastMainColId.width*0.3
                    width: lastMainColId.width*0.4
                    height: lastMainColId.height*0.1
                    y: lastMainColId.height*0.05
                    radius: formRectId.width*0.02
                    color: "burlywood"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Back")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            lastMainColId.visible=false
                            backToMain()
                        }
                    }
                }
            }
        }
    }
}
