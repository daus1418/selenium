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
    Click Element    xpath=//a[contains(.,"Pago Aerolíneas\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse234"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar nueva tasa aeroportuaria
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblPagosAerolineasNegociacion-form"]/div[4]/button[1]    ${Tme_load}
    Input Text    xpath=//*[@id="tercero_aerolinea"]    890100577
    Wait Until Element Is Visible    xpath=//*[@id="frm-registro"]/div/div[2]/div/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="frm-registro"]/div/div[2]/div/ul/li/a
    Click Element    xpath=//*[@id="select2-id_dominio_tipo_vuelo-container"]
    Click Element    xpath=//*[@id="id_dominio_tipo_vuelo"]/option[2]
    Click Element    xpath=//*[@id="fecha_inicial"]
    Click Element    xpath=//*[@id="frm-registro"]/div/div[6]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fecha_final"]
    Click Element    xpath=//*[@id="frm-registro"]/div/div[7]/div/div[1]/table/tbody/tr[2]/td[2]
    Input Text    xpath=//*[@id="num_dias_pago_vuelo"]    1
    Click Element    xpath=//*[@id="aAddItemNegociacion"]/i
    Wait Until Element Is Visible    xpath=//*[@id="ItemsNegociacion-form"]/div[13]/button[1]    ${Tme_load}
    Click Element    xpath=//*[@id="select2-id_dominio_item_negociacion-container"]
    Click Element    xpath=//*[@id="id_dominio_item_negociacion"]/option[2]
    Click Element    xpath=//*[@id="select2-id_tipo_moneda-container"]
    Click Element    xpath=//*[@id="id_tipo_moneda"]/option[2]
    Input Text    xpath=//*[@id="ciudad_origen"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="ItemsNegociacion-form"]/div[3]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="ItemsNegociacion-form"]/div[3]/ul/li/a
    Input Text    xpath=//*[@id="ciudad_destino"]    Adz
    Wait Until Element Is Visible    xpath=//*[@id="ItemsNegociacion-form"]/div[4]/ul/li/a
    Click Element    xpath=//*[@id="ItemsNegociacion-form"]/div[4]/ul/li/a
    Click Element    xpath=//*[@id="fecha_ini"]
    Click Element    xpath=//*[@id="ItemsNegociacion-form"]/div[6]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fecha_fin"]
    Click Element    xpath=//*[@id="ItemsNegociacion-form"]/div[7]/div/div[1]/table/tbody/tr[2]/td[2]
    Input Text    xpath=//*[@id="valor_money"]    1000000
    Click Element    xpath=//*[@id="select2-porcentaje-container"]
    Click Element    xpath=//*[@id="porcentaje"]/option[2]
    Click Element    xpath=//*[@id="select2-id_dominio_categoria_liquidacion-container"]
    Click Element    xpath=//*[@id="id_dominio_categoria_liquidacion"]/option[2]
    Click Element    xpath=//*[@id="select2-estado-container"]
    Click Element    xpath=//*[@id="estado"]/option[3]
    Click Element    xpath=//*[@id="select2-estado-container"]
    Click Element    xpath=//*[@id="ItemsNegociacion-form"]/div[13]/button[1]
    Sleep    1s
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-form"]/div[4]/button[1]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]
    Click Element    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    

C002 Filtrar búsqueda por Id Negociacion
    Sleep    1s
    Input Text    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[2]/input    120
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	120

C003 Filtrar búsqueda por aerolinea
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[3]/input    AVIANCA
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	AVIANCA

C004 Filtar busqueda por fecha inicial
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[5]/input    2018
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2018

C005 Filtar busqueda por fecha final
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[6]/input    2018
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2018

C006 Filtrar búsqueda por tipo vuelo
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion_id_dominio_tipo_vuelo"]
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion_id_dominio_tipo_vuelo"]/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	ComercialC

C007 Filtrar busqueda por manejo anticipo
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[9]/select
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[9]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Con Anticipo

C008 Filtrar búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[10]/select
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/thead/tr[2]/td[10]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Inactivo

C009 Visualizar los detalles de las negociaciones de aerolineas
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/tbody/tr[1]/td[11]/div/a[1]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C010 Actualizar la negociacion aerolineas
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-grid"]/div[2]/table/tbody/tr[1]/td[11]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblPagosAerolineasNegociacion-form"]/div[4]/button[1]    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasNegociacion-form"]/div[4]/button[1]
    Wait Until Element Is Visible    (// button [text () = "OK"]) [1]
    Sleep    5s
    Click Element    (// button [text () = "OK"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser





