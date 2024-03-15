import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item {
    id:finalId
    width: windowId.width
    height: windowId.height
    visible: false
    property int workExpCount: 0
    property string  age
    property string password: ""
    property string name: ""
    property string gender: ""
    property string hobbies: ""
    property var about: ""
    property string imagefile: "black.png"
    signal back()
    function final_list(fname, fpassword, fage, fgender, fhobbies, fworkexp, fabout){
        name = fname;
        password = fpassword;
        age = fage;
        gender = fgender;
        workExpCount = fworkexp;
        about = fabout;
        if(hobbies.length===0){
            for (var i = 0; i < fhobbies.length; i++) {
                hobbies += fhobbies[i];
                if (i < fhobbies.length - 1) {
                    hobbies += "\n";
                }
            }
        }
    }
    function afterThanking(){
        finalId.visible = true;
    }

    function colorLogin(){
        if (windowId.color == "#000000") {
            //console.log(windowId.color+"if")
            regTextid.color="white"
            nameRectId.color="black"
            ageRectId.color="black"
            genderRectId.color="black"
            aboutRectId.color="black"
            hobbiesRectId.color="black"
            workRectId.color="black"
            hobbiesRectId.color="black"
            nameId.color="white"
            ageId.color="white"
            genderId.color="white"
            hobbiesId.color="white"
            workId.color="white"
            aboutId.color="white"
            nameTextRectId.color="black"
            ageTextRectId.color="black"
            genderTextRectId.color="black"
            hobbiesTextRectId.color="black"
            workTextRectId.color="black"
            aboutTextRectId.color="black"
            nameTextId.color="white"
            ageTextId.color="white"
            genderTextId.color="white"
            hobbiesTextId.color="white"
            workTextId.color="white"
            aboutTextId.color="white"
            imagefile="white.png"
        }else{
            //console.log(windowId.color+"else")
            regTextid.color="black"
            nameRectId.color="#dcdcdc"
            ageRectId.color="#dcdcdc"
            genderRectId.color="#dcdcdc"
            aboutRectId.color="#dcdcdc"
            hobbiesRectId.color="#dcdcdc"
            workRectId.color="#dcdcdc"
            hobbiesRectId.color="#dcdcdc"
            nameId.color="black"
            ageId.color="black"
            genderId.color="black"
            hobbiesId.color="black"
            workId.color="black"
            aboutId.color="black"
            nameTextRectId.color="#dcdcdc"
            ageTextRectId.color="#dcdcdc"
            genderTextRectId.color="#dcdcdc"
            hobbiesTextRectId.color="#dcdcdc"
            workTextRectId.color="#dcdcdc"
            aboutTextRectId.color="#dcdcdc"
            nameTextId.color="black"
            ageTextId.color="black"
            genderTextId.color="black"
            hobbiesTextId.color="black"
            workTextId.color="black"
            aboutTextId.color="black"
            imagefile="black.png"
        }
    }

    Image {
        id: imageId
        width: parent.width*0.1
        height: parent.height*0.08
        x:parent.width*0.05
        source: "file:///D:/Digital Shark/Mini Project/project 2/backarrow-"+imagefile
        MouseArea{
            anchors.fill: parent
            onClicked: {
                back()
                finalId.visible=false
            }
        }
    }
    Text {
        anchors.top: windowId.top
        id: regTextid
        text: "Your Details"
        x: parent.width*0.33
        y:parent.height*0.01
        font {
            pixelSize: windowId.width * 0.05
            italic: true
            bold: true
        }
    }
    Rectangle{
        id: mainRectId
        width: windowId.width * 0.5
        height: windowId.height * 0.85
        x: windowId.width * 0.25
        y: windowId.height * 0.1
        color: "#808080"
        radius: windowId.width*0.02
        onColorChanged: {
            console.log("color"+color)
        }
        onVisibleChanged: {
            console.log("visible"+visible)
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                //console.log(mainRectId.color)
            }
        }
        // z:1
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
                font.pixelSize: parent.width * 0.1
            }

        }
        Rectangle {
            id: nameTextRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: nameRectId.right
            anchors.leftMargin: parent.width*0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: nameTextId
                anchors.centerIn: parent
                text: name
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle {
            id: ageRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            anchors.top: nameRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: ageId
                anchors.centerIn: parent
                text: qsTr("Age: ")
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle {
            id: ageTextRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: ageRectId.right
            anchors.leftMargin: parent.width*0.05
            anchors.top: nameRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: ageTextId
                anchors.centerIn: parent
                text: age
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle {
            id: genderRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            anchors.top: ageRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: genderId
                anchors.centerIn: parent
                text: qsTr("Gender: ")
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle {
            id: genderTextRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: ageRectId.right
            anchors.leftMargin: parent.width*0.05
            anchors.top: ageRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: genderTextId
                anchors.centerIn: parent
                text: gender
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle {
            id: hobbiesRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            anchors.top: genderRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: hobbiesId
                anchors.centerIn: parent
                text: qsTr("Hobbies: ")
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle {
            id: hobbiesTextRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: ageRectId.right
            anchors.leftMargin: parent.width*0.05
            anchors.top: genderRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            ScrollView {
                anchors.fill: parent
                TextArea {
                    id: hobbiesTextId
                    text: hobbies
                    wrapMode: TextArea.Wrap
                    readOnly: true
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
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: workId
                anchors.centerIn: parent
                text: qsTr("Work Experience: ")
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle {
            id: workTextRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: ageRectId.right
            anchors.leftMargin: parent.width*0.05
            anchors.top: hobbiesRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            Text {
                id: workTextId
                anchors.centerIn: parent
                text: workExpCount
                font.bold: true
                font.pixelSize: parent.width * 0.1
            }
        }
        Rectangle {
            id: aboutRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            anchors.top: workRectId.bottom
            anchors.topMargin: parent.height*0.05
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
        Rectangle {
            id: aboutTextRectId
            width: parent.width * 0.4
            height: parent.height * 0.1
            anchors.left: ageRectId.right
            anchors.leftMargin: parent.width*0.05
            anchors.top: workRectId.bottom
            anchors.topMargin: parent.height*0.05
            radius: parent.width * 0.02
            color: "#dcdcdc"
            ScrollView {
                anchors.fill: parent
                TextArea {
                    id: aboutTextId
                    placeholderText: "Tell About you briefly"
                    text: about
                    wrapMode: TextArea.Wrap
                    readOnly: true
                }
            }
        }
    }
}
