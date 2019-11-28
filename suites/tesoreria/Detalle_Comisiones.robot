*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i
${Numero_reserva}    647608

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Tesoreria\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse34"]/div/ul/li[5]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Descargar detalle comisiones
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Click Element    xpath=//*[@id="id_canal"]/option[38]
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-id_tipo_tercero-container"]
    Click Element    xpath=//*[@id="id_tipo_tercero"]/option[6]
    Click Element    xpath=//*[@id="select2-id_tipo_tercero-container"]
    Sleep    1s
    click button    (// button [text () = " Detalle comisión"])
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Descargar detalle expensas
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Click Element    xpath=//*[@id="id_canal"]/option[2]
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-id_tipo_tercero-container"]
    Click Element    xpath=//*[@id="id_tipo_tercero"]/option[6]
    Click Element    xpath=//*[@id="select2-id_tipo_tercero-container"]
    Click Button    xpath=//*[@id="boton_mostrar_exp"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C003 Descargar detalle cartera
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Click Element    xpath=//*[@id="id_canal"]/option[3]
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-id_tipo_tercero-container"]
    Click Element    xpath=//*[@id="id_tipo_tercero"]/option[6]
    Click Element    xpath=//*[@id="select2-id_tipo_tercero-container"]
    Click Button    xpath=//*[@id="boton_mostrar_cart"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C004 Historial reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="id_reserva"]    ${Numero_reserva}
    Click Button    xpath=//*[@id="boton_mostrar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser


