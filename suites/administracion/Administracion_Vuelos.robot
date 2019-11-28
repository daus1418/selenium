*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/a[2]/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    //a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Vuelos\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse26"]/div/ul/li[3]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo vuelo
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="select2-TblVuelos_id_dominio_tipo_vuelo-container"]
    Click Element    xpath=//*[@id="TblVuelos_id_dominio_tipo_vuelo"]/option[2]
    Click Element    xpath=//*[@id="select2-TblVuelos_id_dominio_tipo_vuelo-container"]
    Click Element    xpath=//*[@id="select2-TblVuelos_id_tercero-container"]
    Click Element    xpath=//*[@id="TblVuelos_id_tercero"]/option[3]
    Click Element    xpath=//*[@id="select2-TblVuelos_id_tercero-container"]
    Click Element    xpath=//*[@id="select2-TblVuelos_id_dominio_tipo_vuelo_regreso-container"]
    Click Element    xpath=//*[@id="TblVuelos_id_dominio_tipo_vuelo_regreso"]/option[2]
    Click Element    xpath=//*[@id="select2-TblVuelos_id_dominio_tipo_vuelo_regreso-container"]
    Click Element    xpath=//*[@id="select2-TblVuelos_id_tercero_proveedor_regreso-container"]
    Click Element    xpath=//*[@id="TblVuelos_id_tercero_proveedor_regreso"]/option[3]
    Click Element    xpath=//*[@id="date_fecha_ida"]
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[8]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[8]/div/div[1]/table/tbody/tr[5]/td[2]
    Input Text    xpath=//*[@id="ciudadDestinoLabelVuelos"]    ADZ
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/div[19]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[19]/ul/li/a
    Input Text    xpath=//*[@id="ciudadOrigenLabelVuelos"]     BOG
    Wait Until Element Is Visible    xpath=//*[@id="general"]/fieldset/div/div[18]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="general"]/fieldset/div/div[18]/ul/li/a
    Input Text    xpath=//*[@id="TblVuelos_cantidad_sillas"]    20
    Click Element    xpath=//*[@id="myTab"]/li[3]/a
    Sleep    1s
    Input Text    xpath=//*[@id="silla"]    20
    Click Element    xpath=//*[@id="select2-combo_clase-container"]
    Click Element    xpath=//*[@id="combo_clase"]/option[23]
    Click Element    xpath=//*[@id="select2-combo_clase-container"]
    Click Element    xpath=//*[@id="registrar"]
    Wait Until Element Is Visible    xpath=//*[@id="tr1"]/td[5]/div/a    ${Tme_load}
    Click Element    xpath=//*[@id="btn-save-vuelo"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load} 
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar busqueda por medio del id vuelo
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    66747
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    66747

C003 Filtrar Búsqueda por Ciudad de origen
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Cali
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Cali

C004 Filtrar Búsqueda por medio de ciudad Destino
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[4]/input    Cali
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Cali

C005 Filtrar Búsqueda por medio de la fecha ida
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[5]/input    2019-07-20
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2019-07-20

C006 Filtrar Búsqueda por medio de la fecha regreso
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[6]/input    2019-09-12	
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2019-09-12	

C007 Filtrar Búsqueda Cantidad de sillas
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[7]/input    10	
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    10

C008 Filtrar Búsqueda por aerolinea ida
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[8]/input    INTERJET	
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    INTERJET

C009 Filtrar Búsqueda por aerolinea regreso
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[9]/input    AVIANCA	
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    AVIANCA

C010 Filtrar Búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[12]/select
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/thead/tr[2]/td[12]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C011 Ver detalles del vuelo
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/tbody/tr[1]/td[13]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C012 Actualizar los datos del vuelo
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblVuelos-grid"]/div[2]/table/tbody/tr[1]/td[13]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="TblVuelos_cantidad_sillas"]    21
    Click Element    xpath=//*[@id="myTab"]/li[3]/a
    Sleep    1s
    Input Text    xpath=//*[@id="silla"]    21
    Click Element    xpath=//*[@id="tr1"]/td[5]/div/a/i
    Click Element    xpath=//*[@id="registrar"]
    Click Element    xpath=//*[@id="select2-combo_clase-container"]
    Click Element    xpath=//*[@id="combo_clase"]/option[23]
    Click Element    xpath=//*[@id="select2-combo_clase-container"]
    Click Element    xpath=//*[@id="registrar"]
    Wait Until Element Is Visible    xpath=//*[@id="tr1"]/td[5]/div/a/i    ${Tme_load}
    Click Element    xpath=//*[@id="btn-save-vuelo"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    



