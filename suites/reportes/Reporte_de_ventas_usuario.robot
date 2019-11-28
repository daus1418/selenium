*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/a/i


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Emisiones de Pasajeros\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[16]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar reporte de ventas usuario
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaInicial"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaFinal"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[2]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/div/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser