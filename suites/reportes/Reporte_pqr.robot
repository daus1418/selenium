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
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Descargar archivo excel con el informe general de reservas
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fecha_ini"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/thead/tr[1]/th[1]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Sleep    1s
    Click Element    xpath=//*[@id="fecha_fin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/thead/tr[1]/th[1]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[3]/button[1]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
