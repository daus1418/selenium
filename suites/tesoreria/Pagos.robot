*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a/i
${Numero_reserva}    1041954
${Identificacion}    1015432573
${Identificacion_vendedor}    1015458103
${Nombre_cliente}    YOLANDA CANO



*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Tesoreria\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse34"]/div/ul/li[1]/a
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
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Registrar pago en efectivo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[11]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/div/div/input    10000
    click Element    xpath=//*[@id="tabTitlePago"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-formasPago-container"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="formasPago"]/option[2]
    click Element    xpath=//*[@id="select2-formasPago-container"]
    Wait Until Element Is Visible    xpath=//*[@id="trbtn"]/td/input    ${Time}
    click Element    xpath=//*[@id="select2-tipoEfect-container"]
    click Element    xpath=//*[@id="tipoEfect"]/option[2]
    click Element    xpath=//*[@id="select2-tipoEfect-container"]
    click Element    xpath=//*[@id="trbtn"]/td/input
    Wait Until Element Is Visible    xpath=//*[@id="btnFinalizaTx"]    ${Time}
    click Button    xpath=//*[@id="btnFinalizaTx"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Time}
    Sleep    1s
    Click Element    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C007.1 Registrar pago por medio de consignacion
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[11]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[5]/td[8]/div/a[2]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/div/div/input    10000
    click Element    xpath=//*[@id="tabTitlePago"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-formasPago-container"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="formasPago"]/option[3]
    click Element    xpath=//*[@id="select2-formasPago-container"]
    Wait Until Element Is Visible    xpath=//*[@id="trbtn"]/td/input    ${Tme_load}
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="bancos"]/option[6]
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="select2-plazas-container"]
    click Element    xpath=//*[@id="plazas"]/option[6]
    click Element    xpath=//*[@id="select2-plazas-container"]
    ${N_Cuenta}   Generate random string    8    123456789
    ${N_Complemento}   Generate random string    1    123456789
    Input Text    xpath=//*[@id="trCuenta"]/td[2]/div/input    ${N_Cuenta}${N_Complemento}
    ${Codigo}   Generate random string    8    123456789
    ${C_Complemento}   Generate random string    1    123456789
    Input Text    xpath=//*[@id="codigo"]    ${Codigo}${C_Complemento}
    click Element    xpath=//*[@id="select2-tiposConsignacion-container"]
    click Element    xpath=//*[@id="tiposConsignacion"]/option[2]
    click Element    xpath=//*[@id="select2-tiposConsignacion-container"]
    click Element    xpath=//*[@id="trbtn"]/td/input
    Wait Until Element Is Visible    xpath=//*[@id="btnFinalizaTx"]    ${Tme_load}
    Click Button    xpath=//*[@id="btnFinalizaTx"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007.2 Registrar pago por medio de cheque
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[10]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/div/div/input    10000
    click Element    xpath=//*[@id="tabTitlePago"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-formasPago-container"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="formasPago"]/option[4]
    click Element    xpath=//*[@id="select2-formasPago-container"]
    Wait Until Element Is Visible    xpath=//*[@id="trbtn"]/td/input    ${Time}
    Click Element    xpath=//*[@id="select2-bancos-container"]
    Click Element    xpath=//*[@id="bancos"]/option[15]
    Click Element    xpath=//*[@id="select2-bancos-container"]
    Click Element    xpath=//*[@id="select2-plazas-container"]
    Click Element    xpath=//*[@id="plazas"]/option[6]
    Click Element    xpath=//*[@id="select2-plazas-container"]
    ${N_cuenta}   Generate random string    4    123456789
    Input Text    xpath=//*[@id="trCuenta"]/td[2]/div/input    ${N_cuenta} ${N_cuenta} ${N_cuenta} ${N_cuenta} ${N_cuenta}
    ${Codigo}   Generate random string    4    123456789
    Input Text    xpath=//*[@id="codigo"]    ${Codigo}
    Click Element    xpath=//*[@id="trbtn"]/td/input
    Click Button    xpath=//*[@id="btnFinalizaTx"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Time}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    

C007.3 Registrar pago por medio de Tarjeta de credito
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[27]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/div/div/input    10000
    click Element    xpath=//*[@id="tabTitlePago"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-formasPago-container"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="formasPago"]/option[5]
    click Element    xpath=//*[@id="select2-formasPago-container"]
    Wait Until Element Is Visible    xpath=//*[@id="trbtn"]/td/input    ${Tme_load}
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="bancos"]/option[5]
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="select2-franquicias-container"]
    click Element    xpath=//*[@id="franquicias"]/option[8]
    click Element    xpath=//*[@id="select2-franquicias-container"]
    ${N_Aprobacion}   Generate random string    2    123456789
    Input Text    xpath=//*[@id="codigo"]    ${N_Aprobacion}
    ${N_Tarjeta}   Generate random string    3    123456789
    ${N_complemento}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="num_tarjeta"]    ${N_Tarjeta}${N_Tarjeta}${N_complemento}
    ${Voucher}   Generate random string    5    123456789
    ${Voucher_complemento}   Generate random string    4    123456789
    Input Text    xpath=//*[@id="voucher"]    ${Voucher}${Voucher_complemento}
    ${Codigo_Unico}   Generate random string    4    123456789
    Input Text    xpath=//*[@id="codigo_unico"]    ${Codigo_Unico}
    click Element    xpath=//*[@id="trbtn"]/td/input 
    Wait Until Element Is Visible    xpath=//*[@id="btnFinalizaTx"]    ${Tme_load}
    Click Button    xpath=//*[@id="btnFinalizaTx"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007.4 Registrar pago por medio de tarjeta debito
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[27]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/div/div/input    10000
    click Element    xpath=//*[@id="tabTitlePago"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-formasPago-container"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="formasPago"]/option[6]
    click Element    xpath=//*[@id="select2-formasPago-container"]
    Wait Until Element Is Visible    xpath=//*[@id="trbtn"]/td/input    ${Tme_load}
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="bancos"]/option[8]
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="select2-franquicias-container"]
    click Element    xpath=//*[@id="franquicias"]/option[11]
    click Element    xpath=//*[@id="select2-franquicias-container"]
    ${N_Aprobacion}   Generate random string    2    123456789
    Input Text    xpath=//*[@id="codigo"]    ${N_Aprobacion}
    ${N_Tarjeta}   Generate random string    3    123456789
    ${N_Complemento}   Generate random string    1    123456789
    Input Text    xpath=//*[@id="num_tarjeta"]    ${N_Tarjeta}${N_Complemento}${N_Tarjeta}
    ${N_Voucher}   Generate random string    6    123456789
    Input Text    xpath=//*[@id="voucher"]    ${N_Voucher}
    ${Codigo}   Generate random string    6    123456789
    Input Text    xpath=//*[@id="codigo_unico"]    ${Codigo}
    click Element    xpath=//*[@id="trbtn"]/td/input
    Wait Until Element Is Visible    xpath=//*[@id="btnFinalizaTx"]    ${Tme_load}
    click Button    xpath=//*[@id="btnFinalizaTx"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007.5 Registrar pago por medio de Transfrencia Bancaria
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[11]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[2]/td[8]/div/a[2]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/div/div/input    10000
    click Element    xpath=//*[@id="tabTitlePago"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-formasPago-container"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="formasPago"]/option[7]
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="bancos"]/option[6]
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="select2-plazas-container"]
    click Element    xpath=//*[@id="plazas"]/option[6]
    click Element    xpath=//*[@id="select2-plazas-container"]
    ${N_Cuenta}   Generate random string    9    123456789
    Input Text    xpath=//*[@id="trCuenta"]/td[2]/div/input    ${N_Cuenta}
    ${Codigo}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="codigo"]    ${Codigo}
    click Element    xpath=//*[@id="trbtn"]/td/input
    Wait Until Element Is Visible    xpath=//*[@id="btnFinalizaTx"]    ${Tme_load}
    Click Button    xpath=//*[@id="btnFinalizaTx"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007.6 Registrar pago por Sodexo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[11]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[5]/td[8]/div/a[2]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/div/div/input    10000
    click Element    xpath=//*[@id="tabTitlePago"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-formasPago-container"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="formasPago"]/option[8]
    click Element    xpath=//*[@id="select2-formasPago-container"]
    ${Codigo_sodexo}   Generate random string    9    123456789
    Input Text    xpath=//*[@id="codigo_sodexo"]    ${Codigo_sodexo}
    Click Element    xpath=//*[@id="trbtn"]/td/input
    Wait Until Element Is Visible    xpath=//*[@id="btnFinalizaTx"]    ${Tme_load}
    Click Button    xpath=//*[@id="btnFinalizaTx"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C007.7 Registrar pago por puntos baloto
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[11]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[5]/td[8]/div/a[2]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/div/div/input    10000
    click Element    xpath=//*[@id="tabTitlePago"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-formasPago-container"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-formasPago-container"]
    click Element    xpath=//*[@id="formasPago"]/option[9]
    click Element    xpath=//*[@id="select2-formasPago-container"]
    Wait Until Element Is Visible    xpath=//*[@id="trbtn"]/td/input    ${Tme_load}
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="bancos"]/option[6]
    click Element    xpath=//*[@id="select2-bancos-container"]
    click Element    xpath=//*[@id="select2-plazas-container"]
    click Element    xpath=//*[@id="plazas"]/option[6]
    click Element    xpath=//*[@id="select2-plazas-container"]
    ${N_Cuenta}   Generate random string    8    123456789
    ${N_Complemento}   Generate random string    1    123456789
    Input Text    xpath=//*[@id="trCuenta"]/td[2]/div/input    ${N_Cuenta}${N_Complemento}
    ${Codigo}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="codigo"]    ${Codigo}
    click Element    xpath=//*[@id="select2-tiposConsignacion-container"]
    click Element    xpath=//*[@id="tiposConsignacion"]/option[2]
    click Element    xpath=//*[@id="select2-tiposConsignacion-container"]
    click Element    xpath=//*[@id="trbtn"]/td/input
    Wait Until Element Is Visible    xpath=//*[@id="btnFinalizaTx"]    ${Tme_load}
    Click Button    xpath=//*[@id="btnFinalizaTx"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser





