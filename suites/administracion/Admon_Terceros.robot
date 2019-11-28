*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/a[1]/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Terceros\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse11"]/div/ul/li[3]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo tercero
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4   ${Time}
    Input Text    xpath=//*[@id="TblTerceros_nombre1"]    Tercero 
    Input Text    xpath=//*[@id="TblTerceros_apellido1"]    Pruebas 
    Input Text    xpath=//*[@id="TblTerceros_apellido2"]    Automaticas
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_ident-container"]
    click Element    xpath=//*[@id="TblTerceros_id_dominio_ident"]/option[2]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_ident-container"]
    ${identificacion}   Generate random string    8    123456789
    Input Text    xpath=//*[@id="TblTerceros_identificacion"]    ${identificacion}
    click Element    xpath=//*[@id="select2-pais2-container"]
    click Element    xpath=//*[@id="pais2"]/option[26]
    click Element    xpath=//*[@id="select2-pais2-container"]
    Sleep    1s
    click Element    xpath=//*[@id="select2-id_ciudad2-container"]
    click Element    xpath=//*[@id="id_ciudad2"]/option[108]
    click Element    xpath=//*[@id="select2-id_ciudad2-container"]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_genero-container"]
    click Element    xpath=//*[@id="TblTerceros_id_dominio_genero"]/option[2]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_genero-container"]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_estcivil-container"]
    click Element    xpath=//*[@id="TblTerceros_id_dominio_estcivil"]/option[2]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_estcivil-container"]
    ${Direccion}   Generate random string    2    123456789
    click Element    xpath=//*[@id="select2-direccion1-container"]
    click Element    xpath=//*[@id="direccion1"]/option[6]
    click Element    xpath=//*[@id="select2-direccion1-container"]
    Input Text    xpath=//*[@id="direccion2"]    ${Direccion}
    click Element    xpath=//*[@id="personal"]/fieldset/div/div[16]/div/div[1]/div[2]/div[1]/span/span[1]/span
    click Element    xpath=//*[@id="direccion3"]/option[3]
    click Element    xpath=//*[@id="personal"]/fieldset/div/div[16]/div/div[1]/div[2]/div[1]/span/span[1]/span
    Input Text    xpath=//*[@id="direccion4"]    ${Direccion}
    Input Text    xpath=//*[@id="direccion5"]    ${Direccion}
    click Element    xpath=//*[@id="personal"]/fieldset/div/div[16]/div/div[1]/div[3]/div[1]/span/span[1]/span
    click Element    xpath=//*[@id="direccion6"]/option[4]
    click Element    xpath=//*[@id="personal"]/fieldset/div/div[16]/div/div[1]/div[3]/div[1]/span/span[1]/span
    Input Text    xpath=//*[@id="direccion7"]    ${Direccion}
    Input Text    xpath=//*[@id="TblTerceros_email"]    Prueba${Direccion}@gmail.com
    ${Telefono}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="TblTerceros_telefono1"]    ${Telefono}
    ${Celular}   Generate random string    10    123456789
    Input Text    xpath=//*[@id="TblTerceros_tel_movil"]    ${Celular}
    click Element    xpath=//*[@id="myTab"]/li[2]/a
    Wait Until Element Is Visible    xpath=//*[@id="negocio"]/fieldset/div/div[1]/label   ${Time}
    click Element    xpath=//*[@id="select2-TblTerceros_id_tipo_tercero-container"]
    click Element    xpath=//*[@id="TblTerceros_id_tipo_tercero"]/option[7]
    click Element    xpath=//*[@id="select2-TblTerceros_id_tipo_tercero-container"]
    Input Text    xpath=//*[@id="terceroLabel"]    TOUR
    Wait Until Element Is Visible    xpath=//*[@id="negocio"]/fieldset/div/div[2]/ul/li[1]/a   ${Time}
    click Element    xpath=//*[@id="negocio"]/fieldset/div/div[2]/ul/li[1]/a
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_cfiscal-container"]
    click Element    xpath=//*[@id="TblTerceros_id_dominio_cfiscal"]/option[2]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_cfiscal-container"]
    click Element    xpath=//*[@id="select2-pais-container"]
    click Element    xpath=//*[@id="pais"]/option[26]
    click Element    xpath=//*[@id="select2-pais-container"]
    Sleep    1s
    click Element    xpath=//*[@id="select2-id_ciudad-container"]
    click Element    xpath=//*[@id="id_ciudad"]/option[108]
    click Element    xpath=//*[@id="select2-id_ciudad-container"]
    click Element    xpath=//*[@id="select2-TblTerceroCanal_id_canal-container"]
    click Element    xpath=//*[@id="TblTerceroCanal_id_canal"]/option[3]
    click Element    xpath=//*[@id="select2-TblTerceroCanal_id_canal-container"]
    click Element    xpath=//*[@id="select2-TblTercerosSucursales_id_sucursal-container"]
    click Element    xpath=//*[@id="TblTercerosSucursales_id_sucursal"]/option[8]
    click Element    xpath=//*[@id="select2-TblTercerosSucursales_id_sucursal-container"]
    click Element    xpath=//*[@id="myTab"]/li[5]/a
    Wait Until Element Is Visible    xpath=//*[@id="usuario"]/fieldset/div/div[4]/input   ${Time}
    click Element    xpath=//*[@id="select2-TblUsuarios_id_perfil-container"]
    click Element    xpath=//*[@id="TblUsuarios_id_perfil"]/option[2]
    click Element    xpath=//*[@id="usuario"]/fieldset/div/div[4]/input
    Wait Until Element Is Visible    xpath=//*[@id="div_errores"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por código
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input   1341876
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    1341876

C003 Filtrar búsqueda por primer nombre
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[3]/input   JUAN 
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    JUAN

C004 Filtrar búsqueda por medio del número de identificación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[4]/input   1000031722
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    1000031722

C005 Filtrar Búsqueda por medio del tipo tercero
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Vendedor

C006 Filtrar búsqueda por dependencia
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[6]/input   TOUR
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    TOUR

C007 Filtrar búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C008 Ver detalles del tercero
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    click Element    xpath=//*[@id="myTab"]/li[2]/a
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C009 Actualizar los datos del tecero
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[3]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    ${Actualizar_identificacion}   Generate random string    8    123456789
    Input Text    xpath=//*[@id="TblTerceros_identificacion"]    ${Actualizar_identificacion}
    click Element    xpath=//*[@id="myTab"]/li[5]/a
    Wait Until Element Is Visible    xpath=//*[@id="usuario"]/fieldset/div/div[4]/input
    click Element    xpath=//*[@id="select2-TblUsuarios_id_perfil-container"]
    click Element    xpath=//*[@id="TblUsuarios_id_perfil"]/option[2]
    click Element    xpath=//*[@id="select2-TblUsuarios_id_perfil-container"]
    click Element    xpath=//*[@id="usuario"]/fieldset/div/div[4]/input
    Wait Until Element Is Visible    xpath=//*[@id="div_errores"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Close Browser
    