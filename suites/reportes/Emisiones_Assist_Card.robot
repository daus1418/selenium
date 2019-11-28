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
    Click Element    xpath=//a[contains(.," Emisiones de Pasajeros\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse240"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar reporte de emisiones de pasajeros
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaInicial"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[2]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[2]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaFinal"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[3]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[3]/div/div[1]/table/tbody/tr[2]/td[7]
    Click Button    xpath=//*[@id="btnConsultar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Emitir pasajeros
    Sleep    1s
    Click Button    xpath=//*[@id="btnGenerarArchivo"]
    Wait Until Element Is Visible    (// button [text () = "Aceptar"])[2]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "Aceptar"])[2]
    Wait Until Element Is Visible    (// button [text () = "OK"])[1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"])
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser


