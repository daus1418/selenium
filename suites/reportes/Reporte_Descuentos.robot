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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[7]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Descargar archivo excel con el informe general de reservas
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    #Fecha inicial
    Click Element    xpath=//*[@id="fecha_ini_rec"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    #Fecha Final
    Click Element    xpath=//*[@id="fecha_fin_rec"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    #Sucursal
    Click Element    xpath=//*[@id="select2-sucursal-container"]
    Click Element    xpath=//*[@id="sucursal"]/option[8]
    Click Element    xpath=//*[@id="select2-sucursal-container"]
    #Tipo descuento
    Click Element    xpath=//*[@id="select2-tipo-container"]
    Click Element    xpath=//*[@id="tipo"]/option[17]
    Click Element    xpath=//*[@id="select2-tipo-container"]
    Click Button    xpath=//*[@id="btnExcel"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser



