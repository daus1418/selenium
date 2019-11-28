*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i
${Numero_reserva}    1041921
${Identificacion}    51851280
${Identificacion_de_cliente}    1110507056
${Identificacion_vendedor}    1022332758
${Nombre_cliente}    DIEGO FERNANDO MARTINEZ
${Identificacion_cliente}    52832866
${nuevo_Vendedor}    1015458103
${Valor_Penalidad}    20000


*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Reservas\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse32"]/div/ul/li[10]/a
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
    Page Should Contain    	${Identificacion}

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

C008 Generar PQR
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="identifica_titular_flt"]    ${Identificacion_de_cliente}
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="tblDatos"]/tbody/tr[2]/td[6]/a/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="fecha_incidencia"]
    click Element    xpath=//*[@id="TblReservasComentarios2-form"]/div/div[1]/div[2]/div[1]/div/div/div[1]/table/tbody/tr[2]/td[1]
    click Element    xpath=//*[@id="select2-TblReservasComentarios_id_dominio_compania-container"]
    click Element    xpath=//*[@id="TblReservasComentarios_id_dominio_compania"]/option[3]
    click Element    xpath=//*[@id="select2-TblReservasComentarios_id_dominio_compania-container"]
    click Element    xpath=//*[@id="select2-TblReservasComentarios_id_dominio_tipo_medio_pqr-container"]
    click Element    xpath=//*[@id="TblReservasComentarios_id_dominio_tipo_medio_pqr"]/option[2]
    click Element    xpath=//*[@id="select2-TblReservasComentarios_id_dominio_tipo_medio_pqr-container"]
    click Element    xpath=//*[@id="select2-clasificacion-container"]
    click Element    xpath=//*[@id="clasificacion"]/option[2]
    Click Element    xpath=//*[@id="select2-clasificacion-container"]
                           
    Click Element    xpath=//*[@id="select2-area-container"]
    Click Element    xpath=//*[@id="area"]/option[2]
    Click Element    xpath=//*[@id="select2-area-container"]
    
    click Element    xpath=//*[@id="select2-proceso-container"]
    click Element    xpath=//*[@id="proceso"]/option[2]
    click Element    xpath=//*[@id="select2-proceso-container"]
    click Element    xpath=//*[@id="TblReservasComentarios2-form"]/div/div[1]/div[4]/div[4]/div/button
    click Element    xpath=//*[@id="ui-multiselect-detalle-option-0"]
    click Element    xpath=//*[@id="select2-TblReservasComentarios_analista-container"]
    click Element    xpath=//*[@id="TblReservasComentarios_analista"]/option[2]
    click Element    xpath=//*[@id="select2-TblReservasComentarios_analista-container"]
    click Element    xpath=//*[@id="select2-nivel_gravedad-container"]
    click Element    xpath=//*[@id="nivel_gravedad"]/option[3]
    click Element    xpath=//*[@id="select2-nivel_gravedad-container"]
    ${Complemento}   Generate random string    4    123456789
    Input Text    xpath=//*[@id="TblReservasComentarios_comentario"]    creacion de pqr pruebas automaticas ${Complemento}
    Click Button    xpath=//*[@id="btn_guardar_pqr"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Click Button    (// button [text () = "OK"]) [1]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser


