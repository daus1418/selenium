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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[37]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar Reporte Recaudo
    Sleep    1s
    Click Element    xpath=//*[@id="Desde"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[2]/div/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[2]/div/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="Hasta"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[3]/div/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[3]/div/div/div[1]/table/tbody/tr[5]/td[1]
    Click Button    xpath=//*[@id="btnExcel"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Close Browser
    



