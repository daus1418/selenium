*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[18]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Exportar excel con columnas adicionales en reporte de ventas
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaInicialVentas"]
    Click Element    xpath=//*[@id="tabReporteVentasGenerico"]/div[2]/div/div[2]/div[1]/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="tabReporteVentasGenerico"]/div[2]/div/div[2]/div[1]/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaFinalVentas"]
    Click Element    xpath=//*[@id="tabReporteVentasGenerico"]/div[2]/div/div[2]/div[1]/div[2]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="tabReporteVentasGenerico"]/div[2]/div/div[2]/div[1]/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Button    xpath=//*[@id="tabReporteVentasGenerico"]/div[2]/div/div[2]/div[2]/div/button[1]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Extra_Time}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Generar grafico de reporte de ventas
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="contentFiltro"]/div[1]/ul/li[2]/a
    Wait Until Element Is Visible    xpath=//*[@id="btnGraphsRefresh"]    ${Tme_load}
    Click Element    xpath=//*[@id="formGraphs"]/div[1]/div/button
    Click Element    xpath=//*[@id="ui-multiselect-anios-option-0"]
    Click Element    xpath=//*[@id="mes_i"]
    Click Element    xpath=//*[@id="mes_i"]/option[6]
    Click Element    xpath=//*[@id="mes_f"]
    Click Element    xpath=//*[@id="mes_f"]/option[6]
    Click Button    xpath=//*[@id="btnGraphsRefresh"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C003 Descargar reporte de ventas
    Sleep    1s
    Click Button    xpath=//*[@id="btnGraphsDownload"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Close Browser


