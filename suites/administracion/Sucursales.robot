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
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[12]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear una nueva sucursal
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="ciudad"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="TblSucursales-form"]/fieldset/div[1]/ul/li/a
    click Element    xpath=//*[@id="TblSucursales-form"]/fieldset/div[1]/ul/li/a
    ${Complemento}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblSucursales_codigo"]    Bog${Complemento}
    Input Text    xpath=//*[@id="TblSucursales_nombre"]    Sucursal prueba ${Complemento}
    Input Text    xpath=//*[@id="TblSucursales_direccion"]    ${Complemento}#${Complemento}
    ${Telefono}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="TblSucursales_telefono1"]    ${Telefono}
    Input Text    xpath=//*[@id="TblSucursales_email"]    correo${Complemento}@gmail.com 
    Input Text    xpath=//*[@id="ciudad2"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="TblSucursales-form"]/fieldset/div[10]/ul/li/a
    click Element    xpath=//*[@id="TblSucursales-form"]/fieldset/div[10]/ul/li/a
    click Button    xpath=//*[@id="TblSucursales-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar busqueda por medio del codigo de creación
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[2]/input   2
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2

C003 Filtrar Búsqueda por Ciudad 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[407]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Medellín

C004 Filtrar Búsqueda por medio del codigo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[4]/input    BASEPOL
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    BASEPOL

C005 Filtrar Búsqueda por medio del nombre
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[5]/input    Tour Vacation Bogota
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Tour Vacation Bogota

C006 Filtrar Búsqueda por medio de la direccion
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[6]/input    Cra 46 #94 - 73
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Cra 46 #94 - 73

C007 Filtrar Búsqueda por numero de telefono
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[7]/input    57 1 3104949
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    57 1 3104949

C008 Filtrar Búsqueda por Ciudad vuelo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[999]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Bogotá D.C.

C009 Filtrar Búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[9]/select
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[9]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C010 Ver detalles de la sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/tbody/tr[1]/td[10]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C011 Actualizar los datos de la sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[5]/input    Sucursal prueba
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblSucursales-grid"]/div[2]/table/tbody/tr[1]/td[10]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    ${Telefono_2}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="TblSucursales_telefono2"]    ${Telefono_2}
    click Button    xpath=//*[@id="TblSucursales-form"]/div[2]/button
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser








