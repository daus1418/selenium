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
    Click Element    xpath=//*[@id="collapse11"]/div/ul/li[6]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar un Nuevo Cliente
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="TblTerceros_nombre1"]    Cliente pruebas
    Input Text    xpath=//*[@id="TblTerceros_apellido1"]    Automatizacion
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_ident-container"]
    click Element    xpath=//*[@id="TblTerceros_id_dominio_ident"]/option[2]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_ident-container"]
    ${Numero_documento}   Generate random string    8    123456789
    Input Text    xpath=//*[@id="TblTerceros_identificacion"]    ${Numero_documento}
    Input Text    xpath=//*[@id="terceroLabel"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="personal"]/fieldset/div[12]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="personal"]/fieldset/div[12]/ul/li/a
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_genero-container"]
    click Element    xpath=//*[@id="TblTerceros_id_dominio_genero"]/option[2]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_genero-container"]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_estcivil-container"]
    click Element    xpath=//*[@id="TblTerceros_id_dominio_estcivil"]/option[2]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_estcivil-container"]
    ${Direccion}   Generate random string    2    123456789
    click Element    xpath=//*[@id="select2-direccion1-container"]
    click Element    xpath=//*[@id="direccion1"]/option[7]
    click Element    xpath=//*[@id="select2-direccion1-container"]
    Input Text    xpath=//*[@id="direccion2"]    ${Direccion}
    click Element    xpath=//*[@id="personal"]/fieldset/div[17]/div/div[1]/div[2]/div[1]/span/span[1]/span
    click Element    xpath=//*[@id="direccion3"]/option[2]
    click Element    xpath=//*[@id="personal"]/fieldset/div[17]/div/div[1]/div[2]/div[1]/span/span[1]/span
    Input Text    xpath=//*[@id="direccion4"]    ${Direccion}
    Input Text    xpath=//*[@id="direccion5"]    ${Direccion}
    click Element    xpath=//*[@id="personal"]/fieldset/div[17]/div/div[1]/div[3]/div[1]/span/span[1]/span
    click Element    xpath=//*[@id="direccion6"]/option[4]
    click Element    xpath=//*[@id="personal"]/fieldset/div[17]/div/div[1]/div[3]/div[1]/span/span[1]/span
    Input Text    xpath=//*[@id="direccion7"]    ${Direccion}
    Input Text    xpath=//*[@id="TblTerceros_email"]    Prueba@gmail.com
    ${Telefono}   Generate random string    7    123456789
    Input Text    xpath=//*[@id="TblTerceros_telefono1"]    ${Telefono}
    ${Celular}   Generate random string    10    123456789
    Input Text    xpath=//*[@id="TblTerceros_tel_movil"]    ${Celular}
    Input Text    xpath=//*[@id="terceroLabel2"]    Bog
    Wait Until Element Is Visible    xpath=//*[@id="personal"]/fieldset/div[25]/ul/li/a    ${Tme_load}
    click Element    xpath=//*[@id="personal"]/fieldset/div[25]/ul/li/a
    click Element    xpath=//*[@id="personal"]/div/input
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por codigo
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input   1341876
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    1341876

C003 Filtrar búsqueda por nombre del cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[3]/input   DANIELA 
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    DANIELA

C004 Filtrar búsqueda por número de identificación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[4]/input   24995474
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    24995474

C005 Filtrar búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C006 Visualizar los detalles del cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Actualizar los datos del cliente
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_estcivil-container"]
    click Element    xpath=//*[@id="TblTerceros_id_dominio_estcivil"]/option[3]
    click Element    xpath=//*[@id="select2-TblTerceros_id_dominio_estcivil-container"]
    Input Text    xpath=//*[@id="terceroLabel2"]    Med
    Wait Until Element Is Visible    xpath=//*[@id="personal"]/fieldset/div[25]/ul/li[1]/a    ${Tme_load}
    click Element    xpath=//*[@id="personal"]/fieldset/div[25]/ul/li[1]/a
    click Element    xpath=//*[@id="personal"]/div/input
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Eliminar cliente
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceros-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    close Browser