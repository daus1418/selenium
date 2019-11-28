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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[27]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Reporte causación
    Sleep    1s
    Click Element    xpath=//*[@id="select2-fecha_viaje-container"]
    Click Element    xpath=//*[@id="fecha_viaje"]/option[2]
    Click Element    xpath=//*[@id="select2-hotel-container"]
    Click Element    xpath=//*[@id="hotel"]/option[2]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    2s
    Close Browser
    