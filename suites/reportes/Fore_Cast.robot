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
    Click Element    xpath=//*[@id="collapse79"]/div/ul/li[6]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Descargar Fore Cast
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-anho-container"]
    Click Element    xpath=//*[@id="anho"]/optgroup/option[3]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[2]/button
    Click Element    xpath=//*[@id="ui-multiselect-mes-option-5"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/button
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[4]/div/div/ul/li[1]/a/span[2]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button
    Click Element    xpath=//*[@id="ui-multiselect-combo_estado-option-2"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div/div/div[2]/div/div[5]/button
    Click Button    xpath=//*[@id="Buscar"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    xpath=(// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
