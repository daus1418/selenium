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
    Wait Until Element Is Visible    //*[@id="topNav"]/div/a/img
    Wait Until Element Is Visible    //a[contains(.,"Administracion\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Filtrar busqueda por medio del id Ciudad
    Sleep    1s
    Input Text    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[2]/input    104
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 
    Sleep    1s
    Page Should Contain    104

C002 Filtrar Búsqueda por medio del Nombre 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s 
    Input Text    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Cartagena
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[2]/input 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Page Should Contain    Cartagena

C003 Filtrar Búsqueda por pais
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[5]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Canadá

C004 Filtrar Búsqueda por medio del Codigo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[5]/input    BRA
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Page Should Contain    BRA

C005 Filtrar Búsqueda por medio Porcentaje Agy
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[6]/input    3.00
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Page Should Contain    3.00
   

C006 Filtrar busqueda por Iva Ctb
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[8]/input    19.00
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Page Should Contain    19.00

C007 Filtrar Búsqueda por medio de Cc
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[10]/input    22501
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Page Should Contain    22501


C008 Filtrar Búsqueda por Ciudad Venta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[11]/select
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[11]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Page Should Contain    Ciudad venta/otros

C009 Filtrar Búsqueda por Destino gravado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[12]/select
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[12]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Page Should Contain    si

C010 Filtrar Búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[12]/select
    click Element    xpath=//*//*[@id="TblCiudades-grid"]/div[2]/table/thead/tr[2]/td[13]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Page Should Contain    Activo

C011 Ver detalles de la ciudad
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCiudades-grid"]/div[2]/table/tbody/tr[1]/td[14]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C012 Crear nueva ciudad
    Sleep    1s
    click Element    xpath=${Re_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]
    Sleep    1s
    ${PO_Number}   Generate random string    4    0123456789
    Input Text    xpath=//*[@id="TblCiudades_nombre"]   Ciudad Prueba2 ${PO_Number}
    click Element    xpath=//*[@id="select2-TblCiudades_id_pais-container"]
    click Element    xpath=//*[@id="TblCiudades_id_pais"]/option[26]
    click Element    xpath=//*[@id="select2-TblCiudades_id_pais-container"]
    Input Text    xpath=//*[@id="TblCiudades_codigo"]    PR2
    Input Text    xpath=//*[@id="TblCiudades_cc"]    222222
    click Element    xpath=//*[@id="TblCiudades-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Close Browser

