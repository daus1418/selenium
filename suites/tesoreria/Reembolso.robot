*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i
${Numero_reserva}    1042041

*** Keywords ***
Registar Reembolso
    Click Element    xpath=//*[@id="divResponse"]/div[1]/div[3]/div/input[1]
    Input Text    xpath=//*[@id="comentTransfer"]    Reembolso pruebas automaticas
    Click Button    xpath=//*[@id="divResponse"]/div[1]/div[5]/button
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]

Terminar proceso
    Click Button    (// button [text () = "OK"]) [1]

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Tesoreria\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse34"]/div/ul/li[10]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Realizar reembolso de una reserva
    Sleep    1s
    Input Text    xpath=//*[@id="reservaOut"]    ${Numero_reserva}
    Click button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/div/button[1]
    Sleep    1s
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"])
    Run Keyword if    '${status}' == 'PASS'    Terminar proceso    ELSE  Registar Reembolso
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    

    

