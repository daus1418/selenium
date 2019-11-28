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
    Click Element    xpath=//a[contains(.," Cartera\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse56"]/div/ul/li[5]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Buscar Cartera
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="mes_cartera"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr/td/span[6]
    Click Element    xpath=//*[@id="fechaInicio"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fechaFin"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[3]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Button    xpath=//*[@id="btnBusAb"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
