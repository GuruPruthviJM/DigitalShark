import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: regisetrationId
    width: windowId.width
    height: windowId.height
    property string imagefile: "eyeclose"
    property string imagefile1: "eyeclose"
    property bool nameProgressFlag: true
    property bool passwordProgressFlag: true
    property bool ageProgressFlag: true
    property bool genderProgressFlag: true
    property string  age: "0"
    property string password: ""
    property string confirmPassword: ""
    property string name: ""
    property string gender: ""
    // property type name: value
    signal next_partReg(string name,string password,string age,string gender)
    function new_reg(){
        visible=true
        name=""
        age="0"
        password=""
        confirmPasswordInputId.text=""
        radioButton1.checked=false
        radioButton2.checked=false
        radioButton3.checked=false
        ageTextId.text=""
        mySlider.value=0
        progressBarID.value=0
    }
    function colorLogin() {
        if (windowId.color == "#000000") {
            nameId.color = "white"
            nameRectId.color="#black"
            passwordId.color = "white"
            passwordRectId.color="black"
            confirmPasswordId.color="white"
            confirmPasswordRectId.color="black"
            ageId.color="white"
            ageRectId.color="black"
            genderId.color="white"
            genderRectId.color="black"
            submitId.color="white"
            submitRectId.color="black"
            regTextid.color="white"
            progressID.color="white"
            invalid.color="white"
        } else {
            nameId.color = "black"
            nameRectId.color="#dcdcdc"
            passwordId.color = "black"
            passwordRectId.color="#dcdcdc"
            confirmPasswordId.color="black"
            confirmPasswordRectId.color="#dcdcdc"
            ageId.color="black"
            ageRectId.color="#dcdcdc"
            genderId.color="black"
            genderRectId.color="#dcdcdc"
            submitId.color="black"
            submitRectId.color="#dcdcdc"
            regTextid.color="black"
            progressID.color="black"
            invalid.color="black"
        }
    }
    visible: false
    Column {
        id: loginColId
        width: windowId.width * 0.5
        height: windowId.height * 0.7
        x: windowId.width * 0.25
        y: windowId.height * 0.1
        Text {
            anchors.top: windowId.top
            id: regTextid
            text: "Registration Form"
            x: parent.width*0.05
            font {
                pixelSize: windowId.width * 0.05
                italic: true
                bold: true
                // underline: true
            }
        }
        Item {
            id: formRectId
            width: loginColId.width
            height: loginColId.height
            // anchors.top: regTextid.bottom
            // anchors.bottomMargin: parent.height*0.5
            Rectangle {
                width: formRectId.width
                height: formRectId.height
                radius: formRectId.width * 0.05
                color: "#808080"
            }
            Row {
                id: nameRowId
                width: loginColId.width
                height: loginColId.height * 0.125
                x:parent.width*0.1
                y:parent.height*0.1
                spacing: parent.width*0.05
                Rectangle {
                    id: nameRectId
                    width: loginColId.width * 0.4
                    height: loginColId.height * 0.1
                    radius: formRectId.width * 0.02
                    color: "#dcdcdc"

                    Text {
                        id: nameId
                        anchors.centerIn: parent
                        text: qsTr("Name: ")
                        font.bold: true
                        font.pixelSize: parent.width * 0.1
                    }
                }

                TextField {
                    id: nameTextId
                    placeholderText: "Enter your Name please"
                    width: nameRectId.width
                    height: nameRectId.height
                    text:name
                    onTextChanged: {
                        name = nameTextId.text
                        if (name.match(/[0-9]/)) {
                            color = "red"
                        } else {
                            color = "green"
                        }
                        name=nameTextId.text
                        if(nameTextId.text.length!==0&&nameProgressFlag){
                            progressBarID.value+=0.1
                            //console.log("aa")
                            nameProgressFlag=false
                            //console.log("a")
                        }else if(nameTextId.text.length===0){
                            progressBarID.value-=0.1
                            nameProgressFlag=true
                        }
                        if(invalid.visible){
                            invalid.visible=false
                        }
                        else{

                        }
                    }
                }
            }

            Row {
                id: passwordRowId
                width: loginColId.width
                height: loginColId.height * 0.125
                anchors.top: nameRowId.bottom
                x:parent.width*0.1
                // y: parent.height
                spacing: parent.width*0.05
                Rectangle {
                    id: passwordRectId
                    width: loginColId.width * 0.4
                    height: loginColId.height * 0.1
                    radius: formRectId.width * 0.02
                    color: "#dcdcdc"

                    Text {
                        id: passwordId
                        anchors.centerIn: parent
                        text: qsTr("Password: ")
                        font.bold: true
                        font.pixelSize: parent.width * 0.1
                    }
                }
                TextField {
                    id: passwordInputId
                    placeholderText: "password!!"
                    width: nameRectId.width
                    height: nameRectId.height
                    echoMode: TextField.Password
                    text:password
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
                        if (confirmPasswordInputId.text === passwordInputId.text&&passwordProgressFlag&&passwordInputId.text.length>0&&
                                confirmPasswordInputId.text.length>0) {
                            confirmPasswordInputId.color = "green";
                            progressBarID.value+=0.1
                            //console.log("bb")
                            passwordProgressFlag=false
                        } else {
                            confirmPasswordInputId.color = "red";
                            if(passwordProgressFlag===false)
                                progressBarID.value-=0.1
                            passwordProgressFlag=true
                        }
                        if(invalid.visible){
                            invalid.visible=false
                        }
                        password=passwordInputId.text
                    }
                }
            }
            Row {
                id: confirmPasswordRowId
                width: loginColId.width
                height: loginColId.height * 0.125
                anchors.top: passwordRowId.bottom
                x:parent.width*0.1
                // y: parent.height
                spacing: parent.width*0.05
                Rectangle {
                    id: confirmPasswordRectId
                    width: loginColId.width * 0.4
                    height: loginColId.height * 0.1
                    radius: formRectId.width * 0.02
                    color: "#dcdcdc"
                    // clip: true
                    Text {
                        id: confirmPasswordId
                        anchors.centerIn: parent
                        text: qsTr("Confirm Password:")
                        font.bold: true
                        font.pixelSize: parent.width * 0.1
                    }
                }
                TextField {
                    id: confirmPasswordInputId
                    placeholderText: "password!!"
                    width: nameRectId.width
                    height: nameRectId.height
                    echoMode: TextField.Password
                    text: confirmPassword
                    onTextChanged: {
                        if (confirmPasswordInputId.text === passwordInputId.text&&passwordProgressFlag&&passwordInputId.text.length>0&&
                                confirmPasswordInputId.text.length>0) {
                            confirmPasswordInputId.color = "green";
                            progressBarID.value+=0.1
                            //console.log("bb")
                            passwordProgressFlag=false
                        } else {
                            confirmPasswordInputId.color = "red";
                            if(passwordProgressFlag===false)
                                progressBarID.value-=0.1
                            passwordProgressFlag=true
                        }
                        if(invalid.visible){
                            invalid.visible=false
                        }
                    }
                    Image {
                        width: parent.width * 0.2
                        height: parent.height
                        anchors.right: parent.right
                        source: "file:///D:/Digital Shark/Mini Project/project 2/"+imagefile1
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // passwordInputId.echoMode = (passwordInputId.echoMode === TextField.Normal) ? TextField.Password : TextField.Normal
                                imagefile1=(imagefile1==="eyeclose")?"eye":"eyeclose"
                                if(imagefile1==="eye"){
                                    confirmPasswordInputId.echoMode=TextField.Normal
                                }else{
                                    confirmPasswordInputId.echoMode=TextField.Password
                                }
                            }
                        }
                    }
                }
            }
            Row {
                id: ageRowId
                width: loginColId.width
                height: loginColId.height * 0.125
                x:parent.width*0.1
                // y: parent.height*0.1
                anchors.top: confirmPasswordRowId.bottom
                spacing: parent.width*0.05
                Rectangle {
                    id: ageRectId
                    width: loginColId.width * 0.4
                    height: loginColId.height * 0.1
                    radius: formRectId.width * 0.02
                    color: "#dcdcdc"
                    Text {
                        id: ageId
                        anchors.centerIn: parent
                        text: qsTr("Age: ")
                        font.bold: true
                        font.pixelSize: parent.width * 0.1
                    }
                }
                TextField {
                    id: ageTextId
                    placeholderText: "age"
                    width: loginColId.width * 0.1
                    height: loginColId.height * 0.1
                    validator: RegExpValidator { regExp: /[0-9]+/ }
                    text: age
                    onTextChanged: {
                        if (ageTextId.text !== "") {
                            mySlider.value = parseFloat(ageTextId.text);
                        }
                        if(ageTextId.text.length!==0&&ageProgressFlag){
                            progressBarID.value+=0.1
                            //console.log(ageTextId.text)
                            ageProgressFlag=false
                        }
                        if((ageTextId.text.length===0&&!ageProgressFlag)||mySlider.value===0){
                            progressBarID.value-=0.1
                            ageProgressFlag=true
                        }
                        age=ageTextId.text
                        if(invalid.visible){
                            invalid.visible=false
                        }
                    }
                }

                Slider {
                    id: mySlider
                    from: 0
                    to: 99
                    value: parseFloat(ageTextId.text)
                    stepSize: 1
                    width: loginColId.width * 0.3
                    height: loginColId.height * 0.1
                    ToolTip.visible: mySlider.hovered
                    ToolTip.text: "Value: " + mySlider.value.toFixed(2)
                    onValueChanged: {
                        ageTextId.text = mySlider.value.toString();
                    }
                }

            }
            Row {
                id: genderRowId
                width: loginColId.width
                height: loginColId.height * 0.125
                x:parent.width*0.1
                // y: parent.height*0.1
                anchors.top: ageRowId.bottom
                spacing: parent.width*0.05
                Rectangle {
                    id: genderRectId
                    width: loginColId.width * 0.4
                    height: loginColId.height * 0.1
                    radius: formRectId.width * 0.02
                    color: "#dcdcdc"
                    Text {
                        id: genderId
                        anchors.centerIn: parent
                        text: qsTr("Gender: ")
                        font.bold: true
                        font.pixelSize: parent.width * 0.1
                    }
                }
                Column {
                    id:a
                    spacing: parent.width*0.002
                    RadioButton {
                        id: radioButton1
                        onClicked: {
                            if(genderProgressFlag){
                                progressBarID.value+=0.2
                                genderProgressFlag=false
                            }
                            if(invalid.visible){
                                invalid.visible=false
                            }
                            gender="Male"
                        }

                        Text {
                            text: qsTr("Male")
                            font.pixelSize: loginColId.width*0.05
                            anchors.left: parent.right
                        }
                        indicator: Rectangle {
                            id: maleRadioId
                            implicitWidth: loginColId.width*0.07
                            implicitHeight: loginColId.width*0.07
                            x: radioButton1.leftPadding
                            radius: ( loginColId.width*0.08)/2
                            border.color: radioButton1.down ? "#17a81a" : "#21be2b"

                            Rectangle {
                                width: loginColId.width*0.05
                                height: loginColId.width*0.05
                                anchors.centerIn: maleRadioId
                                radius: ( loginColId.width*0.05)/2
                                color: radioButton1.down ? "#17a81a" : "#21be2b"
                                visible: radioButton1.checked
                            }
                        }

                        contentItem: Text {
                            text: radioButton1.text
                            font: radioButton1.font
                            opacity: radioButton1.enabled ? 1.0 : 0.3
                            color: radioButton1.down ? "#17a81a" : "#21be2b"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: radioButton1.indicator.width + radioButton1.spacing
                        }
                    }
                    RadioButton {
                        id: radioButton2
                        onClicked: {
                            if(genderProgressFlag){
                                progressBarID.value+=0.2
                                genderProgressFlag=false
                            }
                            if(invalid.visible){
                                invalid.visible=false
                            }
                            gender="Female"
                        }
                        Text {
                            text: qsTr("Female")
                            font.pixelSize: loginColId.width*0.05
                            anchors.left: parent.right
                        }
                        indicator: Rectangle {
                            id: femaleRadioId
                            implicitWidth: loginColId.width*0.07
                            implicitHeight: loginColId.width*0.07
                            x: radioButton2.leftPadding
                            radius: ( loginColId.width*0.08)/2
                            border.color: radioButton2.down ? "#17a81a" : "#21be2b"

                            Rectangle {
                                width: loginColId.width*0.05
                                height: loginColId.width*0.05
                                anchors.centerIn: femaleRadioId
                                radius: ( loginColId.width*0.05)/2
                                color: radioButton2.down ? "#17a81a" : "#21be2b"
                                visible: radioButton2.checked
                            }
                        }

                        contentItem: Text {
                            text: radioButton2.text
                            font: radioButton2.font
                            opacity: radioButton2.enabled ? 1.0 : 0.3
                            color: radioButton2.down ? "#17a81a" : "#21be2b"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: radioButton2.indicator.width + radioButton2.spacing
                        }
                    }
                    RadioButton {
                        id: radioButton3
                        onClicked: {
                            if(genderProgressFlag){
                                progressBarID.value+=0.2
                                genderProgressFlag=false
                            }
                            if(invalid.visible){
                                invalid.visible=false
                            }
                            gender="Others"
                        }
                        Text {
                            text: qsTr("Others")
                            font.pixelSize: loginColId.width*0.05
                            anchors.left: parent.right
                        }
                        indicator: Rectangle {
                            id: otherRadioId
                            implicitWidth: loginColId.width*0.07
                            implicitHeight: loginColId.width*0.07
                            x: radioButton3.leftPadding
                            radius: ( loginColId.width*0.08)/2
                            border.color: radioButton3.down ? "#17a81a" : "#21be2b"

                            Rectangle {
                                width: loginColId.width*0.05
                                height: loginColId.width*0.05
                                anchors.centerIn: otherRadioId
                                radius: ( loginColId.width*0.05)/2
                                color: radioButton3.down ? "#17a81a" : "#21be2b"
                                visible: radioButton3.checked
                            }
                        }

                        contentItem: Text {
                            text: radioButton3.text
                            font: radioButton3.font
                            opacity: radioButton3.enabled ? 1.0 : 0.3
                            color: radioButton3.down ? "#17a81a" : "#21be2b"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: radioButton3.indicator.width + radioButton3.spacing
                        }
                    }
                }
            }
            Rectangle{
                id:submitRectId
                anchors.left: parent.left
                anchors.leftMargin: loginColId.width*0.3
                anchors.topMargin: loginColId.height*0.15
                anchors.top: genderRowId.bottom
                width: loginColId.width*0.4
                height: loginColId.height*0.1
                radius: formRectId.width*0.02
                color: "#dcdcdc"
                Text {
                    id:submitId
                    anchors.centerIn: parent
                    text: qsTr("Next...")
                    font.pixelSize: parent.width * 0.15
                    font.bold: true
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(progressBarID.value===0.5){
                            //console.log("Name: ",name," password: ",password," age: ",age," gender: ",gender)
                            next_partReg(name,password,age,gender)
                            regisetrationId.visible=false
                        }else{
                            invalid.visible=true
                        }
                    }
                }
            }
        }
    }
    Text {
        id: invalid
        text: qsTr("*Please Enter the details completly!!")
        font.pixelSize: parent.width*0.02
        x:parent.width*0.55
        y:parent.height*0.9
        visible: false
    }
    Rectangle{
        width: parent.width*0.4
        height: parent.height*0.1
        anchors.bottom: parent.bottom
        x:  parent.width*0.02
        anchors.bottomMargin: parent.width*0.01
        color: "#808080"
        radius: parent.width*0.2
        Text{
            id:progressID
            x:parent.width*0.05
            y:parent.height*0.1
            text: "Progress: "

        }

        ProgressBar {
            id: progressBarID
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.2
            width: parent.width*0.8
            x:parent.width*0.1
            value: 0
        }
    }
}
