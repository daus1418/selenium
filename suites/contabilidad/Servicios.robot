*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/div/a[2]/i


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Contabilidad\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[7]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nuevo Servicio
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbServicios-form"]/div/div[4]/button
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbServicios_id_ctb_interface"]    1
    ${Servicio}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblCtbServicios_id_servicio-container"]
    Click Element    xpath=//*[@id="TblCtbServicios_id_servicio"]/option[${Servicio}]
    Input Text    xpath=//*[@id="ciudad_origen"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbServicios-form"]/div/div[2]/div[4]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblCtbServicios-form"]/div/div[2]/div[4]/ul/li/a
    ${Destino}   Generate random string    1    123456789
    Click Element    xpath=//*[@id="select2-TblCtbServicios_id_ciudad_destino-container"]
    Click Element    xpath=//*[@id="TblCtbServicios_id_ciudad_destino"]/option[${Destino}]
    Click Element    xpath=//*[@id="select2-TblCtbServicios_id_sucursal-container"]
    Click Element    xpath=//*[@id="TblCtbServicios_id_sucursal"]/option[2]
    Click Element    xpath=//*[@id="select2-TblCtbServicios_id_ctb_cuenta-container"]
    Click Element    xpath=//*[@id="TblCtbServicios_id_ctb_cuenta"]/option[2]
    ${CC}   Generate random string    9    123456789
    Input Text    xpath=//*[@id="TblCtbServicios_cc"]    ${CC}
    Click Element    xpath=//*[@id="TblCtbServicios-form"]/div/div[4]/button
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
    Input Text    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[2]/input    2
    Click Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[7]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2

C003 Filtrar búsqueda por servicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[8]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C004 Filtar busqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[92]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C005 Filtar busqueda por ciudad destino
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C006 Filtrar Búsqueda por numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[288]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Filtrar Busqueda por CC
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[7]/input    3880220
    Click Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	3880220

C008 Filtrar búsqueda por reserva viajada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    Click Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C010 Actualizar administración de servicios
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/tbody/tr[1]/td[10]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbServicios-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServicios-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C011 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    ClicK Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[9]/select
    ClicK Element    xpath=//*[@id="TblCtbServicios-grid"]/div[2]/table/thead/tr[2]/td[9]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Inactivo
    Close Browser
