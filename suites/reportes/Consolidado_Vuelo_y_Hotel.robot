*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/a/i
${Ciudad_Origen}    Bog
${Ciudad_Destino}    Adz

*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Disponibilidad\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse61"]/div/ul/li[3]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Ver consolidado vuelo y hotel
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaDesdeConsolidado"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaHastaConsolidado"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Input Text    xpath=//*[@id="ciudadOrigenLabel"]    ${Ciudad_Origen}
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/ul/li/a
    Input Text    xpath=//*[@id="ciudadDestinoLabel"]    ${Ciudad_Destino}
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/ul/li/a
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Exportar documento excel con el consolidado de aereo
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button[2]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser