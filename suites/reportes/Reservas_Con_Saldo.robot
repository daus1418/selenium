*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/a/i
${Ciudad_Destino}    Adz


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[12]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar reporte de reservas con saldo
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaLlegadaIni"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaLlegadaFin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Input Text    xpath=//*[@id="ciudadDestinoLabel"]    ${Ciudad_Destino}
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[3]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[3]/ul/li/a
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/button
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[7]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Exportar archivo excel con información de reservas con saldo
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[7]/button[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser

