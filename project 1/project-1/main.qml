import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "aquamarine"

    Form {
        id: formId
    }
    Popup {
        id: confirmationId
        target: formId
    }
    Savedform{
        id:lastFormId
        Component.onCompleted: {
            backToMain.connect(formId.reverse)
        }
    }
    Component.onCompleted: {
        formId.firstSubmit.connect(confirmationId.popup);
        //confirmationId.ifNo.connect(formId.reverse)
        confirmationId.ifYes.connect(formId.saved)
        formId.lastSubmit.connect(lastFormId.last)
    }
}
