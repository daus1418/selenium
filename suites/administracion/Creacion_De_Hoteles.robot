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
    Click Element    xpath=//a[contains(.," Hotel\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse12"]/div/ul/li[6]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C001 Agregar un nuevo hotel
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    ${PO_Number}   Generate random string    3    0123456789
    Input Text    xpath=//*[@id="TblTerceros_nombre1"]    Hotel Prueba ${PO_Number}
    ${Nit}   Generate random string    6    0123456789
    Input Text    xpath=//*[@id="TblTerceros_identificacion"]    ${Nit}-2
    Click Element    xpath=//*[@id="select2-pais2-container"]
    Click Element    xpath=//*[@id="pais2"]/option[11]
    Click Element    xpath=//*[@id="select2-pais2-container"]
    Click Element    xpath=//*[@id="select2-TblHoteles_id_dominio_categoria-container"]
    Click Element    xpath=//*[@id="TblHoteles_id_dominio_categoria"]/option[4]
    Click Element    xpath=//*[@id="select2-TblHoteles_id_dominio_categoria-container"]
    Click Element    xpath=//*[@id="TblHoteles_modo_cobro_2"]
    Input Text    xpath=//*[@id="TblHoteles_descripcion"]    Hotel creacion de Prueba
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceros_direccion"]    kr 30 #20-50
    Input Text    xpath=//*[@id="TblHoteles_nombre_contacto"]    Hotel prueba
    ${Telefono}   Generate random string    7    0123456789
    Input Text    xpath=//*[@id="TblHoteles_telefono"]    ${Telefono}
    Click Element    xpath=//*[@id="myTab"]/li[3]/a
    Sleep    1s
    Input Text    xpath=//*[@id="TblUsuarios_usuario"]    Usuario prueba
    Input Text    xpath=//*[@id="TblUsuarios_clave"]    123456
    Input Text    xpath=//*[@id="clave2"]    123456
    Click Element    xpath=//*[@id="usuario"]/fieldset/div[2]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Eliminar Hoteles selecionados
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Prueba
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/tbody/tr/td[6]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C003 Filtrar búsqueda por codigo
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[2]/input    19
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    19
    
C004 Filtrar búsqueda por hotel
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Hotel Blue Cove
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Hotel Blue Cove

C005 Filtrar búsqueda por proveedor
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[20]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    TOUR VACATION HOTELES AZUL SAS
    
C006 Filtrar búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo
    

C007 Visualizar los detalles del hotel
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[1]/i
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Actualizar los datos del hotel
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Prueba
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblHoteles-grid"]/div[2]/table/tbody/tr/td[6]/div/a[2]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="myTab"]/li[1]/a
    Sleep    1s
    ${Razon_Social}   Generate random string    6    0123456789
    Input Text    xpath=//*[@id="TblTerceros_razon_social"]    ${Razon_Social}
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Wait Until Element Is Visible    xpath=//*[@id="contacto"]/fieldset/div[2]/button
    Click Element    xpath=//*[@id="contacto"]/fieldset/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
