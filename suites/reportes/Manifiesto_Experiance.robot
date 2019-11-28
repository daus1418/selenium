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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[13]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar manifiesto experience
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaIni"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaFin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[2]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[2]/div/div[1]/table/tbody/tr[2]/td[7]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[3]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[3]/div/div/ul/li[1]/a/span[2]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Generar excel
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/button[2]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
