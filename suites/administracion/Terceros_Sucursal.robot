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
    Click Element    xpath=//a[contains(.," Terceros\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse11"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar un Nuevo Asociación de Sucursal
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosSucursales-form"]/div[2]/button
    Input Text    xpath=//*[@id="terceroLabel"]   Tour
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosSucursales-form"]/fieldset/div[1]/ul/li[1]/a
    click Element    xpath=//*[@id="TblTercerosSucursales-form"]/fieldset/div[1]/ul/li[1]/a
    click Element    xpath=//*[@id="select2-TblTercerosSucursales_id_sucursal-container"]
    ${sucursal}   Generate random string    2    123456789
    click Element    xpath=//*[@id="TblTercerosSucursales_id_sucursal"]/option[${sucursal}]
    click Element    xpath=//*[@id="select2-TblTercerosSucursales_id_sucursal-container"]
    click Element    xpath=//*[@id="TblTercerosSucursales-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por identificación
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[2]/td[3]/input   1037572473
    click Element    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[1]
    Page Should Contain    1037572473

C003 Filtrar búsqueda por nombre del tercero
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[2]/td[4]/input   ALEJANDRA
    click Element    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[1]
    Page Should Contain    ALEJANDRA

C004 Filtrar búsqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[2]/td[5]/input   Tour Vacation Pereira
    click Element    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[1]
    Page Should Contain    Tour Vacation Pereira

C005 Filtrar búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    click Element    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/thead/tr[1]
    Page Should Contain    Inactivo

C006 Visualizar los detalles de la administración de terceros
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTercerosSucursales-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    
