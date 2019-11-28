*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div[2]/div/a[1]/i
${Ciudad_Destino}    San andres

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Producto\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse85"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Crear un nuevo Producto adicionales
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${Complemento_producto}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_producto"]    Creacion nuevo producto ${Complemento_producto}
    ${Codigo}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_codigo"]    ${Codigo}
    Click Element    xpath=//*[@id="fecha_desde"]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[3]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[3]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="fecha_hasta"]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[4]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[4]/div/div[1]/table/tbody/tr[4]/td[1]                       
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_tipo_producto-container"]
    Click Element    xpath=//*[@id="TblProductos_id_dominio_tipo_producto"]/option[4]
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_tipo_producto-container"]
    Input Text    xpath=//*[@id="TblProductos_utilidad"]    10
    Input Text    xpath=//*[@id="productoTemporadas"]    baja
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a    ${Tme_load}
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a    ${Tme_load}
    Input Text    xpath=//*[@id="TblProductos_num_pax_aplica"]    1
    Click Element    xpath=//*[@id="select2-TblProductos_id_ciudad_destino-container"]
    Input Text    xpath=/html/body/span/span/span[1]/input    ${Ciudad_Destino}
    Click Element    //*[contains(text(),'San Andrés Islas')]
    Click Element    xpath=//*[@id="select2-TblProductos_id_ciudad_destino-container"]
    Input Text    xpath=//*[@id="TblProductos_num_max_pax"]    4
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_categoria_producto-container"]
    Click Element    xpath=//*[@id="TblProductos_id_dominio_categoria_producto"]/option[2]
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_categoria_producto-container"]
    Input Text    xpath=//*[@id="TblProductos_descripcion"]    Creacion de producto automatizacion de pruebas
    Input Text    xpath=//*[@id="productoCiudades"]    Adz
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/fieldset/div[1]/div[1]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="general"]/fieldset/div/fieldset/div[1]/div[1]/ul/li/a
    Click Button    xpath=//*[@id="agregarCiudad"]
    
    Click Element    xpath=//*[@id="tabServicios"]/a
    Wait Until Element Is Visible    xpath=//*[@id="agregarServicio2"]    ${Tme_load}
    Click Element    xpath=//*[@id="select2-Tipo_Servicio-container"]
    Click Element    xpath=//*[@id="Tipo_Servicio"]/option[4]
    Click Element    xpath=//*[@id="select2-Tipo_Servicio-container"]
    Wait Until Element Is Visible    xpath=//*[@id="servicios_asignados"]/option[1]    ${Tme_load}
    Click Element    xpath=//*[@id="servicios_asignados"]/option[3]
    Click Element    xpath=//*[@id="agregarServicio2"]

    Click Element    xpath=//*[@id="tabCanales"]/a
    Wait Until Element Is Visible    xpath=//*[@id="agregarCanal2"]    ${Tme_load}
    Input Text    xpath=//*[@id="txt_buscar_canal"]    Dire 
    Wait Until Element Is Visible    xpath=//*[@id="canales_asignados"]/option    ${Tme_load}
    Click Element    xpath=//*[@id="canales_asignados"]/option
    Click Button    xpath=//*[@id="agregarCanal2"]

    Click Element    xpath=//*[@id="tabSucursales"]/a
    Wait Until Element Is Visible    xpath=//*[@id="agregarSucursal2"]    ${Tme_load}
    Click Element    xpath=//*[@id="sucursales_asignados"]/option[1]
    Input Text    xpath=//*[@id="txt_buscar_sucursal"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="sucursales_asignados"]/option[1]    ${Tme_load}
    Click Element    xpath=//*[@id="sucursales_asignados"]/option[1]
    Click Element    xpath=//*[@id="agregarSucursal2"]

    Click Element    xpath=//*[@id="tabTerceros"]/a
    Wait Until Element Is Visible    xpath=//*[@id="agregarCiudadOrigenTercero"]/i    ${Tme_load}
    Click Button    xpath=//*[@id="btn-guardar"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001.1 Crear un nuevo Producto Plan Completo
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${Complemento_producto}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_producto"]    Creacion nuevo producto Plan Completo ${Complemento_producto}
    click Element    xpath=//*[@id="fecha_desde"]
    click Element    xpath=//*[@id="general"]/fieldset/div/div[3]/div/div[1]/table/thead/tr[1]/th[3]
    click Element    xpath=//*[@id="general"]/fieldset/div/div[3]/div/div[1]/table/tbody/tr[4]/td[1]
    ${Utilidad}   Generate random string    1    123456789
    Input Text    xpath=//*[@id="TblProductos_utilidad"]    ${Utilidad}
    Input Text    xpath=//*[@id="productoTemporadas"]    baja
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a
    click Element    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a    ${Tme_load}
    Input Text    xpath=//*[@id="TblProductos_num_pax_aplica"]    1
    Click Element    xpath=//*[@id="select2-TblProductos_id_ciudad_destino-container"]
    Input Text    xpath=/html/body/span/span/span[1]/input    ${Ciudad_Destino}
    Click Element    //*[contains(text(),'San Andrés Islas')]
    Click Element    xpath=//*[@id="select2-TblProductos_id_ciudad_destino-container"]
    Input Text    xpath=//*[@id="TblProductos_num_max_pax"]    4
    click Element    xpath=//*[@id="select2-TblProductos_id_dominio_categoria_producto-container"]
    click Element    xpath=//*[@id="TblProductos_id_dominio_categoria_producto"]/option[8]
    click Element    xpath=//*[@id="select2-TblProductos_id_dominio_categoria_producto-container"]
    Input Text    xpath=//*[@id="TblProductos_descripcion"]    Creacion de nuevo producto como plan Completo
    Input Text    xpath=//*[@id="productoCiudades"]    Adz
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/fieldset/div[1]/div[1]/ul/li/a
    click Element    xpath=//*[@id="general"]/fieldset/div/fieldset/div[1]/div[1]/ul/li/a
    click Element    xpath=//*[@id="agregarCiudad"]/i
    ${Codigo}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_codigo"]    ${Codigo}
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_tipo_producto-container"]
    Wait Until Element Is Visible    xpath=//*[@id="TblProductos_id_dominio_tipo_producto"]/option[2]
    Click Element    xpath=//*[@id="TblProductos_id_dominio_tipo_producto"]/option[2]

    click Element    xpath=//*[@id="tabHotel"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregar_hotel"]
    click Element    xpath=//*[@id="hoteles"]/option[1]
    click Element    xpath=//*[@id="agregar_hotel"]
    click Element    xpath=//*[@id="select2-id_dominio_alimentacion-container"]
    click Element    xpath=//*[@id="id_dominio_alimentacion"]/option[3]
    click Element    xpath=//*[@id="select2-id_dominio_alimentacion-container"]
    Input Text    xpath=//*[@id="nocheMin"]    1
    Input Text    xpath=//*[@id="nocheMax"]    4

    click Element    xpath=//*[@id="tabAcomodaciones"]/a
    Wait Until Element Is Visible    xpath=//*[@id="contentCheck"]/h5/h5
    click Element    xpath=//*[@id="select2-hotelesAsignados-container"]
    click Element    xpath=//*[@id="hotelesAsignados"]/option[2]
    click Element    xpath=//*[@id="select2-hotelesAsignados-container"]
    click Element    xpath=//*[@id="tabVuelos"]/a

    Wait Until Element Is Visible    xpath=//*[@id="btn_buscar_vuelo"]
    click Element    xpath=//*[@id="fecha_desde_vuelo"]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[1]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    click Element    xpath=//*[@id="fecha_hasta_vuelo"]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Input Text    xpath=//*[@id="f_numero_noches"]    4
    click Element    xpath=//*[@id="select2-f_id_tipo_vuelo-container"]
    click Element    xpath=//*[@id="f_id_tipo_vuelo"]/option[2]
    click Element    xpath=//*[@id="select2-f_id_tipo_vuelo-container"]
    Input Text    xpath=//*[@id="f_ciudad_origen"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="vuelos"]/fieldset/div/div[5]/ul/li/a
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[5]/ul/li/a
    click Element    xpath=//*[@id="select2-f_id_tercero_tipo_aerolinea-container"]
    click Element    xpath=//*[@id="f_id_tercero_tipo_aerolinea"]/option[9]
    click Element    xpath=//*[@id="select2-f_id_tercero_tipo_aerolinea-container"]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[1]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[2]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[3]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[4]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[5]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[6]
    click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[7]
    click Element    xpath=//*[@id="btn_buscar_vuelo"]
    Wait Until Element Is Visible    xpath=//*[@id="vuelos_producto"]/option[1]
    Sleep    1s
    click Element    xpath=//*[@id="vuelos_producto"]/option[1]
    click Element    xpath=//*[@id="agregar_vuelos"]
    click Element    xpath=//*[@id="tabServicios"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarServicio2"]
    click Element    xpath=//*[@id="select2-Tipo_Servicio-container"]
    click Element    xpath=//*[@id="Tipo_Servicio"]/option[2]
    click Element    xpath=//*[@id="select2-Tipo_Servicio-container"]
    Wait Until Element Is Visible    xpath=//*[@id="servicios_asignados"]/option[1]
    click Element    xpath=//*[@id="servicios_asignados"]/option[1]
    click Button    xpath=//*[@id="agregarServicio2"]
    click Element    xpath=//*[@id="tabSucursales"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarSucursal2"]
    click Element    xpath=//*[@id="sucursales_asignados"]/option[1]
    click Button    xpath=//*[@id="agregarSucursal2"]
    click Element    xpath=//*[@id="tabCanales"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarCanal2"]
    click Element    xpath=//*[@id="canales_asignados"]/option[1]
    click Button    xpath=//*[@id="agregarCanal2"]
    click Element    xpath=//*[@id="tabTerceros"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarCiudadDestinoTercero"]/i
    click Button    xpath=//*[@id="btn-guardar"]

    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    


C001.2 Crear un nuevo Producto Solo Tiquete
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${Complemento_producto}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_producto"]    Creacion nuevo producto Solo Tiquete ${Complemento_producto}
    Click Element    xpath=//*[@id="fecha_desde"]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[3]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[3]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fecha_hasta"]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[4]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[4]/div/div[1]/table/tbody/tr[5]/td[1]
    ${Utilidad}   Generate random string    1    123456789
    Input Text    xpath=//*[@id="TblProductos_utilidad"]    ${Utilidad}
    Input Text    xpath=//*[@id="productoTemporadas"]    baja
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a
    Click Element    xpath=//*[@id="select2-TblProductos_id_ciudad_destino-container"]
    Input Text    xpath=/html/body/span/span/span[1]/input    ${Ciudad_Destino}
    Click Element    //*[contains(text(),'San Andrés Islas')]
    Click Element    xpath=//*[@id="select2-TblProductos_id_ciudad_destino-container"]
    Input Text    xpath=//*[@id="TblProductos_num_pax_aplica"]    1
    Input Text    xpath=//*[@id="TblProductos_num_max_pax"]    4
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_categoria_producto-container"]
    Click Element    xpath=//*[@id="TblProductos_id_dominio_categoria_producto"]/option[2]
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_categoria_producto-container"]
    Input Text    xpath=//*[@id="TblProductos_descripcion"]    Creacion Producto solo Tiquete
    Input Text    xpath=//*[@id="productoCiudades"]    Adz
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/fieldset/div[1]/div[1]/ul/li/a
    Click Element    xpath=//*[@id="general"]/fieldset/div/fieldset/div[1]/div[1]/ul/li/a
    Click Element    xpath=//*[@id="agregarCiudad"]/i
    ${Codigo}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_codigo"]    ${Codigo}
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_tipo_producto-container"]
    Wait Until Element Is Visible    xpath=//*[@id="TblProductos_id_dominio_tipo_producto"]/option[3]
    Click Element    xpath=//*[@id="TblProductos_id_dominio_tipo_producto"]/option[3]
    Click Element    xpath=//*[@id="tabVuelos"]/a

    Wait Until Element Is Visible    xpath=//*[@id="btn_buscar_vuelo"]
    Click Element    xpath=//*[@id="fecha_desde_vuelo"]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[1]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fecha_hasta_vuelo"]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[2]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Input Text    xpath=//*[@id="f_numero_noches"]    4
    Click Element    xpath=//*[@id="select2-f_id_tipo_vuelo-container"]
    Click Element    xpath=//*[@id="f_id_tipo_vuelo"]/option[2]
    Click Element    xpath=//*[@id="select2-f_id_tipo_vuelo-container"]
    Input Text    xpath=//*[@id="f_ciudad_origen"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="vuelos"]/fieldset/div/div[5]/ul/li/a
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[5]/ul/li/a
    Click Element    xpath=//*[@id="select2-f_id_tercero_tipo_aerolinea-container"]
    Click Element    xpath=//*[@id="f_id_tercero_tipo_aerolinea"]/option[9]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[1]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[2]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[3]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[4]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[5]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[6]
    Click Element    xpath=//*[@id="vuelos"]/fieldset/div/div[8]/input[7]
    Click Element    xpath=//*[@id="btn_buscar_vuelo"]
    Wait Until Element Is Visible    xpath=//*[@id="vuelos_producto"]/option[1]
    Click Element    xpath=//*[@id="vuelos_producto"]/option[1]
    Click Element    xpath=//*[@id="agregar_vuelos"]
    Click Element    xpath=//*[@id="tabServicios"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarServicio2"]
    Click Element    xpath=//*[@id="select2-Tipo_Servicio-container"]
    Click Element    xpath=//*[@id="Tipo_Servicio"]/option[2]
    Click Element    xpath=//*[@id="select2-Tipo_Servicio-container"]
    Wait Until Element Is Visible    xpath=//*[@id="servicios_asignados"]/option[1]
    Click Element    xpath=//*[@id="servicios_asignados"]/option[1]
    Click Button    xpath=//*[@id="agregarServicio2"]
    Click Element    xpath=//*[@id="tabSucursales"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarSucursal2"]
    Click Element    xpath=//*[@id="sucursales_asignados"]/option[1]
    Click Button    xpath=//*[@id="agregarSucursal2"]
    Click Element    xpath=//*[@id="tabCanales"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarCanal2"]
    Click Element    xpath=//*[@id="canales_asignados"]/option[1]
    Click Button    xpath=//*[@id="agregarCanal2"]
    Click Element    xpath=//*[@id="tabTerceros"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarCiudadDestinoTercero"]/i
    Click Button    xpath=//*[@id="btn-guardar"]

    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C001.3 Crear un nuevo Producto Alojamiento
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${Complemento_producto}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_producto"]    Creacion producto Alojamiento ${Complemento_producto}
    Click Element    xpath=//*[@id="fecha_desde"]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[3]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[3]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fecha_hasta"]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[4]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[4]/div/div[1]/table/tbody/tr[5]/td[1]
    ${Utilidad}   Generate random string    1    123456789
    Input Text    xpath=//*[@id="TblProductos_utilidad"]    ${Utilidad}
    Input Text    xpath=//*[@id="productoTemporadas"]    baja
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[13]/ul/li[1]/a
    Click Element    xpath=//*[@id="select2-TblProductos_id_ciudad_destino-container"]
    Input Text    xpath=/html/body/span/span/span[1]/input    ${Ciudad_Destino}
    Click Element    //*[contains(text(),'San Andrés Islas')]
    Click Element    xpath=//*[@id="select2-TblProductos_id_ciudad_destino-container"]
    Input Text    xpath=//*[@id="TblProductos_num_pax_aplica"]    1
    Input Text    xpath=//*[@id="TblProductos_num_max_pax"]    4
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_categoria_producto-container"]
    Click Element    xpath=//*[@id="TblProductos_id_dominio_categoria_producto"]/option[2]
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_categoria_producto-container"]
    Input Text    xpath=//*[@id="TblProductos_descripcion"]    Pruena creacion producto Alojamiento
    Input Text    xpath=//*[@id="productoCiudades"]    Adz
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/fieldset/div[1]/div[1]/ul/li/a
    Click Element    xpath=//*[@id="general"]/fieldset/div/fieldset/div[1]/div[1]/ul/li/a
    Click Element    xpath=//*[@id="agregarCiudad"]/i
    ${Codigo}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_codigo"]    ${Codigo}
    Click Element    xpath=//*[@id="select2-TblProductos_id_dominio_tipo_producto-container"]
    Wait Until Element Is Visible    xpath=//*[@id="TblProductos_id_dominio_tipo_producto"]/option[5]
    Click Element    xpath=//*[@id="TblProductos_id_dominio_tipo_producto"]/option[5]
    Click Element    xpath=//*[@id="tabHotel"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregar_hotel"]
    Click Element    xpath=//*[@id="hoteles"]/option[1]
    Click Button    xpath=//*[@id="agregar_hotel"]
    Click Element    xpath=//*[@id="select2-id_dominio_alimentacion-container"]
    Click Element    xpath=//*[@id="id_dominio_alimentacion"]/option[3]
    Input Text    xpath=//*[@id="nocheMin"]    1
    Input Text    xpath=//*[@id="nocheMax"]    4
    Click Element    xpath=//*[@id="tabAcomodaciones"]/a

    Wait Until Element Is Visible    xpath=//*[@id="contentCheck"]/h5/h5
    Click Element    xpath=//*[@id="select2-hotelesAsignados-container"]
    Click Element    xpath=//*[@id="hotelesAsignados"]/option[2]
    Click Element    xpath=//*[@id="select2-hotelesAsignados-container"]
    Click Element    xpath=//*[@id="tabServicios"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarServicio2"]
    Click Element    xpath=//*[@id="select2-Tipo_Servicio-container"]
    Click Element    xpath=//*[@id="Tipo_Servicio"]/option[2]
    Click Element    xpath=//*[@id="select2-Tipo_Servicio-container"]
    Wait Until Element Is Visible    xpath=//*[@id="servicios_asignados"]/option[1]
    Click Element    xpath=//*[@id="servicios_asignados"]/option[1]
    Click Button    xpath=//*[@id="agregarServicio2"]
    Click Element    xpath=//*[@id="tabSucursales"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarSucursal2"]
    Click Element    xpath=//*[@id="sucursales_asignados"]/option[1]
    Click Button    xpath=//*[@id="agregarSucursal2"]
    Click Element    xpath=//*[@id="tabCanales"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarCanal2"]
    Click Element    xpath=//*[@id="canales_asignados"]/option[1]
    Click Element    xpath=//*[@id="agregarCanal2"]
    Click Element    xpath=//*[@id="tabTerceros"]/a

    Wait Until Element Is Visible    xpath=//*[@id="agregarCiudadDestinoTercero"]
    Click Button    xpath=//*[@id="btn-guardar"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C002 Filtrar búsqueda por el nombre del producto
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[2]/input   Regulares Media 4N Adz
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Regulares Media 4N Adz

C003 Filtrar Búsqueda por la utilidad
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[3]/input   10
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    10

C004 Filtrar Búsqueda por medio de la fecha desde
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[4]/input   2013-09-02
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2013-09-02

C005 Filtrar Búsqueda por medio de la fecha hasta   
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[5]/input   2013-12-05
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2013-12-05

C006 Filtrar Búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Activo

C007 Ver detalles del producto
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Actualizar los datos del producto
    Sleep    1s
    Input Text    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Creacion nuevo producto 
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/tbody/tr/td[7]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${Complemento}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblProductos_producto"]    Actualizacion nuevo producto ${Complemento}
    click Element    xpath=//*[@id="tabTerceros"]/a
    Wait Until Element Is Visible    xpath=//*[@id="agregarCiudadOrigenTercero"]    ${Tme_load}
    click Button    xpath=//*[@id="btn-guardar"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C009 Inactivar producto
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Actualizacion nuevo producto
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblProductos-grid"]/div[2]/table/tbody/tr/td[7]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Broeser





