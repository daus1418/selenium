*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/a/i
${Ciudad_Destino}    Adz


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
    Click Element    xpath=//*[@id="collapse79"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Consultar la disponibilidad hotelera
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fecha_salida_disp_h"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fecha_llegada_pax_disp_h"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[2]/td[6]
    Input Text    xpath=//*[@id="ciudadDestinoLabel"]    ${Ciudad_Destino}
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/ul/li    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/ul/li
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button[1]
    Wait Until Element Is Visible    xpath=//*[@id="divResponse"]/div/div/h3    ${Tme_load}
    Close Browser



