*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div[2]/div/div/a/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Reservas\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse32"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Filtrar búsqueda por medio del estado
    Sleep    1s
    Click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Element    xpath=//*[@id="estado_flt"]/option[3]
    Click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Cerrada

C002 Filtrar búsqueda por el codigo de la reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="id_reserva_flt"]    1006665
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1006665

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

C006 Filtrar búsqueda por el identificación del cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="identifica_cliente_flt"]    1110507056
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1110507056

C007 Visualizar los detalles de la reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="tabCliente"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="cliente"]/div[2]/h4    ${Tme_load}
    click Element    xpath=//*[@id="tabCambios"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="cambios"]/div/table/thead/tr    ${Tme_load}
    
    click Element    xpath=//*[@id="tabCambiosTitular"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tcambiostitular"]/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabAuditoriaPasajeros"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tauditoriapasajeros"]/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabComerciales"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tr0"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 cambiar estado de reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="boton_automatico"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    click Button    (// button [text () = "OK"]) [1]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    



