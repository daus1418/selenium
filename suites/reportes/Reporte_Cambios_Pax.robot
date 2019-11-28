*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Reserva}        1042041

*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[22]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar reporte de Cambio de pasajeros en la reserva
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="id_reserva_flt"]    ${Reserva}
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/div/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Element Should Be Visible    //*[@id="resultTableCambiosPax"]/thead/tr
    Close Browser
