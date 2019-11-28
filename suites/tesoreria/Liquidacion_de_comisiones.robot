*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i
${Numero_reserva}    1041954
${Identificacion}    1015432573
${Identificacion_vendedor}    1015458103
${Nombre_cliente}    YOLANDA CANO



*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Tesoreria\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse34"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar reporte de comisiones
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Click Element    xpath=//*[@id="id_canal"]/option[38]
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-liquidacion-container"]
    Click Element    xpath=//*[@id="liquidacion"]/option[1]
    Click Element    xpath=//*[@id="select2-liquidacion-container"]
    Sleep    1s
    Click Button    xpath=//*[@id="boton_mostrar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Ver descuentos
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="resultLIquidacionComision"]/tbody/tr[1]/td[10]/div/button[1]
    Wait Until Element Is Visible    xpath=//*[@id="btnGuardarDescuento"]    ${Time}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C003 Ver decuentos para Retefuente
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="resultLIquidacionComision"]/tbody/tr[1]/td[10]/div/button[2]
    Wait Until Element Is Visible    xpath=//*[@id="btnGuardarDescuento"]    ${Time}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C004 Ver detalles comisiones    
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="resultLIquidacionComision"]/tbody/tr[1]/td[10]/div/button[3]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Time}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C005 Reenviar prenomina
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="resultLIquidacionComision"]/tbody/tr[1]/td[10]/div/button[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Element    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser


    

