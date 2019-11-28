*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/div/a[1]/i


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Contabilidad\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[3]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nuevo servicio causacion
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbFacturas-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbFacturas_id_ctb_interface"]    1
    Click Element    xpath=//*[@id="select2-TblCtbFacturas_id_ciudad_destino-container"]
    Click Element    xpath=//*[@id="TblCtbFacturas_id_ciudad_destino"]/option[4]
    ${Cc}   Generate random string    9    123456789
    Input Text    xpath=//*[@id="TblCtbFacturas_cc"]    ${Cc}
    Click Element    xpath=//*[@id="select2-TblCtbFacturas_id_sucursal-container"]
    Click Element    xpath=//*[@id="TblCtbFacturas_id_sucursal"]/option[8]
    Click Element    xpath=//*[@id="select2-TblCtbFacturas_id_sucursal-container"]
    Click Button    xpath=//*[@id="TblCtbFacturas-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por CTB
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[2]/input    1
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[7]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1

C003 Filtrar búsqueda por Tipo de Administración de facturas
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[6]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Iva Agenciamiento

C004 Filtar busqueda por numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[47]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1305052501

C005 Filtar busqueda por Ciudad Destino
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[34]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Amazonas

C006 Filtrar búsqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[92]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	BASEBOG

C007 Filtrar búsqueda por CC
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[7]/input    26601
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	26601

C008 Visualizar los detalles de la administración de Facturas
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Actualizar administración de facturas
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbFacturas-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFacturas-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C010 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    Click Element    xpath=//*[@id="TblCtbFacturas-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Inactivo
    Close Browser
    


