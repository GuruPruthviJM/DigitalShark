import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: finalRegisterId
    anchors.fill: parent
    property bool cricketProgressFlag: true
    property bool codingProgressFlag: true
    property bool readingProgressFlag: true
    property bool hobbiesProgressFlag: true
    property bool workProgressFlag: true
    property bool aboutProgressFlag: true
    property int workExpCount: 0
    property string  age
    property string password: ""
    property string name: ""
    property string gender: ""
    property var hobbies: []
    property string about: ""
    signal confirm(string name,string password,string age,string gender,var hobbies, string workexp,var about)
    signal forLogin(string name,string password)
    visible: false
    function last_reg(fname,fpassword,fage,fgender){
        finalRegisterId.visible=true
        name=fname
        password=fpassword
        age=fage
        gender=fgender
        cricketHobbyId.checked=false
        coddingHobbyId.checked=false
        readingHobbyId.checked=false
        workExpInputId.text=""
        aboutTextid.text=""
        finalRegisterId.opacity=1
    }
    function changing_visibilty(){
        finalRegisterId.visible=false
    }

    function colorLogin(){
        if (windowId.color == "#000000") {
            regTextid.color="white"
            hobbiesRectId.color="black"
            workRectId.color="black"
            aboutRectId.color="black"
            submitRectId.color="black"
            nameId.color="white"
            workexpId.color="white"
            aboutId.color="white"
            submitId.color="white"
            progressID.color="white"
            invalid.color="white"
        }else{
            regTextid.color="black"
            hobbiesRectId.color="#dcdcdc"
            workRectId.color="#dcdcdc"
            aboutRectId.color="#dcdcdc"
            submitRectId.color="#dcdcdc"
            nameId.color="black"
            workexpId.color="black"
            aboutId.color="black"
            submitId.color="black"
            progressID.color="black"
            invalid.color="black"
        }
    }

    function checkFunction(){
        if((cricketProgressFlag||codingProgressFlag||readingProgressFlag)&&hobbiesProgressFlag){
            progressBarID.value+=0.1
            hobbiesProgressFlag=false
        }else if(cricketProgressFlag&&codingProgressFlag&&readingProgressFlag){
            progressBarID.value-=0.1
            hobbiesProgressFlag=true
        }else{

        }
    }
    Text {
        anchors.top: windowId.top
        id: regTextid
        text: "Registration Form"
        x: parent.width*0.27
        y:parent.height*0.05
        font {
            pixelSize: windowId.width * 0.05
            italic: true
            bold: true
        }
    }
    Rectangle{
        id: mainRectId
        width: windowId.width * 0.5
        height: windowId.height * 0.7
        x: windowId.width * 0.25
        y: windowId.height * 0.15
        color: "#808080"
        radius: windowId.width*0.02

        Rectangle {
            id: hobbiesRectId
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
                text: qsTr("Hobbies: ")
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }


        Rectangle{
            anchors.left: hobbiesRectId.right
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.05
            anchors.leftMargin: parent.width*0.05


            CheckBox {
                id: cricketHobbyId
                text: qsTr("Cricket")
                indicator: Rectangle {
                    implicitWidth: hobbiesRectId.width*0.2
                    implicitHeight: hobbiesRectId.height * 0.8
                    x: cricketHobbyId.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 3
                    border.color: "black"

                    Rectangle {
                        width: parent.width*0.5
                        height: parent.height * 0.5
                        x: parent.width*0.22
                        y: parent.height*0.26
                        radius: 2
                        color: "black"
                        visible: cricketHobbyId.checked
                    }
                }
                contentItem: Text {
                    text: cricketHobbyId.text
                    font.pixelSize: hobbiesRectId.width*0.1
                    opacity: enabled ? 1.0 : 0.3
                    color: "black"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: cricketHobbyId.indicator.width + cricketHobbyId.spacing
                }
                onClicked: {
                    if(cricketProgressFlag){
                        cricketProgressFlag=false
                        hobbies.push("Cricker")
                        checkFunction()
                    }else{
                        cricketProgressFlag=true
                        var index=hobbies.indexOf("Cricket")
                        hobbies.pop(index,1)
                        checkFunction()
                    }
                }
            }
            CheckBox {
                id: coddingHobbyId
                text: qsTr("Codding")
                y:mainRectId.height*0.1

                indicator: Rectangle {
                    implicitWidth: hobbiesRectId.width*0.2
                    implicitHeight: hobbiesRectId.height * 0.8
                    x: coddingHobbyId.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 3
                    border.color: "black"

                    Rectangle {
                        width: parent.width*0.5
                        height: parent.height * 0.5
                        x: parent.width*0.22
                        y: parent.height*0.26
                        radius: 2
                        color: "black"
                        visible: coddingHobbyId.checked
                    }
                }
                contentItem: Text {
                    text: coddingHobbyId.text
                    font.pixelSize: hobbiesRectId.width*0.1
                    opacity: enabled ? 1.0 : 0.3
                    color: "black"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: coddingHobbyId.indicator.width + coddingHobbyId.spacing
                }
                onClicked: {
                    if(codingProgressFlag){
                        codingProgressFlag=false
                        hobbies.push("Codding")
                        checkFunction()
                    }else{
                        codingProgressFlag=true
                        var index=hobbies.indexOf("Codding")
                        hobbies.pop(index,1)
                        checkFunction()
                    }
                }
            }
            CheckBox {
                id: readingHobbyId
                text: qsTr("Reading")
                y:mainRectId.height*0.2
                indicator: Rectangle {
                    implicitWidth: hobbiesRectId.width*0.2
                    implicitHeight: hobbiesRectId.height * 0.8
                    x: readingHobbyId.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 3
                    border.color: "black"

                    Rectangle {
                        width: parent.width*0.5
                        height: parent.height * 0.5
                        x: parent.width*0.22
                        y: parent.height*0.26
                        radius: 2
                        color: "black"
                        visible: readingHobbyId.checked
                    }
                }
                contentItem: Text {
                    text: readingHobbyId.text
                    font.pixelSize: hobbiesRectId.width*0.1
                    opacity: enabled ? 1.0 : 0.3
                    color: "black"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: readingHobbyId.indicator.width + readingHobbyId.spacing
                }
                onClicked: {
                    if(readingProgressFlag){
                        readingProgressFlag=false
                        hobbies.push("Reading")
                        checkFunction()
                    }else{
                        readingProgressFlag=true
                        var index=hobbies.indexOf("Reading")
                        hobbies.pop(index,1)
                        checkFunction()
                    }
                }
            }
        }
        Rectangle {
            id: workRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            anchors.top: hobbiesRectId.bottom
            anchors.topMargin: parent.height*0.22
            radius: parent.width * 0.02
            color: "#dcdcdc"

            Text {
                id: workexpId
                anchors.centerIn: parent
                text: qsTr("Work Experience: ")
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        // SpinBox {
        //     value: 0
        //     width: parent.width*0.4
        //     anchors.top: hobbiesRectId.bottom
        //     anchors.topMargin: parent.height*0.22
        //     anchors.left: workRectId.right
        //     anchors.leftMargin: parent.width*0.07

        //     onValueChanged : {
        //         if(workProgressFlag){
        //             progressBarID.value+=0.2
        //             workProgressFlag=false
        //         }
        //     }
        // }
        TextField{
            id: workExpInputId
            width: parent.width*0.4
            height: parent.height*0.1
            anchors.top: hobbiesRectId.bottom
            anchors.topMargin: parent.height*0.22
            anchors.left: workRectId.right
            anchors.leftMargin: parent.width*0.07
            text: workExpCount
            // readOnly: true
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.5
                anchors.top: parent.top
                anchors.right: parent.right
                Text {
                    anchors.centerIn: parent
                    text: qsTr("▲")
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        workExpCount+=1
                        workExpInputId.text=workExpCount
                    }
                }
            }
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.5
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Text {
                    anchors.centerIn: parent
                    text: qsTr("▼")
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(workExpCount>0)
                            workExpCount-=1
                        workExpInputId.text=workExpCount
                    }
                }
            }
            onTextChanged: {
                if(workExpInputId.text!==0&&workProgressFlag&&workExpCount!==0){
                    progressBarID.value+=0.2
                    workProgressFlag=false
                }
            }
        }

        Rectangle {
            id: aboutRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            anchors.top: workRectId.bottom
            anchors.topMargin: parent.height*0.1
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: aboutId
                anchors.centerIn: parent
                text: qsTr("About: ")
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle{
            width: parent.width * 0.4
            height: parent.height * 0.3
            anchors.top: workRectId.bottom
            anchors.topMargin: parent.height*0.1
            anchors.left: workRectId.right
            anchors.leftMargin: parent.width*0.07
            border.width: parent.width*0.005
            ScrollView {
                anchors.fill: parent
                TextArea {
                    id: aboutTextid
                    placeholderText: "Tell About you briefly"
                    text: ""
                    wrapMode: TextArea.Wrap
                    onTextChanged: {
                        if(text.length!==0&&aboutProgressFlag){
                            progressBarID.value+=0.2
                            aboutProgressFlag=false
                        }else if(text.length===0){
                            progressBarID.value-=0.2
                            aboutProgressFlag=true
                        }
                        about=aboutTextid.text
                        //console.log("about- ",about)
                    }
                }
            }
        }

        Rectangle{
            id:submitRectId
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.3
            anchors.topMargin: parent.height*0.22
            anchors.top: aboutRectId.bottom
            width: parent.width*0.4
            height: parent.height*0.1
            radius: parent.width*0.02
            color: "#dcdcdc"
            Text {
                id:submitId
                anchors.centerIn: parent
                text: qsTr("Submit")
                font.pixelSize: parent.width * 0.15
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(progressBarID.value===1){
                        confirm(name,password, age,gender,hobbies,workExpCount,about)
                        forLogin(name,password)
                        finalRegisterId.opacity=0.2
                    }else{
                        invalid.visible=true
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
        id: progressRectId
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
            value: 0.5
            onValueChanged: {
                //console.log("dd"+value)
            }
        }
    }
}
