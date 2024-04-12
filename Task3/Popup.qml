import QtQuick 2.15
import CustomTypes 1.0
Item {
    width: windowId.width
    height: windowId.height
    property int ids: 0
    property string ageVal: ""
    property string nameVal: ""
    property string passVal: ""
    property string genderVal: ""
    function fromEdit(name,pass,age,gender,r){
        ids=r
        nameVal=name
        passVal=pass
        ageVal=age
        genderVal=gender
    }
    CustomTableModel {
        id: dataModel
    }
    Rectangle{
        anchors.centerIn: parent
        width: parent.width*0.5
        height: parent.height*0.2
        color: "#808080"
        // radius: parent.width*0.2
        Rectangle{
            width: parent.width
            height: parent.height*0.3
            anchors.top: parent.top
            color: "#808080"
            Text {
                anchors.centerIn: parent
                text: qsTr("Do you want to Edit?")
            }
        }
        Text {
            id: invalid
            text: qsTr("*The data feild can't be empty!!")
            visible: false
            anchors.right: parent.right
            y: parent.height*0.27
            anchors.rightMargin: parent.width*0.05
            color: "red"
        }
        Rectangle{
            width: parent.width
            height: parent.height*0.5
            anchors.bottom: parent.bottom
            color: "#808080"
            Rectangle{
                width: parent.width*0.4
                height: parent.height*0.9
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.02
                border.width: parent.width*0.002
                Text{
                    anchors.centerIn: parent
                    text: "Yes"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        if(containsMouse)
                            parent.color="green"
                        else
                            parent.color="white"
                    }
                    onClicked: {
                        if(nameVal.length===0||passVal.length===0||ageVal.length===0||genderVal.length===0){
                            invalid.visible=true
                        }else{
                            databaseManager.updateData(ids, nameVal, passVal, ageVal, genderVal);
                            popId.visible=false
                            editId.visible=true
                            editId.opacity=1
                            editId.enabled=true
                            editId.updateDat()
                        }
                    }
                }
            }
            Rectangle{
                width: parent.width*0.4
                height: parent.height*0.9
                anchors.right: parent.right
                anchors.rightMargin: parent.width*0.02
                border.width: parent.width*0.002
                Text{
                    anchors.centerIn: parent
                    text: "No"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        if(containsMouse)
                            parent.color="red"
                        else
                            parent.color="white"
                    }
                    onClicked: {
                        popId.visible=false
                        editId.visible=true
                        editId.opacity=1
                        editId.enabled=true
                        editId.updateDat()
                        invalid.visible=false
                    }
                }
            }
        }
    }
}
