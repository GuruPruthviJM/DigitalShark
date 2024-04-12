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
        onToRegister: {
            registerationId.fromTab(rowId,name,password,age,gender)
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
        onToPop: {
            popId.visible=true
            editId.opacity=0.2
            editId.enabled=false
            popId.fromEdit(name,password,age,gender,rowid)
        }
    }
    Popup{
        id: popId
        visible: false
    }
    Component.onCompleted: {
        databaseManager.initializeDatabase()
    }
}
