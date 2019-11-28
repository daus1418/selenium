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
    Click Element    xpath=//a[contains(.," Reportes Hotel\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse79"]/div/ul/li[8]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar reporte de rendimiento de hoteles
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaViajeIni"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaViajeFin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/button
    Click Element    xpath=//*[@id="optionbusqueda"]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Close Browser
