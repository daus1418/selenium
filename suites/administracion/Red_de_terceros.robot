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
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Terceros\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse11"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo tercero
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="TblTerceros_nombre1"]    Tercero 
    Input Text    xpath=//*[@id="TblTerceros_apellido1"]    prueba 
    Click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_ident-container"]
    Click Element    xpath=//*[@id="TblTerceros_id_dominio_ident"]/option[2]
    Click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_ident-container"]
    ${Identificacion}   Generate random string    8    0123456789
    Input Text    xpath=//*[@id="TblTerceros_identificacion"]    ${Identificacion}
    Input Text    xpath=//*[@id="TblTerceros_sucursal"]    BOGOTA
    Click Element    xpath=//*[@id="select2-pais2-container"]
    Click Element    xpath=//*[@id="pais2"]/option[26]
    Click Element    xpath=//*[@id="select2-pais2-container"]
    Click Element    xpath=//*[@id="select2-id_ciudad2-container"]
    Click Element    xpath=//*[@id="id_ciudad2"]/option[108]
    Click Element    xpath=//*[@id="select2-id_ciudad2-container"]
    Click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_genero-container"]
    Click Element    xpath=//*[@id="TblTerceros_id_dominio_genero"]/option[2]
    Click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_genero-container"]
    Click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_estcivil-container"]
    Click Element    xpath=//*[@id="TblTerceros_id_dominio_estcivil"]/option[2]
    Click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_estcivil-container"]
    Click Element    xpath=//*[@id="select2-direccion1-container"]
    Click Element    xpath=//*[@id="direccion1"]/option[6]
    Click Element    xpath=//*[@id="select2-direccion1-container"]
    ${direccion}   Generate random string    2    123456789
    Input Text    xpath=//*[@id="direccion2"]    ${direccion}
    Click Element    xpath=//*[@id="personal"]/fieldset/div/div[16]/div/div[1]/div[2]/div[1]/span/span[1]/span
    Click Element    xpath=//*[@id="direccion3"]/option[2]
    Click Element    xpath=//*[@id="personal"]/fieldset/div/div[16]/div/div[1]/div[2]/div[1]/span/span[1]/span
    Input Text    xpath=//*[@id="direccion4"]    ${direccion}
    Input Text    xpath=//*[@id="direccion5"]    ${direccion}
    Click Element    xpath=//*[@id="personal"]/fieldset/div/div[16]/div/div[1]/div[3]/div[1]/span/span[1]/span
    Click Element    xpath=//*[@id="direccion6"]/option[4]
    Click Element    xpath=//*[@id="personal"]/fieldset/div/div[16]/div/div[1]/div[3]/div[1]/span/span[1]/span
    Input Text    xpath=//*[@id="direccion7"]    ${direccion}
    ${complemento_correo}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="TblTerceros_email"]    prueba${complemento_correo}@gmail.com
    ${Telefono}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="TblTerceros_telefono1"]    ${Telefono}
    ${celular}   Generate random string    10    123456789
    Input Text    xpath=//*[@id="TblTerceros_tel_movil"]    ${celular}
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Sleep    1s
    Click Element    xpath=//*[@id="select2-TblTerceros_id_tipo_tercero-container"]
    Click Element    xpath=//*[@id="TblTerceros_id_tipo_tercero"]/option[5]
    Click Element    xpath=//*[@id="select2-TblTerceros_id_tipo_tercero-container"]
    Input Text    xpath=//*[@id="terceroLabel"]    tour
    Wait Until Element Is Visible    xpath=//*[@id="negocio"]/fieldset/div/div[2]/ul/li[1]/a    ${Tme_load}
    Click Element    xpath=//*[@id="negocio"]/fieldset/div/div[2]/ul/li[1]/a
    Click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_cfiscal-container"]
    Click Element    xpath=//*[@id="TblTerceros_id_dominio_cfiscal"]/option[2]
    Click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_cfiscal-container"]
    Click Element    xpath=//*[@id="select2-pais-container"]
    Click Element    xpath=//*[@id="pais"]/option[26]
    Click Element    xpath=//*[@id="select2-pais-container"]
    Click Element    xpath=//*[@id="select2-id_ciudad-container"]
    Click Element    xpath=//*[@id="id_ciudad"]/option[108]
    Click Element    xpath=//*[@id="negocio"]/fieldset/div/div[9]/input
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s

C002 Filtrar búsqueda por código
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input    1341607
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    1341607

C003 Filtrar Búsqueda por nombre
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[3]/input    JUAN
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    JUAN

C004 Filtrar Búsqueda por medio del número de identificación
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[4]/input    39796145
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    39796145


C005 Filtrar Búsqueda por medio del tipo tercero
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[6]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Gerente de Zona

C006 Filtrar búsqueda por dependencia
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[6]/input    FABIAN
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    FABIAN

C007 Filtrar Búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Retirado

C008 Ver detalles del tercero
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Close Browser
    

































