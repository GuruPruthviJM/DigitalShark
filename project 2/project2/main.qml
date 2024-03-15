import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("Login Form")
    minimumWidth: 450
    minimumHeight: 500
    color: "#dcdcdc"
    Tooglebar{
        id:toggleID
        onColorChange:{
            loginId.colorLogin()
            registerId.colorLogin()
            lastRegId.colorLogin()
            thanksId.colorLogin()
            finalFormId.colorLogin()
        }
    }
    Loginform {
        id:loginId
    }
    Registrationform {
        id: registerId
    }
    Registrationform2{
        id: lastRegId
    }
    Confirmation{
        id: confirmationId
    }
    Loading{
        id: loadingId
    }
    Thanking{
        id: thanksId
    }
    FinalForm{
        id: finalFormId
    }

    Component.onCompleted: {
        // toggleID.colorChange.connect(loginId.colorLogin)
        // toggleID.colorChange.connect(registerId.colorLogin)
        // toggleID.colorChange.connect(lastRegId.colorLogin)
        // toggleID.colorChange.connect(thanksId.colorLogin)
        // toggleID.colorChange.connect(finalFormId.colorLogin)
        loginId.new_register.connect(registerId.new_reg)
        loginId.final_form.connect(finalFormId.afterThanking)
        registerId.next_partReg.connect(lastRegId.last_reg)
        lastRegId.confirm.connect(finalFormId.final_list)
        lastRegId.confirm.connect(confirmationId.confirmed)
        confirmationId.saving.connect(loadingId.loading_bar)
        confirmationId.closing.connect(loginId.reversing)
        loadingId.thankyou.connect(thanksId.thank)
        thanksId.final_call.connect(loginId.reversing)
        thanksId.change_visible.connect(lastRegId.changing_visibilty)
        finalFormId.back.connect(loginId.reversing)
        lastRegId.forLogin.connect(loginId.reversal)
        confirmationId.closing.connect(lastRegId.changing_visibilty)
    }
}
