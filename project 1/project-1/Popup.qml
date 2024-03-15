import QtQuick 2.15
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.15
Item {
    property string userName: " "
    signal ifNo()
    signal ifYes()
    anchors.centerIn: parent
    anchors.fill: parent
    function popup(name) {
        userName = name;
        confirmationDialog.opacity=1
        confirmationDialog.visible=true
        confirmationDialog.open();
    }
    property Form target: null

    onTargetChanged: {
        ifNo.connect(target.reverse)
    }


    // MessageDialog {
    //     id: confirmationDialog
    //     title: "Confirmation"
    //     icon: StandardIcon.Information
    //     text: "Hii, " + userName + "!! Do you want to save this?"
    //     standardButtons: StandardButton.Yes|StandardButton.No
    //     onNo:{
    //         ifNo()
    //     }
    //     onYes: {
    //         ifYes()
    //     }
    // }
    Rectangle {
        id: confirmationDialog
        anchors.centerIn: parent
        width: parent.width*0.4
        height: 100
        color: "white"
        visible: false

        Column {
            anchors.centerIn: parent

            Text {
                text: "Do you want to save or delete? " + userName
                font.family: "Comic Sans MS"
            }

            Row {
                spacing: 10

                Button {
                    text: "Yes"
                    onClicked: {
                        ifYes()
                        confirmationDialog.visible = false
                    }
                }

                Button {
                    text: "No"
                    onClicked: {
                        ifNo()
                        confirmationDialog.visible = false
                    }
                }
            }
        }
    }

}
