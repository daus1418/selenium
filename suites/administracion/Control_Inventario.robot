*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div[1]/div/div[2]/div/a[1]/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Hotel\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse12"]/div/ul/li[5]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar un nuevo Registro
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    //*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="select2-TblControlInventario_id_hotel-container"]
    Click Element    xpath=//*[@id="TblControlInventario_id_hotel"]/option[5]
    Click Element    xpath=//*[@id="select2-TblControlInventario_id_hotel-container"]
    Click Element    xpath=//*[@id="TblControlInventario_fecha_inicio"]
    Click Element    xpath=//*[@id="TblControlInventario-form"]/fieldset/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    Sleep    1s
    Click Element    xpath=//*[@id="TblControlInventario_fecha_fin"]
    Click Element    xpath=//*[@id="TblControlInventario-form"]/fieldset/div[3]/div/div[1]/table/tbody/tr[5]/td[3]
    Input Text    xpath=//*[@id="TblControlInventario_numero_camas_perder"]    2
    Click Element    xpath=//*[@id="TblControlInventario-form"]/div[2]/button
    Wait Until Element Is Visible    //*[@id="MyBsModal"]/div/div/div[1]/h4
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C002 Filtrar búsqueda por hotel
    Sleep    1s
    Click Element    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/thead/tr[2]/td[2]/select
    Click Element    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/thead/tr[2]/td[2]/select/option[84]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Hotel Blue Cove

C003 Filtrar búsqueda por Fecha inicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/thead/tr[2]/td[3]/input    2016-10-04
    Click Element    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2016-10-04

C004 Filtrar búsqueda por fecha fin 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/thead/tr[2]/td[4]/input    2018-12-31
    Click Element    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2018-12-31

C005 Filtar control inventario por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Activo

C006 Visualizar Los datos del control de inventario
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblControlInventario-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser


    
