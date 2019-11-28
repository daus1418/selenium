*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Reservas\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse32"]/div/ul/li[8]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Filtrar búsqueda por medio del estado
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[4]/span/span[1]/span
    Click Element    xpath=//*[@id="estado_flt"]/option[10]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[1]/div[4]/span/span[1]/span
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Confirmada

C002 Filtrar búsqueda por numero de reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="id_reserva_flt"]    1006669
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1006669

C003 Filtrar búsqueda por identificación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="identifica_titular_flt"]    1144127494
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1144127494

C004 Filtar busqueda por identificación del vendedor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="identifica_vendedor_flt"]    1022332758
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C005 Filtar busqueda por el nombre del cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="nombre_cliente"]    KATHERIN BARON
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	KATHERIN BARON

C006 Visualizar los detalles del titular
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Actualizar titular
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Sleep    1s
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]
    Wait Until Element Is Not Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${Complemento}   Generate random string    2    123456789
    Sleep    1s
    Input text    xpath=//*[@id="direccion2"]    ${Complemento}
    Input text    xpath=//*[@id="direccion4"]    ${Complemento}
    Input text    xpath=//*[@id="direccion5"]    ${Complemento}
    ${Celular}   Generate random string    10    123456789
    Input Text    xpath=//*[@id="act_movil_cliente"]    ${Celular}
    ${Telefono}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="act_tel1_cliente"]    ${Telefono}
    Click Button    xpath=//*[@id="TblTercerosReservas-model"]/div/div/div[7]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    close browser
