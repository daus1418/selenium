*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i
${id_reserva}    1041969
${Identificacion_Pasajero}    810231863

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Tesoreria\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse34"]/div/ul/li[8]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Solicitar información de pasajeros por id de reserva
    Sleep    1s
    Input Text    xpath=//*[@id="id_reserva_flt"]    ${id_reserva}   
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Solicitar información de pasajeros por identificacion de pasajeros
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="id_doc_pax_flt"]    ${Identificacion_Pasajero}
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser