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
    Click Element    xpath=//a[contains(.," Disponibilidad\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse61"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Ver el consolidado aereo
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    #Fecha desde
    Click Element    xpath=//*[@id="fechaDesdeConsolidado"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    #Fecha hasta
    Click Element    xpath=//*[@id="fechaHastaConsolidado"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    #Ciudad origen
    Input Text    xpath=//*[@id="ciudadOrigenLabel"]    BOG
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/ul/li/a
    #Ciudad destino
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/button/div
    #Canal
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Click Element    xpath=//*[@id="id_canal"]/option[17]
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[6]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Descargar consolidado aereo
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[6]/button[2]
    Wait Until Element Is Not Visible    xpath=/html/body/div[24]    ${Tme_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
