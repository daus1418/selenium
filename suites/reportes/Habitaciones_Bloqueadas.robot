*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div[2]/div/div/a/i


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[44]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar reporte de habitaciones bloqueadas
    Sleep    1s
    Click Element    xpath=//*[@id="fecha_inicio"]
    Click Element    xpath=//*[@id="habitacionesBloqueadasForm"]/div/div[2]/div/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="habitacionesBloqueadasForm"]/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fecha_fin"]
    Click Element    xpath=//*[@id="habitacionesBloqueadasForm"]/div/div[2]/div/div[2]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="habitacionesBloqueadasForm"]/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="habitacionesBloqueadasForm"]/div/div[2]/div/div[3]/button
    Click Element    xpath=//*[@id="habitacionesBloqueadasForm"]/div/div[2]/div/div[3]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="select2-estado-container"]
    Click Element    xpath=//*[@id="estado"]/option[2]
    Click Button    xpath=//*[@id="Buscar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Element Should Be Visible    //*[@id="divResponse"]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Descargar archivo Excel con reporte de habitaciones bloqueadas
    Sleep    1s
    Click Button    xpath=//*[@id="divResponse"]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Close Browser



