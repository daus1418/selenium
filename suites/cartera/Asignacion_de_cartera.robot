*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/a/i
${Codigo}    1042040
${Vendedor}    JESSICA
${Cliente}    YONATHAN



*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Cartera\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse56"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Asignar cartera
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-carteraH-container"]
    Click Element    xpath=//*[@id="carteraH"]/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="estadosRA"]/option[1]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="estadosRA"]/option[1]
    Sleep    1s
    Click Element    xpath=//*[@id="agentesC"]/option[1]
    Click Button    xpath=//*[@id="btnAsignar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
   

C002 Desasignar Cartera
    Sleep    1s
    Click Element    xpath=//*[@id="collapse56"]/div/ul/li[3]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse56"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="tabDesasignarCartera"]/a
    Wait Until Element Is Visible    xpath=//*[@id="btnDesasignar"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-canalCartera-container"]
    click Element    xpath=//*[@id="canalCartera"]/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="desasignarCartera"]/fieldset/fieldset/div/div/div[3]/div[2]/div[6]/span/span[1]/span
    click Element    xpath=//*[@id="estadosRD"]/option[2]
    click Element    xpath=//*[@id="desasignarCartera"]/fieldset/fieldset/div/div/div[3]/div[2]/div[6]/span/span[1]/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="btnDesasignar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser

    
    
    



