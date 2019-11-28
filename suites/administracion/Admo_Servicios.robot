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
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[9]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo Servicio
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="num_doc_cli"]    tour vacation hoteles a     
    Wait Until Element Is Visible    xpath=//*[@id="TblServicios-form"]/fieldset/div[1]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="TblServicios-form"]/fieldset/div[1]/ul/li/a
    ${Complemento}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblServicios_nombre"]    Creacion servicio prueba ${Complemento}
    click Element    xpath=//*[@id="select2-TblServicios_id_dominio_codigo_srv-container"]
    click Element    xpath=//*[@id="TblServicios_id_dominio_codigo_srv"]/option[2]
    click Element    xpath=//*[@id="select2-TblServicios_id_dominio_codigo_srv-container"]
    ${Valor}   Generate random string    6    123456789
    Input Text    xpath=//*[@id="TblServicios_valor"]    ${Valor}
    click Element    xpath=//*[@id="select2-impuestoCombo-container"]
    click Element    xpath=//*[@id="impuestoCombo"]/option[3]
    click Element    xpath=//*[@id="select2-impuestoCombo-container"]
    Input Text    xpath=//*[@id="serv_ciudad_origen"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="TblServicios-form"]/fieldset/div[11]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="TblServicios-form"]/fieldset/div[11]/ul/li/a
    Input Text    xpath=//*[@id="serv_ciudad_destino"]    ADZ
    Wait Until Element Is Visible    xpath=//*[@id="TblServicios-form"]/fieldset/div[12]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="TblServicios-form"]/fieldset/div[12]/ul/li/a
    Input Text    xpath=//*[@id="TblServicios_descripcion"]    Creacion de nuevo servicio automatizacion de prueba
    Click Button     xpath=//*[@id="TblServicios-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por Nombre
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[2]/input   Receptivos ADZ
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Receptivos ADZ

C003 Filtrar Búsqueda por descripción
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[3]/input   Tasa Aeroportuaria
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Tasa Aeroportuaria

C004 Filtrar Búsqueda por medio del proveedor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[4]/input   TOUR VACATION
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    TOUR VACATION

C005 Filtrar Búsqueda por medio del valor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[5]/input   35000
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    35,000.00

C006 Filtrar Búsqueda por medio de la categoria de transporte
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[6]/input   taxi
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    taxi

C007 Filtrar Búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[7]
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C008 Ver detalles del servicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Actualizar los datos del servicio
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Creacion servicio prueba
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblServicios-grid"]/div[2]/table/tbody/tr/td[8]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]    ${Tme_load}
    Input Text    xpath=//*[@id="TblServicios_descripcion"]    Actualizacion servicio automatizacion de pruebas
    Click Button    xpath=//*[@id="TblServicios-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser


    
    
