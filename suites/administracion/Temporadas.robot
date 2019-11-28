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
    Click Element    xpath=//a[contains(.," Hotel\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse12"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar una nueva Temporada
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    ${PO_Number}   Generate random string    3    0123456789
    Input Text    xpath=//*[@id="TblTemporadas_nombre"]    Temporada prueba ${PO_Number}
    Click Element    xpath=//*[@id="TblTemporadas_fecha_inicio"]
    Click Element    xpath=//*[@id="TblTemporadas-form"]/fieldset/div[2]/div/div[1]/table/tbody/tr[4]/td[2]
    Sleep    1s
    Click Element    xpath=//*[@id="TblTemporadas_fecha_fin"]
    Click Element    xpath=//*[@id="TblTemporadas-form"]/fieldset/div[3]/div/div[1]/table/tbody/tr[5]/td[5]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-TblTemporadas_id_dominio_tipo_temporada-container"]
    Click Element    xpath=//*[@id="TblTemporadas_id_dominio_tipo_temporada"]/option[3]
    Click Element    xpath=//*[@id="select2-TblTemporadas_id_dominio_tipo_temporada-container"]
    Input Text    xpath=//*[@id="TblTemporadasAdicion_nombre"]    Temporada prueba
    Click Element    xpath=//*[@id="select2-TblTemporadasAdicion_id_hotel-container"]
    Click Element    xpath=//*[@id="TblTemporadasAdicion_id_hotel"]/option[2]
    Click Element    xpath=//*[@id="select2-TblTemporadasAdicion_id_hotel-container"]
    Click Element    xpath=//*[@id="agregarTar"]
    Sleep    1s
    Click Element    xpath=//*[@id="GuardarT"]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Eliminar Temporadas Seleccionadas
    Sleep    1s
    click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C003 Filtrar búsqueda por el id
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[2]/input    12225	
    Click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    12225	

C004 Filtrar búsqueda por Nombre
    Sleep    1s
    click Element    xpath=${Re_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[3]/input    78SMR Tarifa Regular Baja 3 noches 2020
    Click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    78SMR Tarifa Regular Baja 3 noches 2020

C005 Filtrar búsqueda por Fecha de inicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[4]/input    2019-03-21
    Click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2019-03-21

C006 Filtar busqueda por fecha de finalización
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[5]/input    2019-12-31
    Click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2019-12-31


C007 Filtar busqueda por tipo de temporada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[6]/input    Media
    click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Media

C008 Filtrar busqueda por Estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C009 Filtrar busqueda por Tipo de moneda
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    DOLLAR

C010 Visualizar los detalles de la temporada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C011 Actualizar los datos de la temporada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTemporadas-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${PO_Number}   Generate random string    3    0123456789
    Input Text    xpath=//*[@id="TblTemporadas_nombre"]    Temporada prueba ${PO_Number}
    click Element    xpath=//*[@id="GuardarT"]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    
