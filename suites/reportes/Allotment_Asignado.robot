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
    Click Element    xpath=//*[@id="collapse79"]/div/ul/li[5]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Consultar Allotment Asignado
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaInicioRT"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaFinRT"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="select2-id_hotel-container"]
    Click Element    xpath=//*[@id="id_hotel"]/option[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/div/div/ul/li[1]/a/span[2]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Descargar excel con información del allotment
    Sleep    1s
    Click Button    xpath=//*[@id="divResponse"]/button
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    
