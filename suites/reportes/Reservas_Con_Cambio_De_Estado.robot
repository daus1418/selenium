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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[35]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar reporte de reservas con cambio de estado
    Sleep    1s
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[2]/div/span/span[1]/span
    Click Element    xpath=//*[@id="Estado_Anterior"]/option[32]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[2]/div/span/span[1]/span
    Click Button    xpath=//*[@id="btnExcel"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Close Browser