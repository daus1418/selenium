*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div[2]/div/div/a/i


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[29]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar Reporte Envio Prenomina
    Sleep    1s
    Click Element    xpath=//*[@id="select2-id_liquidacion-container"]
    Click Element    xpath=//*[@id="id_liquidacion"]/option[3]
    Click Element    xpath=//*[@id="select2-id_liquidacion-container"]
    Click Button    xpath=//*[@id="generaArbol"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Close Browser