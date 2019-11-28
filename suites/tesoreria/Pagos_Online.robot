*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i
${Referencia_Pago}    1567432739846
${Transaccion}    1130562172

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Tesoreria\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse34"]/div/ul/li[7]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Filtrar búsqueda por Id Transaccion Online
    Sleep    1s
    Input Text    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/thead/tr[2]/td[2]/input    502609
    Click Element    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    502609

C002 Filtrar búsqueda por referencia de pago
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/thead/tr[2]/td[3]/input    ${Referencia_Pago}
    Click Element    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    ${Referencia_Pago}

C003 Filtrar búsqueda por transacción
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/thead/tr[2]/td[4]/input    ${Transaccion}
    Click Element    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    ${Transaccion}

C004 Filtrar búsqueda por respuesta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C005 Visualizar los detalles del pago
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblTransaccionesOnline-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser