*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div[2]/div/div/a/i
${Numero_reserva}    1042011
${Cedula_Vieja}    1015432573
${Cedula_Nueva}    1110507056



*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Reservas\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse32"]/div/ul/li[11]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Cambiar número de cédula del tercero en una reserva
    Sleep    1s
    Input Text    xpath=//*[@id="reserva"]    ${Numero_reserva}
    Click Button    xpath=//*[@id="buscar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="cedula_nueva"]    ${Cedula_Nueva}
    Click Button    xpath=//*[@id="buscar2"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Click Button    (// button [text () = "OK"]) [1]
    Sleep    1s
    Click Element    xpath=//*[@id="todos"]
    Click Button    xpath=//*[@id="cambiar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Cambiar número de cédula para restablecer cambios
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="reserva"]    ${Numero_reserva}
    Click Button    xpath=//*[@id="buscar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="cedula_nueva"]    ${Cedula_Vieja}
    Click Button    xpath=//*[@id="buscar2"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Click Button    (// button [text () = "OK"]) [1]
    Sleep    1s
    Click Element    xpath=//*[@id="todos"]
    Click Button    xpath=//*[@id="cambiar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser