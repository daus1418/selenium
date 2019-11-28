*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a[1]/i
${Tercero}    1110507056
${Vendedor}    1022333363
${ciudad_origen}    Bog
${ciudad_destino}    Adz
${correo}    Prueba@gmail.com
${Dias_Vuelo_Plan_Completo}    19
${Dias_Vuelo_Plan_Solo_Vuelo}    19
${Numero_producto_flexi}    5
${Vendedor_Continental}    1016045089


*** Keywords ***            
Actualizar tercero 
    click Button    (// button [text () = "OK"]) [1]
    Sleep    1s
    ${Complemento}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="TblTercerosReservasUpdate-model"]/div/div/div[6]/div[2]/div/div[1]/div[1]/div[1]/span/span[1]/span
    Sleep    1s
    Input text    xpath=/html/body/span/span/span[1]/input    CALLE
    Click Element    //*[@id="select2-direccion1-results"]
    Click Element    xpath=//*[@id="TblTercerosReservasUpdate-model"]/div/div/div[6]/div[2]/div/div[1]/div[1]/div[2]
    Sleep    1s
    Input text    xpath=//form[@id="TblTercerosReservasUpdate-model"]//input[@name="direccion2"]    ${Complemento}
    Input text    xpath=//form[@id="TblTercerosReservasUpdate-model"]//input[@name="direccion4"]    ${Complemento}
    Input text    xpath=//form[@id="TblTercerosReservasUpdate-model"]//input[@name="direccion5"]    ${Complemento}
    ${Celular}   Generate random string    10    123456789
    Input Text    xpath=//*[@id="act_movil_cliente"]    ${Celular}
    ${Telefono}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="act_tel1_cliente"]    ${Telefono}
    Input Text    xpath=//*[@id="act_email_cliente"]    ${correo}
    click Button    xpath=//*[@id="TblTercerosReservasUpdate-model"]/div/div/div[7]/div/button

Cotizar 
    Sleep    1s
    Click Button    (// button [text () = "Click aqui si desea COTIZAR esta reserva"])
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="success-note"]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="btnCloseModal"]    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="btnCloseModal"]

Comprar 
    Sleep    1s
    click Element    xpath=//*[@id="success-note"]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="btnCloseModal"]    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="btnCloseModal"]

Pajeros ya asignados
    Click Button    (// button [text () = "OK"]) [1]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

Registrar Pajeros
    Wait Until Element Is Visible    xpath=//*[@id="form-pasajeros"]/div[1]/div/div[1]
    Input Text    xpath=//*[@id="identificaPax"]    1016029945
    Wait Until Element Is Visible    xpath=//*[@id="divNumDocumento"]/div/ul/li[1]    ${Tme_load}
    Click Element    xpath=//*[@id="divNumDocumento"]/div/ul/li[1]
    Click Element    xpath=//*[@id="select2-servicioPaxSelect-container"]
    Click Element    xpath=//*[@id="servicioPaxSelect"]/option[2]
    Click Element    xpath=//*[@id="select2-servicioPaxSelect-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="agregarPax"]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    1s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Visible    //*[@id="MyBsModal"]/div/div/div[1]/button/span    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span


*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Reservas\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse32"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar una nueva Reserva Plan Completo 
    Wait Until Element Is Visible    xpath=//*[@id="add"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_cli"]    ${Tercero}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a
    Sleep    1s
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"]) [1]
    Run Keyword if    '${status}' == 'PASS'    Actualizar tercero 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_ven"]    ${Vendedor}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a
    Input Text    xpath=//*[@id="idContrato"]    BG123
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    click Element    xpath=//*[@id="ui-multiselect-id_dominio_conoce-option-0"]
    
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button/div
    Input Text    xpath=//*[@id="ciudad_venta"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a
    Input Text    xpath=//*[@id="ciudad_origen"]    ${ciudad_origen}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    Input Text    xpath=//*[@id="ciudad_destino"]    ${ciudad_destino}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a
    click Element    xpath=//*[@id="select2-numHabitaciones-container"]
    click Element    xpath=//*[@id="numHabitaciones"]/option[2]
    click Element    xpath=//*[@id="select2-numHabitaciones-container"]
    Wait Until Element Is Visible    xpath=//*[@id="contentHab"]/div[1]/strong/font    ${Tme_load}
    click Element    xpath=//*[@id="fechaIn"]
    Wait Until Element Is Not Visible    xpath=//*[@id="searchV"]    ${Tme_load}
    Sleep    2s
    click Element    //a[contains(text(),'${Dias_Vuelo_Plan_Completo}')]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Button    xpath=//*[@id="buscarPro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

    Sleep    1s
    Click Button    xpath=//*[@id="resultadosPro"]/div[1]/div/button
    Wait Until Element Is Visible    xpath=//*[@id="detalleProductoModal"]/div/div/div[1]/h4     ${Extra_Time}
    Sleep    1s
    click Element    xpath=//*[@id="vuelosProductoShow"]/div/label/input
    Wait Until Element Is Visible    xpath=//*[@id="clase_1"]
    Input Text    xpath=//*[@id="clase_1"]    1
    click Element    xpath=//*[@id="tabHotel"]/a
    Wait Until Element Is Visible    xpath=//*[@id="select2-hotelOptions-container"]
    Sleep    1s
    click Element    xpath=//*[@id="select2-hotelOptions-container"]
    click Element    xpath=//*[@id="hotelOptions"]/option[2]
    click Element    xpath=//*[@id="select2-hotelOptions-container"]
    Wait Until Element Is Visible    xpath=//*[@id="contentCheck2"]/div/div/div[2]/div[2]/input    ${Time}
    Input Text    xpath=//*[@id="contentCheck2"]/div/div/div[2]/div[2]/input    1
    click Element    xpath=//*[@id="tabServicios"]/a
    Wait Until Element Is Visible    xpath=//*[@id="detalleServ"]/tbody/tr[1]/th[1]    ${Time}
    click Button    xpath=//*[@id="btnAgregarProductoCarro"]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="tabPlanCompletoPrincipal"]/a
    click Button    xpath=//*[@id="tablaDatosBasicos"]/div[26]/button
    click Button    xpath=//*[@id="btnPrimarySetClienteFalse"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "Click aqui si desea COTIZAR esta reserva"])
    Run Keyword if    '${status}' == 'PASS'    Cotizar    ELSE  Comprar


C001.1 Agregar una nueva Reserva Alojamiento
    Wait Until Element Is Visible    xpath=//*[@id="add"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_cli"]    ${Tercero}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_ven"]    ${Vendedor}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a
    Input Text    xpath=//*[@id="idContrato"]    BG123

    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    click Element    xpath=//*[@id="ui-multiselect-id_dominio_conoce-option-0"]
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    Input Text    xpath=//*[@id="ciudad_venta"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a

    click Element    xpath=//*[@id="tabAlojamientoPrincipal"]/a
    Input Text    xpath=//*[@id="ciudad_origen"]    ${ciudad_origen}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    Input Text    xpath=//*[@id="ciudad_destino"]    ${ciudad_destino}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a
    click Element    xpath=//*[@id="select2-numHabitaciones-container"]
    click Element    xpath=//*[@id="numHabitaciones"]/option[3]
    click Element    xpath=//*[@id="select2-numHabitaciones-container"]
    click Element    xpath=//*[@id="select2-adl1-container"]
    click Element    xpath=//*[@id="adl1"]/option[2]
    click Element    xpath=//*[@id="select2-adl1-container"]
    click Element    xpath=//*[@id="select2-adl2-container"]
    click Element    xpath=//*[@id="adl2"]/option[2]
    click Element    xpath=//*[@id="select2-adl2-container"]
    click Element    xpath=//*[@id="fechaInHotel"]
    click Element    xpath=//*[@id="trFechasHotel"]/div[1]/div/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="trFechasHotel"]/div[1]/div/div/div[1]/table/tbody/tr[2]/td[1]
    click Element    xpath=//*[@id="fechaOutHotel"]
    click Element    xpath=//*[@id="tdFechaOutHotel"]/div/div/div[1]/table/tbody/tr[2]/td[7]
    Click Button    xpath=//*[@id="buscarPro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Extra_Time}
    Click Element   xpath=//*[@id="resultadosPro"]/div[1]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element   xpath=//*[@id="select2-hotelOptions-container"]
    Click Element   xpath=//*[@id="hotelOptions"]/option[2]
    Click Element   xpath=//*[@id="select2-hotelOptions-container"]
    Input Text    xpath=//*[@id="contentCheck2"]/div/div/div[2]/div[2]/input    2
    Input Text    xpath=//*[@id="contentCheck2"]/div/div/div[3]/div[2]/input    2
    Click Element   xpath=//*[@id="tabServicios"]/a
    Sleep    1s
    Click Button    xpath=//*[@id="btnAgregarProductoCarro"]
    Sleep    1s
    Click Button    xpath=//*[@id="tablaDatosBasicos"]/div[26]/button
    Click Button    xpath=//*[@id="btnPrimarySetClienteFalse"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "Click aqui si desea COTIZAR esta reserva"])
    Run Keyword if    '${status}' == 'PASS'    Cotizar    ELSE  Comprar
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001.2 Agregar una nueva Reserva Vuelos
    Wait Until Element Is Visible    xpath=//*[@id="add"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_cli"]    ${Tercero}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a
    Sleep    1s
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"]) [1]
    Run Keyword if    '${status}' == 'PASS'    Actualizar tercero  
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_ven"]    ${Vendedor}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a
    Input Text    xpath=//*[@id="idContrato"]    BG123

    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    click Element    xpath=//*[@id="ui-multiselect-id_dominio_conoce-option-0"]
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    Input Text    xpath=//*[@id="ciudad_venta"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a

    click Element    xpath=//*[@id="tabVuelosPrincipal"]/a
    Input Text    xpath=//*[@id="ciudad_origen"]    ${ciudad_origen}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    Input Text    xpath=//*[@id="ciudad_destino"]    ${ciudad_destino}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a
    Input Text    xpath=//*[@id="inpCantPaxVuelo"]    2
    click Element    xpath=//*[@id="fechaIn"]
    Wait Until Element Is Not Visible    xpath=//*[@id="searchV"]    ${Tme_load}
    Sleep    3s
    click Element    //a[contains(text(),'${Dias_Vuelo_Plan_Solo_Vuelo}')]
    Sleep    1s
    Click Button    xpath=//*[@id="buscarPro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Button    xpath=//*[@id="resultadosPro"]/div[1]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="vuelosProductoShow"]/div/label/input    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="vuelosProductoShow"]/div/label/input
    Wait Until Element Is Visible    xpath=//*[@id="clase_1"]    ${Tme_load}
    Input Text    xpath=//*[@id="clase_1"]    2
    click Element    xpath=//*[@id="tabServicios"]/a
    Wait Until Element Is Visible    xpath=//*[@id="btnAgregarProductoCarro"]    ${Tme_load}
    Click Button    xpath=//*[@id="btnAgregarProductoCarro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[26]/button
    Click Button    xpath=//*[@id="btnPrimarySetClienteFalse"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "Click aqui si desea COTIZAR esta reserva"])
    Run Keyword if    '${status}' == 'PASS'    Cotizar    ELSE  Comprar

C001.3 Agregar una nueva reserva solo Servicios
    Wait Until Element Is Visible    xpath=//*[@id="add"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_cli"]    ${Tercero}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a
    Sleep    1s
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"]) [1]
    Run Keyword if    '${status}' == 'PASS'    Actualizar tercero  
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_ven"]    ${Vendedor}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a
    Input Text    xpath=//*[@id="idContrato"]    BG123

    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    click Element    xpath=//*[@id="ui-multiselect-id_dominio_conoce-option-0"]
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    Input Text    xpath=//*[@id="ciudad_venta"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a

    click Element    xpath=//*[@id="tabServiciosPrincipal"]/a
    Input Text    xpath=//*[@id="ciudad_origen"]    ${ciudad_origen}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    Input Text    xpath=//*[@id="ciudad_destino"]    ${ciudad_destino}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a

    click Element    xpath=//*[@id="fechaInHotel"]
    click Element    xpath=//*[@id="trFechasHotel"]/div[1]/div/div/div[1]/table/thead/tr[1]/th[3]
    click Element    xpath=//*[@id="trFechasHotel"]/div[1]/div/div/div[1]/table/tbody/tr[2]/td[1]
    click Element    xpath=//*[@id="buscarPro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="resultadosPro"]/div[1]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="servicio60"]    2
    Input Text    xpath=//*[@id="servicio2123"]    2
    click Element    xpath=//*[@id="btnAgregarProductoCarro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[26]/button
    click Button    xpath=//*[@id="btnPrimarySetClienteFalse"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "Click aqui si desea COTIZAR esta reserva"])
    Run Keyword if    '${status}' == 'PASS'    Cotizar    ELSE  Comprar

C001.4 Agregar una nueva reserva Servicios Flexi
    Wait Until Element Is Visible    xpath=//*[@id="add"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_cli"]    ${Tercero}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a
    Sleep    1s
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"]) [1]
    Run Keyword if    '${status}' == 'PASS'    Actualizar tercero  
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_ven"]    ${Vendedor}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a
    Input Text    xpath=//*[@id="idContrato"]    BG123

    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    click Element    xpath=//*[@id="ui-multiselect-id_dominio_conoce-option-0"]
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    Input Text    xpath=//*[@id="ciudad_venta"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a

    click Element    xpath=//*[@id="tabServiciosPrincipal"]/a
    Input Text    xpath=//*[@id="ciudad_origen"]    ${ciudad_origen}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    Input Text    xpath=//*[@id="ciudad_destino"]    ${ciudad_destino}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a

    click Element    xpath=//*[@id="fechaInHotel"]
    click Element    xpath=//*[@id="trFechasHotel"]/div[1]/div/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="trFechasHotel"]/div[1]/div/div/div[1]/table/tbody/tr[3]/td[1]
    Click Button    xpath=//*[@id="buscarPro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

    click Button    xpath=//*[@id="resultadosPro"]/div[${Numero_producto_flexi}]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="servicio653"]    1
    click Button    xpath=//*[@id="btnAgregarProductoCarro"]
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[26]/button
    click Button    xpath=//*[@id="btnPrimarySetClienteFalse"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="success-note"]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="btnCloseModal"]    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="btnCloseModal"]

C001.5 Agregar una nueva reserva Servicios Membresia
    Wait Until Element Is Visible    xpath=//*[@id="add"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_cli"]    ${Tercero}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[6]/div[1]/ul/li[1]/a
    Sleep    1s
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"]) [1]
    Run Keyword if    '${status}' == 'PASS'    Actualizar tercero  
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_ven"]    ${Vendedor_Continental}
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[8]/div[1]/ul/li/a
    Input Text    xpath=//*[@id="idContrato"]    BG123

    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    click Element    xpath=//*[@id="ui-multiselect-id_dominio_conoce-option-0"]
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[19]/div/button
    Input Text    xpath=//*[@id="ciudad_venta"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[20]/div/ul/li[1]/a

    click Element    xpath=//*[@id="tabServiciosPrincipal"]/a
    Input Text    xpath=//*[@id="ciudad_origen"]    ${ciudad_origen}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    Input Text    xpath=//*[@id="ciudad_destino"]    ${ciudad_origen}
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a
    click Element    xpath=//*[@id="trFiltroCiudades"]/div[2]/div/ul/li/a

    click Element    xpath=//*[@id="fechaInHotel"]
    click Element    xpath=//*[@id="trFechasHotel"]/div[1]/div/div/div[1]/table/thead/tr[1]/th[3]
    click Element    xpath=//*[@id="trFechasHotel"]/div[1]/div/div/div[1]/table/tbody/tr[3]/td[1]
    Click Button     xpath=//*[@id="buscarPro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

    Click Button     xpath=//*[@id="resultadosPro"]/div[1]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="servicio1577"]    1

    click Element    xpath=//*[@id="tabUsuarios"]/a
    Sleep    1s
    Input Text    xpath=//*[@id="doc_liner"]     110587109
    Wait Until Element Is Visible    xpath=//*[@id="contentUsuarios"]/div/div[3]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="contentUsuarios"]/div/div[3]/ul/li/a
    Input Text    xpath=//*[@id="doc_closer"]    1010240328
    Wait Until Element Is Visible    xpath=//*[@id="contentUsuarios"]/div/div[7]/ul/li    ${Tme_load}
    click Element    xpath=//*[@id="contentUsuarios"]/div/div[7]/ul/li

    click Element    xpath=//*[@id="tabInfoAdicional"]/a
    Sleep    1s
    click Element    xpath=//*[@id="fecha_inicio_pago_cuota_inicial"]
    click Element    xpath=//*[@id="div_fecha_inicio_pago_cuota_inicial"]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="div_fecha_inicio_pago_cuota_inicial"]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="div_fecha_inicio_pago_cuota_inicial"]/div/div[1]/table/tbody/tr[3]/td[1]
    click Element    xpath=//*[@id="fecha_inicio_pago_saldo"]
    click Element    xpath=//*[@id="financiacion"]/div/div[2]/div[13]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="financiacion"]/div/div[2]/div[13]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="financiacion"]/div/div[2]/div[13]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="financiacion"]/div/div[2]/div[13]/div/div[1]/table/tbody/tr[3]/td[1]

    click Element    xpath=//*[@id="tabServicios"]/a
    Sleep    1s
    Click Button     xpath=//*[@id="btnAgregarProductoCarro"]
    Sleep    1s
    click Element    xpath=//*[@id="tablaDatosBasicos"]/div[26]/button
    Sleep    1s
    click Button    xpath=//*[@id="btnPrimarySetClienteFalse"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="success-note"]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="btnCloseModal"]    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="btnCloseModal"]

C003 Filtrar búsqueda por medio del estado
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Element    xpath=//*[@id="estado_flt"]/option[10]
    Click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Confirmada

C004 Filtrar búsqueda por numero de reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="id_reserva_flt"]    1006669
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1006669

C005 Filtrar búsqueda por identificación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="identifica_titular_flt"]    1144127494
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1144127494

C006 Filtar busqueda por identificación del vendedor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="identifica_vendedor_flt"]    1022332758
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Filtar busqueda por el nombre del cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="nombre_cliente"]    KATHERIN BARON
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	KATHERIN BARON

C008 Filtrar busqueda por el correo electronico del cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="correo_cliente"]    A.DIAZ2303@GMAIL.COM
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Filtrar busqueda por el numero del telefono del cliente 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="telefono_cliente"]    3104813883
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C010 Visualizar los detalles de la reserva
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
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C011 Registrar pasajeros
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Click Element    xpath=//*[@id="select2-productosPax-container"]
    Click Element    xpath=//*[@id="productosPax"]/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Button    xpath=//*[@id="btnAddPax"]
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"]) [1]
    Run Keyword if    '${status}' == 'PASS'    Pajeros ya asignados    ELSE  Registrar Pajeros

C012 Visualizar los detalles de los pagos
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="reservasPagos"]/tbody/tr[2]/td[14]/center/p[3]/input
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C013 Registrar el pagador de la reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[4]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="nombre_pagador"]    Pruebas Automaticas
    ${Telefono}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="telefono_pagador"]    ${Telefono}
    Input Text    xpath=//*[@id="email_pagador"]    ${correo}
    Click Button    xpath=//*[@id="btnSaveComprador"]
    Wait Until Element Is Visible    xpath=//*[@id="div_mensaje"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C014 Enviar email al cliente
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    2s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[5]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="asuntoEmail"]    Envio Email de pruebas automaticas
    Click Button    xpath=//*[@id="enviarEmail"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}
    Sleep    2s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C015 Editar reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[11]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[7]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="ciudad_origen"]    ${ciudad_origen}
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="trFiltroCiudades"]/div[1]/div/ul/li/a
    Click Button    xpath=//*[@id="buscarPro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Button    xpath=//*[@id="resultadosPro"]/div[1]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="servicio2123"]    2
    Click Button    xpath=//*[@id="btnAgregarProductoCarro"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Button    xpath=//*[@id="tablaDatosBasicos"]/div[23]/button
    click Button    xpath=//*[@id="extraButEdit"]/button[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="btnCloseModal"]    ${Tme_load}
    click Button    xpath=//*[@id="btnCloseModal"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C016 Enviar contrato al cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    click Element    xpath=//*[@id="estado_flt"]/option[11]
    click Element    xpath=//*[@id="select2-estado_flt-container"]
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[8]/i
    Wait Until Element Is Visible    xpath=//*[@id="DivBotonEviar"]/button    ${Tme_load}
    Click Button    xpath=//*[@id="DivBotonEviar"]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]    ${Tme_load}  
    Sleep    2s
    Click Button    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C017 Administracion de comentarios 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div[2]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[2]/a
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="select2-TblReservasComentarios_id_dominio_tipo_comentario-container"]
    Sleep    1s
    click Element    xpath=//*[@id="TblReservasComentarios_id_dominio_tipo_comentario"]/option[2]
    click Element    xpath=//*[@id="select2-TblReservasComentarios_id_dominio_tipo_comentario-container"]
    ${Complemento}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblReservasComentarios_comentario"]    Generacion de comentarios pruebas automaticas ${Complemento}
    Click Button    xpath=//*[@id="TblReservasComentarios2-form"]/div[5]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=(// button [text () = "OK"]) [1]    ${Tme_load}
    click button    (// button [text () = "OK"]) [1]
    Sleep    1ss
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 
    Close Browser



    

    


    

    

    





    

