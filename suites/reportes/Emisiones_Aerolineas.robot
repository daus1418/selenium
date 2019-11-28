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
    Click Element    xpath=//*[@id="collapse240"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Generar reporte de emisiones de pasajeros (Aerolíneas)
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fechaVueloInicial"]
    Click Element    xpath=//*[@id="formConsultaEmitidos"]/div/div[1]/div[6]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaVueloFinal"]
    Click Element    xpath=//*[@id="formConsultaEmitidos"]/div/div[1]/div[7]/div/div[1]/table/tbody/tr[2]/td[7]
    Click Button    xpath=//*[@id="btnConsultar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Generar excel
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="btnExcel"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser