import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.15
Item {
    id: editItemId
    width: windowId.width
    height: windowId.height
    property int rowid: 0
    signal toView()

    function updateDat() {
        var r = databaseManager.fetchData();
        dataModel.clear();
        for (var i = 0; i < r.length; ++i) {
            var row = r[i];
            dataModel.append({ name: row.Name, password: row.Password, age: row.Age, gender: row.Gender });
            rowsNo.push(row.id);
        }
    }

    TableView {
        id: tableView
        width: parent.width
        height: parent.height * 0.8
        model: ListModel {
            id: dataModel
        }
        Component.onCompleted: {
            updateDat();
        }
        TableViewColumn {
            role: "Name"
            title: "Name"
            width: 100
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role: "Password"
            title: "Password"
            width: 100
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role: "Age"
            title: "Age"
            width: 100
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role: "Gender"
            title: "Gender"
            width: 100
            horizontalAlignment: Text.AlignHCenter
        }
        itemDelegate: Item {
            TextEdit {
                id: textEdit
                text: styleData.value
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                onTextChanged: {
                    if (styleData.row >= 0 && styleData.row < dataModel.count) {
                        rowid = styleData.row;
                        dataModel.setProperty(styleData.row, styleData.role, text);
                    }
                    editItemId.toView();
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
            font.pixelSize: parent.width * 0.02
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var name = dataModel.get(rowid).Name;
                    var password = dataModel.get(rowid).Password;
                    var age = dataModel.get(rowid).Age;
                    var gender = dataModel.get(rowid).Gender;
                    databaseManager.updateData(rowsNo[rowid], name, password, age, gender);
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
            font.pixelSize: parent.width * 0.02
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
            font.pixelSize: parent.width * 0.02
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    editItemId.visible = false;
                    loginId.visible = true;
                    updateDat();
                }
            }
        }
    }
}
