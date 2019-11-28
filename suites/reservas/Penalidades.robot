*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div[2]/div/div/a/i
${Numero_reserva}    1041921
${Identificacion}    51851280
${Identificacion_vendedor}    1110507056
${Nombre_cliente}    DIEGO FERNANDO MARTINEZ
${Identificacion_cliente}    52832866
${nuevo_Vendedor}    1015458103
${Valor_Penalidad}    20000

*** Keywords ***

Cambiar valor a Penalidad
    Click Button    (// button [text () = "OK"]) [1] 
    Sleep    1s
    Input Text    xpath=//*[@id="tablaPenalidades"]/tbody/tr/td[3]/div/input    ${Valor_Penalidad}
    Input Text    xpath=//*[@id="comentario"]    Penalidad pruebas automaticas
    Click Button    xpath=//*[@id="btnGuardarPenalidadesReservas"]
    Wait Until Element Is Visible    (// button [text () = "Aceptar"]) [2]    ${Tme_load}
    Click Button    (// button [text () = "Aceptar"]) [2]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Click Button    (// button [text () = "OK"]) [1] 

Agregar Penalidad
    Input Text    xpath=//*[@id="tablaPenalidades"]/tbody/tr/td[3]/div/input    ${Valor_Penalidad}
    Input Text    xpath=//*[@id="comentario"]    Penalidad pruebas automaticas
    Click Button    xpath=//*[@id="btnGuardarPenalidadesReservas"]
    Wait Until Element Is Visible    (// button [text () = "Aceptar"]) [2]    ${Tme_load}
    Click Button    (// button [text () = "Aceptar"]) [2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Reservas\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse32"]/div/ul/li[9]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Filtrar búsqueda por medio del estado
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Element    xpath=//*[@id="estado_flt"]/option[10]
    Click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Confirmada

C002 Filtrar búsqueda por numero de reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="id_reserva_flt"]    ${Numero_reserva}
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	${Numero_reserva}

C003 Filtrar búsqueda por identificación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="identifica_titular_flt"]    ${Identificacion}
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C004 Filtar busqueda por identificación del vendedor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="identifica_vendedor_flt"]    ${Identificacion_vendedor}
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C005 Filtar busqueda por el nombre del cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="nombre_cliente"]    ${Nombre_cliente}
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	${Nombre_cliente}

C006 Visualizar los detalles de la reserva
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
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C008 Penalidades
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Element    xpath=//*[@id="estado_flt"]/option[11]
    Click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="select2-selectPenalidades-container"]
    Click Element    xpath=//*[@id="selectPenalidades"]/option[2]
    Click Element    xpath=//*[@id="select2-selectPenalidades-container"]
    Click Button    xpath=//*[@id="penalidadesContenedor"]/div[1]/div[2]/button
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"]) [1]
    Run Keyword if    '${status}' == 'PASS'    Cambiar valor a Penalidad    ELSE  Agregar Penalidad
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser

