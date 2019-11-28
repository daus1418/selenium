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
    Click Element    xpath=//*[@id="collapse79"]/div/ul/li[7]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar reporte ocupacion hotelera
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="desde"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="hasta"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="select2-comboHotelPax-container"]
    Click Element    xpath=//*[@id="comboHotelPax"]/option[2]
    Click Element    xpath=//*[@id="tipo"]
    Click Button    xpath=//*[@id="buscar"]
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=//*[@id="fakeLoader"]/div/div    ${Tme_load}
    Close Browser