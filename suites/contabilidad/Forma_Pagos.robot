*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div[2]/div/div/a[1]/i


*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Contabilidad\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Agregar Nueva Cuenta
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbFpagos-form"]/div/div[4]/button    ${Tme_load}
    Input Text    xpath=//*[@id="TblCtbFpagos_id_ctb_interface"]    1
    Click Element    xpath=//*[@id="TblCtbFpagos-form"]/div/div[2]/div[2]/span/span[1]/span
    Click Element    xpath=//*[@id="TblCtbFpagos_id_dominio_forma_pago"]/option[4271]
    Click Element    xpath=//*[@id="TblCtbFpagos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por el codigo CTB
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    2
    Click Element    xpath=//*[@id="TblCtbFpagos-grid_c0_0"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2

C003 Filtrar búsqueda por forma de pago
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[1550]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C004 Filtar busqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[92]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C005 Filtar busqueda por numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C006 Visualizar los detalles de la administración de pagos
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Actualizar Pago
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbFpagos-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFpagos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblCtbFpagos-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Inactivo
    Close Browser
