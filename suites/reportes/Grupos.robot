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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[20]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar reporte de grupos
    Sleep    1s
    Click Element    xpath=//*[@id="fechaInicial"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaFinal"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[2]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/div/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="resultTourConducto"]/tbody/tr[1]/td[9]/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="tabCliente"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="cliente"]/div[2]/h4    ${Tme_load}
    click Element    xpath=//*[@id="tabCambios"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="cambios"]/div/table/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabCambiosTitular"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tcambiostitular"]/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabAuditoriaPasajeros"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tauditoriapasajeros"]/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabComerciales"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C003 Ver reservas relacionadas
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="resultTourConducto"]/tbody/tr[1]/td[9]/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    click Button    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
