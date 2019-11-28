*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/a[1]/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[6]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Ver el movilizado de vuelos
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    #Fecha inicio
    Click Element    xpath=//*[@id="fechaIni"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    #Fecha fin
    Click Element    xpath=//*[@id="fechaFin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[2]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    #Aerolineas
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[3]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[3]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[3]/button/div
    #Tipo de vuelo
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[4]/button/div
    #Origen vuelo
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[5]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[5]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[5]/button/div
    #Destino Vuelo
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[6]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[6]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[6]/button/div
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[7]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Descargar el movilizado de vuelos 
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div[7]/button[2]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser