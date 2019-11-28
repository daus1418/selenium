 *** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/a[3]/i


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Contabilidad\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[9]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nuevo tipo de pago
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbTpagos-form"]/div/div[4]/button    ${Tme_load}
    Input Text    xpath=//*[@id="TblCtbTpagos_id_ctb_interface"]    1
    Input Text    xpath=//*[@id="ciudad_origen"]    Adz
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbTpagos-form"]/div/div[2]/div[4]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblCtbTpagos-form"]/div/div[2]/div[4]/ul/li/a
    ${sucursal}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblCtbTpagos_id_sucursal-container"]
    Click Element    xpath=//*[@id="TblCtbTpagos_id_sucursal"]/option[${sucursal}]
    ${Cuenta}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblCtbTpagos_id_ctb_cuenta-container"]
    Click Element    xpath=//*[@id="TblCtbTpagos_id_ctb_cuenta"]/option[${Cuenta}]
    Click Button    xpath=//*[@id="TblCtbTpagos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por el codigo CTB
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[2]/select
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[2]/select/option[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C003 Filtrar búsqueda por tipo pago
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[8]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C004 Filtar busqueda por sucursal   
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[92]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C005 Filtrar Búsqueda por ciudad destino
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C006 Filtrar Busqueda por numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[165]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Filtrar búsqueda por Débito/Crédito
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Ver informacion de la administración de tipo pagos
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Actualizar administración de servicios
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbTpagos-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C010 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    Click Element    xpath=//*[@id="TblCtbTpagos-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser

