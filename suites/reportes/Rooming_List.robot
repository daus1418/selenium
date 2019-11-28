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
    Click Element    xpath=//*[@id="collapse79"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C001 Consultar rooming list
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaLlegadaPaxIni"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaLlegadaPaxFin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[1]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/button/div
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/div/div/ul/li[1]/a/span[2]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Exportar documento excel con la información del room list
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser




