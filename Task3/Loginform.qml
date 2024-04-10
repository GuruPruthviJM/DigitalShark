import QtQuick 2.15
import QtQuick.Controls 2.15
Item {
    id:loginFormId
    width: windowId.width
    height: windowId.height
    property string imagefile: "eyeclose"
    property string password: ""
    property string name: ""
    signal new_register()
    signal toTable()
    function fromAny(){
        nameInputId.text=""
        passwordInputId.text=""
    }

    Text {
        id: formTextId
        x: parent.width*0.35
        y:parent.height*0.08
        text: qsTr("Login Form")
        font{
            pixelSize: parent.width*0.05
            bold: true
            italic: true
        }
        color: "#ffffff"
    }
    Rectangle{
        anchors.centerIn: parent
        width: parent.width*0.4
        height: parent.height*0.55
        color: "#808080"
        radius: parent.width*0.02

        Rectangle {
            id: nameRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "black"
            Text {
                id: nameId
                anchors.centerIn: parent
                text: qsTr("Name: ")
                font.bold: true
                font.pixelSize: parent.width * 0.15
                color: "white"
            }
        }
        TextField{
            id: nameInputId
            width: parent.width*0.4
            height: parent.height*0.1
            anchors.left: nameRectId.right
            anchors.leftMargin: parent.width*0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.05
            placeholderText: "Enter your name"
            text:name

            onTextChanged: {
                name=nameInputId.text
                if(name.match(/[0-9]/)){
                    color="red"
                }else{
                    color="green"
                }
                if(invalid.visible){
                    invalid.visible=false
                }
            }
        }
        Rectangle {
            id: passwordRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            anchors.top: nameRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "black"
            Text {
                id: passwordId
                anchors.centerIn: parent
                text: qsTr("Password: ")
                font.bold: true
                font.pixelSize: parent.width * 0.15
                color: "white"
            }
        }
        TextField{
            id: passwordInputId
            width: parent.width*0.4
            height: parent.height*0.1
            anchors.left: nameRectId.right
            anchors.leftMargin: parent.width*0.05
            anchors.top: nameRectId.bottom
            anchors.topMargin: parent.height*0.05
            placeholderText: "Enter your password"
            echoMode: TextField.Password
            Image {
                width: parent.width * 0.2
                height: parent.height
                anchors.right: parent.right
                source: "file:///D:/Digital Shark/Mini Project/project 2/"+imagefile
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        imagefile=(imagefile==="eyeclose")?"eye":"eyeclose"
                        if(imagefile=="eye"){
                            passwordInputId.echoMode = TextField.Normal
                        }else{
                            passwordInputId.echoMode = TextField.Password
                        }
                    }
                }
            }
            onTextChanged: {
                if(invalid.visible){
                    invalid.visible=false
                }
            }
        }
        Rectangle{
            id:loginId1
            width: parent.width*0.4
            height: parent.height*0.13
            x:parent.width*0.3
            y:parent.height*0.4
            radius: parent.width*0.05
            color: "black"
            Text {
                id:loginText
                anchors.centerIn: parent
                text: qsTr("Login")
                font.pixelSize: parent.width*0.2
                font.bold: true
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(databaseManager.verifyLogin(nameInputId.text,passwordInputId.text)){
                        loginFormId.visible=false
                        tableView.visible=true
                        tableView.updateData()
                    }else{
                        invalid.visible=true
                    }
                }
            }
        }
        Text {
            text: qsTr("Do You Have an Account?")
            font.pixelSize: parent.width*0.05
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.08
            y:parent.height*0.63
            font.bold: true
            color: "white"
        }
        Rectangle{
            id:registerId
            width: parent.width*0.4
            height: parent.height*0.13
            x:parent.width*0.55
            y:parent.height*0.72
            color: "black"
            radius: parent.width*0.05
            Text {
                id:regTextId
                anchors.centerIn: parent
                text: qsTr("Register")
                font.pixelSize: parent.width*0.2
                font.bold: true
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    loginFormId.visible=false
                    registerationId.visible=true
                    invalid.visible=false
                    registerationId.new_reg()
                }
            }
        }
    }
    Text {
        id: invalid
        text: qsTr("*Please Enter the details completly!!")
        font.pixelSize: parent.width*0.02
        x:parent.width*0.45
        y:parent.height*0.8
        visible: false
        color: "white"
    }

    Rectangle{
        width: parent.width*0.2
        height: parent.height*0.1
        radius: parent.width*0.05
        x:parent.width*0.15
        y:parent.height*0.85
        Text {
            text: qsTr("Edit")
            anchors.centerIn: parent
            font.pixelSize: parent.width*0.1
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                editId.visible=true
                loginId.visible=false
            }
        }
    }
    Rectangle{
        width: parent.width*0.2
        height: parent.height*0.1
        radius: parent.width*0.05
        x:parent.width*0.65
        y:parent.height*0.85
        Text {
            text: qsTr("Display")
            anchors.centerIn: parent
            font.pixelSize: parent.width*0.1
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                viewId.visible=true
                loginId.visible=false
            }
        }
    }
}
