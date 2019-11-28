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
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[13]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear una nueva locacion
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    ${Valor}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblLocaciones_nombre"]    Creacion locacion prueba ${Valor} 
    click Element    xpath=//*[@id="select2-TblLocaciones_id_ciudad-container"]
    click Element    xpath=//*[@id="TblLocaciones_id_ciudad"]/option[108]
    click Element    xpath=//*[@id="select2-TblLocaciones_id_ciudad-container"]
    click Element    xpath=//*[@id="select2-TblLocaciones_id_sucursal-container"]
    click Element    xpath=//*[@id="TblLocaciones_id_sucursal"]/option[8]   
    click Element    xpath=//*[@id="select2-TblLocaciones_id_sucursal-container"]
    click Element    xpath=//*[@id="TblLocaciones-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por nombre
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblLocaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input   TINTAL PLAZA CENTRO COMERCIAL
    click Element    xpath=//*[@id="TblLocaciones-grid_c0_0"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    TINTAL PLAZA CENTRO COMERCIAL

C003 Filtrar búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblLocaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    click Element    xpath=//*[@id="TblLocaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C004 Ver detalles de la locación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblLocaciones-grid"]/div[2]/table/tbody/tr[1]/td[4]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C005 Actualizar locación
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblLocaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Creacion locacion prueba
    click Element    xpath=//*[@id="TblLocaciones-grid_c0_0"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblLocaciones-grid"]/div[2]/table/tbody/tr[1]/td[4]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    click Element    xpath=//*[@id="select2-TblLocaciones_estado-container"]
    click Element    xpath=//*[@id="TblLocaciones_estado"]/option[2]
    click Button    xpath=//*[@id="TblLocaciones-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C006 inactivar Locación
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblLocaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Creacion locacion prueba
    click Element    xpath=//*[@id="TblLocaciones-grid_c0_0"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblLocaciones-grid"]/div[2]/table/tbody/tr[1]/td[4]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser

