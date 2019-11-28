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
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[13]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nuevo documento
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblDocumentos-form"]/div/div[22]/button    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-TblDocumentos_id_dominio_tipodoc-container"]
    Click Element    xpath=//*[@id="TblDocumentos_id_dominio_tipodoc"]/option[8]
    Click Element    xpath=//*[@id="select2-TblDocumentos_id_dominio_tipodoc-container"]
    Input Text    xpath=//*[@id="TblDocumentos_codigo"]    FACBOG
    ${Consecutivo}    Generate random string    5    123456789
    Input Text    xpath=//*[@id="TblDocumentos_consecutivo"]    ${Consecutivo}
    ${Sucursal}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblDocumentos_id_sucursal-container"]
    Click Element    xpath=//*[@id="TblDocumentos_id_sucursal"]/option[${Sucursal}]
    Click Element    xpath=//*[@id="select2-TblDocumentos_id_sucursal-container"]
    ${Fuente}   Generate random string    2    123456789
    Input Text    xpath=//*[@id="TblDocumentos_fuente"]    ${Fuente}
    ${Serie}   Generate random string    2    123456789
    Input Text    xpath=//*[@id="TblDocumentos_serie"]    ${Serie}
    Click Element    xpath=//*[@id="select2-TblDocumentos_id_formato-container"]
    Click Element    xpath=//*[@id="TblDocumentos_id_formato"]/option[3]
    Click Element    xpath=//*[@id="select2-TblDocumentos_estado-container"]
    Click Element    xpath=//*[@id="TblDocumentos_id_formato"]/option[3]
    Click Element    xpath=//*[@id="TblDocumentos_estado"]/option[2]
    Click Element    xpath=//*[@id="select2-TblDocumentos_estado-container"]
    Click Button    xpath=//*[@id="TblDocumentos-form"]/div/div[22]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por el codigo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    20
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	20

C003 Filtrar búsqueda por tipo de documento
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C004 Filtrar Búsqueda por codigo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[4]/input    RCBOG
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	RCBOG

C005 Filtrar Busqueda por consecutivo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[5]/input    537051
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	537051

C006 Filtrar búsqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[92]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Filtrar Busqueda por fuente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[7]/input    2
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2

C008 Filtrar Busqueda por Serie
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[8]/input    10
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	10

C009 Filtrar Busqueda por Formato
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[9]/select
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[9]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C010 Filtrar Busqueda por Estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[10]/select
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/thead/tr[2]/td[10]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Inactivo

C011 Ver informacion del documento
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/tbody/tr[1]/td[11]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C012 Actualizar documento
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblDocumentos-grid"]/div[2]/table/tbody/tr[1]/td[11]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblDocumentos-form"]/div/div[22]/button
    Sleep    1s
    Click Element    xpath=//*[@id="TblDocumentos-form"]/div/div[22]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    

