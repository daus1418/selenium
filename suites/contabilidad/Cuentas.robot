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
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nueva Cuenta
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbCuentas-form"]/div/div[4]/button    ${Tme_load}
    Input Text    xpath=//*[@id="TblCtbCuentas_id_ctb_interface"]    1
    ${Cuenta}   Generate random string    9    123456789
    Input Text    xpath=//*[@id="TblCtbCuentas_cuenta"]    ${Cuenta}
    Input Text    xpath=//*[@id="TblCtbCuentas_descripcion"]    Creacion cuentas pruebas automaticas
    Input Text    xpath=//*[@id="TblCtbCuentas_atributos"]    RV
    Input Text    xpath=//*[@id="TblCtbCuentas_indcipitra"]    1
    Click Button    xpath=//*[@id="TblCtbCuentas-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por el codigo CTB 
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[2]/input    5
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	5

C003 Filtrar búsqueda por numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[3]/input    1105058817
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	1105058817

C004 Filtar busqueda por Descripción
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[4]/input    HOTEL MAGIC HILL
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	HOTEL MAGIC HILL

C005 Filtar busqueda por atributo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[5]/input    NC
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	NC

C006 Filtrar búsqueda por el INC
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[6]/input    2
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2

C007 Visualizar los detalles de la cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Actualizar cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[4]/input    Creacion cuentas pruebas automaticas
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbCuentas-form"]/div/div[4]/button
    ${Cuenta}   Generate random string    9    123456789
    Input Text    xpath=//*[@id="TblCtbCuentas_cuenta"]    ${Cuenta}
    Click Button    xpath=//*[@id="TblCtbCuentas-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
   

C009 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    click Element    xpath=//*[@id="TblCtbCuentas-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Inactivo
    Close Browser
