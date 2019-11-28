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
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s             
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[11]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nuevo Impuesto de vuelo
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbVuelosImpuestos-form"]/div/div[4]/button
    Input Text    xpath=//*[@id="TblCtbVuelosImpuestos_id_ctb_interface"]    2
    Input Text    xpath=//*[@id="num_doc_cli"]    890100577
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbVuelosImpuestos-form"]/div/div[2]/div[2]/ul/li[1]/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-form"]/div/div[2]/div[2]/ul/li[1]/a
    Input Text    xpath=//*[@id="ciudad_origen"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbVuelosImpuestos-form"]/div/div[2]/div[4]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-form"]/div/div[2]/div[4]/ul/li/a
    Click Element    xpath=//*[@id="select2-TblCtbVuelosImpuestos_id_ciudad_destino-container"]
    ${Destino}   Generate random string    1    123456789
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos_id_ciudad_destino"]/option[${Destino}]
    ${Cuenta}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblCtbVuelosImpuestos_id_ctb_cuenta-container"]
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos_id_ctb_cuenta"]/option[${Cuenta}]
    Click Button    xpath=//*[@id="TblCtbVuelosImpuestos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por el codigo CTB
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    1
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1

C003 Filtrar búsqueda por ciudad origen
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[5]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C004 Filtrar Búsqueda por numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[172]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C005 Filtrar Busqueda por proveedor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C006 Filtrar búsqueda por viajada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Ver informacion de la administración de impuestos de vuelos
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Actualizar administración de servicios
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbVuelosImpuestos-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="TblCtbVuelosImpuestos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblCtbVuelosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Activo
    Close Browser
