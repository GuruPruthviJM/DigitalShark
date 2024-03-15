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
    signal final_form()
    function reversal(fname,fpassword){
        passwordInputId.text=""
        name=fname
        password=fpassword
    }
    function reversing(){
        loginFormId.visible=true
        nameInputId.text=""
        passwordInputId.text=""
    }
    function colorLogin() {
        if (windowId.color == "#000000") {
            nameId.color = "white"
            formTextId.color = "white"
            passwordId.color = "white"
            loginText.color="white"
            regTextId.color="white"
            nameRectId.color="black"
            passwordRectId.color="black"
            loginId.color="black"
            registerId.color="black"
            invalid.color="white"
        } else {
            nameId.color = "black"
            formTextId.color = "black"
            passwordId.color = "black"
            loginText.color="black"
            nameRectId.color="#dcdcdc"
            passwordRectId.color="#dcdcdc"
            loginId.color="#dcdcdc"
            registerId.color="#dcdcdc"
            regTextId.color="black"
            invalid.color="black"
        }
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
        color: "#000000"
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
            color: "#dcdcdc"
            Text {
                id: nameId
                anchors.centerIn: parent
                text: qsTr("Name: ")
                font.bold: true
                font.pixelSize: parent.width * 0.15
                color: "black"
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
            color: "#dcdcdc"
            Text {
                id: passwordId
                anchors.centerIn: parent
                text: qsTr("Password: ")
                font.bold: true
                font.pixelSize: parent.width * 0.15
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
                        // passwordInputId.echoMode = (passwordInputId.echoMode === TextField.Normal) ? TextField.Password : TextField.Normal
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
            id:loginId
            width: parent.width*0.4
            height: parent.height*0.13
            x:parent.width*0.3
            y:parent.height*0.4
            radius: parent.width*0.05
            color: "#dcdcdc"
            Text {
                id:loginText
                anchors.centerIn: parent
                text: qsTr("Login")
                font.pixelSize: parent.width*0.2
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //console.log(name)
                    //console.log(nameInputId.text)
                    // console.log(password)
                    // console.log(passwordInputId.text)
                    if(name===nameInputId.text&&password===passwordInputId.text&&passwordInputId.text.length>0&&nameInputId.text.length>0){
                        final_form()
                        loginFormId.visible=false
                    }else{
                        invalid.visible=true
                        if(name!==nameInputId.text||password!==passwordInputId.text){
                            invalid.text="*Please enter the Username and Password Completly"
                        }else{
                            invalid.text="*Please Enter the details completly!!"
                        }
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
        }
        Rectangle{
            id:registerId
            width: parent.width*0.4
            height: parent.height*0.13
            x:parent.width*0.55
            y:parent.height*0.72
            color: "#dcdcdc"
            radius: parent.width*0.05
            Text {
                id:regTextId
                anchors.centerIn: parent
                text: qsTr("Register")
                font.pixelSize: parent.width*0.2
                font.bold: true
                color: "black"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    loginFormId.visible=false
                    new_register()
                    invalid.visible=false
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
    }
}
