*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/a/i
${Fecha_Inicial}    2019-08-05
${Fecha_Final}    2019-08-11


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Emisiones de Pasajeros\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[17]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar reporte de comentarios
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input text    xpath=//*[@id="fechaInicial"]    ${Fecha_Inicial}
    Input text    xpath=//*[@id="fechaFinal"]    ${Fecha_Final}
    Click Element    xpath=//*[@id="buscarReserva"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/div/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Generar excel
    Sleep    1s
    Click Button    xpath=//*[@id="divResponse"]/div[2]/button
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser