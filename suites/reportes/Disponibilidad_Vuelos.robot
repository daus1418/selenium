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
    Click Element    xpath=//*[@id="collapse61"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Ver el consolidado aereo
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="ciudadOrigenLabel"]    ${Ciudad_Origen}
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/ul/li/a
    Input Text    xpath=//*[@id="ciudadDestinoLabel"]    ${Ciudad_Destino}
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/ul/li/a
    Click Element    xpath=//*[@id="fechaSalidaVueloYield"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/div/div[1]/table/tbody/tr[3]/td[3]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-vuelosYield-container"]
    Click Element    xpath=//*[@id="vuelosYield"]/option[2]
    Click Element    xpath=//*[@id="select2-vuelosYield-container"]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[7]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Exportar documento excel con el consolidado de aereo
    Sleep    1s
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[7]/button[2]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
