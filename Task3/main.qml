import QtQuick 2.15
import QtQuick.Window 2.15
// import guru 1.0

Window {
    id: windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"
    property var r: []
    Loginform{
        id: loginId
        // visible: false
        // enabled: false
    }
    Registrationform{
        id: registerationId
        // visible: false
        // enabled: false
    }
    TabView{
        id: tableView
        visible: false
        enabled: false
        onToRegistration: {
            registerationId.fromTab(rowId,name,pass,age,gender)
        }
    }
    View{
        id: viewId
        visible: false
    }
    Edit{
        id: editId
        visible: false
        onToView: {
            viewId.updateDat()
        }
    }
    Component.onCompleted: {
        databaseManager.initializeDatabase()
    }
}
