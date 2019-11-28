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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[11]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar reporte de reservas entrantes por hotel
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaLegadaIni"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaLegadaFin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/button
    Click Element    xpath=//*[@id="ui-multiselect-comboEstado-option-30"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/div/div/ul/li[1]/a/span[2]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[6]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Element Should Be Visible    (// button [text () = " Exportar excel"])
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser                    