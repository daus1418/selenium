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
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[8]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nuevo Impuesto de Servicio
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbServiciosImpuestos-form"]/div/div[4]/button
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbServiciosImpuestos_id_ctb_interface"]    1
    ${Servicio}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblCtbServiciosImpuestos_id_servicio-container"]
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos_id_servicio"]/option[${Servicio}]
    Input Text    xpath=//*[@id="ciudad_origen"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbServiciosImpuestos-form"]/div/div[2]/div[4]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-form"]/div/div[2]/div[4]/ul/li/a
    ${Destino}   Generate random string    1    123456789
    Click Element    xpath=//*[@id="select2-TblCtbServiciosImpuestos_id_ciudad_destino-container"]
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos_id_ciudad_destino"]/option[${Destino}]
    ${Sucursal}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblCtbServiciosImpuestos_id_sucursal-container"]
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos_id_sucursal"]/option[${Sucursal}]
    ${Cuenta}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblCtbServiciosImpuestos_id_ctb_cuenta-container"]
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos_id_ctb_cuenta"]/option[${Cuenta}]
    ${CC}   Generate random string    9    123456789
    Input Text    xpath=//*[@id="TblCtbServiciosImpuestos_cc"]    ${CC}
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por el codigo CTB
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    2
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[6]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2

C003 Filtrar búsqueda por servicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[1916]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C004 Filtar busqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[92]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C005 Filtrar Búsqueda por numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[94]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C006 Filtrar Busqueda por CC
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[6]/input    03910120
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	03910120

C007 Filtrar búsqueda por reserva viajada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Ver informacion de la administración de impuestos de servicios
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Actualizar administración de servicios
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbServiciosImpuestos-form"]/div/div[4]/button
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServiciosImpuestos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C0010 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    ClicK Element    xpath=//*[@id="TblCtbServiciosImpuestos-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Inactivo
    Close Browser
