import QtQuick 2.15
import QtQuick.Controls 1.4
import CustomTypes 1.0
import QtQuick.Controls.Styles 1.4
Item {
    id: editItemId
    width: windowId.width
    height: windowId.height
    property string nameChanged: ""
    signal toView()
    signal toPop(string name,string password,string age,string gender,int rowid)
    property int rowid: 0
    property var dict: {
    }
    property var r: []
    function updateDat() {
        r = databaseManager.fetchData();
        dataModel.clearData();
        for (var i = 0; i < r.length; ++i) {
            var row = r[i];
            dataModel.addData(row);
        }
    }
    onVisibleChanged: {
        updateDat()
    }

    TableView {
        id: tableView
        width: parent.width
        height: parent.height * 0.8
        model: CustomTableModel {
            id: dataModel
        }
        style: TableViewStyle {
            headerDelegate: Rectangle {
                height: textItem.implicitHeight
                width: textItem.implicitWidth
                color: "greenyellow"
                Text {
                    id: textItem
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: styleData.value
                    renderType: Text.NativeRendering
                    font.bold: true

                }
            }
        }
        Component.onCompleted: {
            updateDat()
        }
        TableViewColumn {
            role: "name"
            title: "Name"
            width: parent.width*0.25
        }
        TableViewColumn {
            role: "password"
            title: "Password"
            width: parent.width*0.25
        }
        TableViewColumn {
            role: "age"
            title: "Age"
            width: parent.width*0.25
        }
        TableViewColumn {
            role: "gender"
            title: "Gender"
            width: parent.width*0.25
        }
        itemDelegate: Item {
            TextEdit {
                id: textEdit
                text: styleData.value
                anchors.horizontalCenter: parent.horizontalCenter
                onTextChanged: {
                    rowid=styleData.row
                    var rowData = dataModel.rowData(rowid);
                    var newValue = textEdit.text;
                    var roleToUpdate;
                    if(styleData.role==="name"){
                        roleToUpdate=0
                    }else if(styleData.role==="password"){
                        roleToUpdate=1
                    }else if(styleData.role==="age"){
                        roleToUpdate=2
                    }else{
                        roleToUpdate=4
                    }
                    var indexToUpdate = dataModel.index(rowid, 0);
                    // console.log(newValue)
                    dataModel.setData(indexToUpdate, newValue, roleToUpdate);
                }
            }
        }
    }
    Rectangle {
        width: parent.width * 0.2
        height: parent.height * 0.08
        radius: parent.width * 0.02
        x: parent.width * 0.1
        y: parent.height * 0.83

        Text {
            anchors.centerIn: parent
            text: qsTr("Save")
            font.pixelSize: parent.width * 0.2
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var rowData = dataModel.rowData(rowid);
                    var name = rowData["Name"];
                    var password = rowData["Password"];
                    var age = rowData["Age"];
                    var gender = rowData["Gender"];
                    var ids=rowData["id"];
                    toPop(name,password,age,gender,ids)
                    // updateDat()
                }
            }
        }
    }

    Rectangle {
        width: parent.width * 0.2
        height: parent.height * 0.08
        radius: parent.width * 0.02
        x: parent.width * 0.4
        y: parent.height * 0.83

        Text {
            anchors.centerIn: parent
            text: qsTr("Cancel")
            font.pixelSize: parent.width * 0.2
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    updateDat();
                }
            }
        }
    }
    Rectangle {
        width: parent.width * 0.2
        height: parent.height * 0.08
        radius: parent.width * 0.02
        x: parent.width * 0.72
        y: parent.height * 0.83

        Text {
            anchors.centerIn: parent
            text: qsTr("Back")
            font.pixelSize: parent.width * 0.2
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    editItemId.visible = false;
                    loginId.visible = true;
                    updateDat();
                    toView()
                }
            }
        }
    }
}
