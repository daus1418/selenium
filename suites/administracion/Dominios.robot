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
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[8]/a
    Wait Until Element Is Visible    //*[@id="massdelete"]/i    ${Tme_load}

C001 Crear un nuevo Dominio
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="select2-TblDominios_id_dominio_padre-container"]
    Click Element    xpath=//*[@id="TblDominios_id_dominio_padre"]/option[46]
    ${Complemento_Nombre}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblDominios_nombre"]    Nuevo domino de prueba ${Complemento_Nombre}
    Input Text    xpath=//*[@id="TblDominios_descripcion"]    Creacion de un nuevo domio como automatizacion de pruebas 
    Click Element    xpath=//*[@id="TblDominios-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por id
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[2]/input   2
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2

C003 Filtrar Búsqueda por nombre
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[3]/input   Eliminar
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Eliminar

C004 Filtrar búsqueda por descripción
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[4]/input   Permisos
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Permisos

C005 Filtrar búsqueda por medio del dominio padre
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[16]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Canales

C006 Filtrar búsqueda por Fecha sistema
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[6]/input   2013-06-19 
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Filtrar Búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C008 Ver detalles del dominio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Time}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}



C009 Actualizar los datos del dominio
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=${Re_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Nuevo domino de prueba
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[3]/i
    Wait Until Element Is Not Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDominios_nombre"]    Actualizacion domino prueba 
    click Button    xpath=//*[@id="TblDominios-form"]/div[2]/button
    Wait Until Element Is Not Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    

C010 Inactivar Dominio
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=${Re_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Actualizacion
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblDominios-grid"]/div[2]/table/tbody/tr/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Close Browser
    







