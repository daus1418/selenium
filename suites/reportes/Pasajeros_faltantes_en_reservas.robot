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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[25]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Reporte pasajeros faltantes reservas
    Click Element    xpath=//*[@id="fechaCreacionIni"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[2]/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[2]/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaCreacionFin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[2]/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="fechaViajeIni"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaViajeFin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[3]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="divResponse"]/div[2]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    2s
    Close Browser

    