import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
Item {
    property string name: " "
    property int age: 0
    property string mail: " "
    property string gender: " "
    property bool nameFlag: true
    property bool ageFlag: true
    property bool mailFlag: true
    property bool genderFlag: true
    signal firstSubmit(string name)
    signal lastSubmit(string name,int age,string mail,string gender)
    function reverse(){
        name=""
        age=""
        mail=""
        itemId.opacity=1
        invalidId.visible=false
        genderSelectId.currentIndex=0
        mainColId.visible=true
    }
    function saved(){
        itemId.opacity=1
        mainColId.visible=false
        lastSubmit(name,age,mail,gender)
    }
    Item{
        id: itemId
        width: windowId.width
        height: windowId.height
        Column{
            id: mainColId
            width: windowId.width*0.4
            height: windowId.height*0.8
            x:windowId.width*0.3
            y:windowId.height*0.03
            Text {
                anchors.top: windowId.top
                x: mainColId.width*0.3
                text: "Forms"
                font{
                    pixelSize: windowId.width*0.05
                    italic: true
                    bold: true
                    underline: true
                }
            }
            Item {
                id: formRectId
                y: mainColId.height*0.1
                width: mainColId.width
                height: mainColId.height
                Rectangle{
                    width: formRectId.width
                    height: formRectId.height
                    radius: formRectId.width*0.05
                    color: "beige"
                }
                Row{
                    id: nameRowId
                    width: mainColId.width
                    height: mainColId.height*0.2
                    Rectangle{
                        id:nameRectId
                        anchors.left: parent.left
                        anchors.leftMargin: mainColId.width*0.02
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
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
                        anchors.rightMargin: mainColId.width*0.1
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
                        radius: formRectId.width*0.02
                        color: "darkseagreen"
                        clip: true
                        TextInput{
                            id:nameTextInputId
                            anchors.centerIn: nameTextRectId
                            text:name
                            focus: true
                            wrapMode: TextEdit.Wrap
                            font.pixelSize: parent.width*0.1
                            onTextChanged: {
                                name=nameTextInputId.text
                                if (name.match(/[0-9]/)) {
                                    nameTextInputId.color = "red";
                                    nameFlag=false
                                } else {
                                    nameTextInputId.color = "green";
                                    nameFlag=true
                                }
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                nameTextInputId.forceActiveFocus();
                            }

                        }
                    }
                }
                Row{
                    id:ageRowId
                    width: mainColId.width
                    height: mainColId.height*0.2
                    anchors.top: nameRowId.bottom
                    Rectangle{
                        id:ageRectId
                        anchors.left: parent.left
                        anchors.leftMargin: mainColId.width*0.02
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
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
                        anchors.rightMargin: mainColId.width*0.1
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
                        radius: formRectId.width*0.02
                        color: "darkseagreen"
                        clip: true
                        TextInput{
                            id: ageTextInputId
                            anchors.centerIn: parent
                            wrapMode: TextEdit.Wrap
                            font.pixelSize: parent.width*0.1
                            text: age
                            maximumLength: 3
                            validator: RegularExpressionValidator { regularExpression: /[0-9A-F]+/ }
                            onTextChanged: {
                                age=ageTextInputId.text
                                if(age>0){
                                    ageFlag=true
                                }else{
                                    ageFlag=false
                                }
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                ageTextInputId.forceActiveFocus();
                            }
                        }
                    }
                }
                Row{
                    id:mailRowId
                    width: mainColId.width
                    height: mainColId.height*0.2
                    anchors.top: ageRowId.bottom
                    Rectangle{
                        id:mailRectId
                        anchors.left: parent.left
                        anchors.leftMargin: mainColId.width*0.02
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
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
                        anchors.rightMargin: mainColId.width*0.1
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
                        radius: formRectId.width*0.02
                        color: "darkseagreen"
                        clip: true
                        TextInput{
                            id: mailTextInputId
                            anchors.centerIn: parent
                            wrapMode: TextEdit.Wrap
                            font.pixelSize: parent.width*0.1
                            text: mail
                            validator: RegularExpressionValidator { regularExpression: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/ }
                            onTextChanged: {
                                mail=mailTextInputId.text.trim()
                                mailFlag=mail.match(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                mailTextInputId.forceActiveFocus();
                            }
                        }
                    }
                }
                Row{
                    id:genderRowId
                    width: mainColId.width
                    height: mainColId.height*0.2
                    anchors.top: mailRowId.bottom
                    Rectangle{
                        id:genderRectId
                        anchors.left: parent.left
                        anchors.leftMargin: mainColId.width*0.02
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
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
                        anchors.rightMargin: mainColId.width*0.1
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
                        radius: formRectId.width*0.02
                        color: "darkseagreen"
                        clip: true
                        ComboBox {
                            id: genderSelectId
                            width: parent.width
                            model: ["Select","Male", "Female", "Other"]
                            currentIndex: 0
                            delegate: ItemDelegate {
                                text: modelData
                                width: parent.width
                                contentItem: Text {
                                    text: modelData
                                    color: "black"
                                    font.pixelSize: 16
                                    MouseArea {
                                        id: mouseArea
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onClicked: {
                                            genderSelectId.currentIndex = index;
                                            genderSelectId.popup.close()
                                        }
                                        onEntered: {
                                            parent.font.pixelSize = 17;
                                            parent.font.bold = true;
                                        }

                                        onExited: {
                                            parent.font.pixelSize = 16;
                                            parent.font.bold = false;
                                        }
                                    }
                                }
                                background: Rectangle {
                                    implicitWidth: parent.width
                                    implicitHeight: genderSelectId.implicitHeight
                                    color: {modelData === "Male" ? "red" :modelData === "Female" ? "blue" : modelData === "Other" ? "yellow" : "white"
                                    }
                                }
                            }
                            indicator: Rectangle{
                                width: parent.width*0.2
                                height: parent.height
                                color: "green"
                                anchors.right: parent.right
                                Image {
                                    width: parent.width
                                    height: parent.height
                                    source: "file:///D:/Digital Shark/Mini Project/project 1/download.jpeg"
                                }
                            }

                            onCurrentIndexChanged: {
                                if (currentIndex !== 0) {
                                    gender = genderSelectId.model[currentIndex]
                                }
                            }
                        }
                    }
                }
                Row{
                    id:submitBottonId
                    width: mainColId.width
                    height: mainColId.height*0.2
                    anchors.top: genderRowId.bottom
                    Rectangle{
                        id:submitRectId
                        anchors.left: parent.left
                        anchors.leftMargin: mainColId.width*0.3
                        width: mainColId.width*0.4
                        height: mainColId.height*0.1
                        y: mainColId.height*0.05
                        radius: formRectId.width*0.02
                        color: "burlywood"
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("Submit")
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(nameFlag&ageFlag&mailFlag&genderFlag){
                                    confirmationId.visible=true
                                    // windowId.opacity=0.2
                                    itemId.opacity=0.2
                                    firstSubmit(name)
                                }else{
                                    invalidId.visible=true
                                }
                            }
                        }
                    }
                }
                Row{
                    id:invalidId
                    width: mainColId.width
                    height: mainColId.height*0.2
                    anchors.top: submitBottonId.bottom
                    visible: false
                    Text {
                        text: qsTr("please enter the details properly!!")
                    }
                }
            }
        }
    }
}
