*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div[1]/div/div[2]/div/a[1]/i

*** Test Cases ***
Iniciar Sesion
    FN Login

Administrador Usuarios
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Usuarios\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse4"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}

C001 Filtar busqueda por medio del id de usuario  
    Sleep    1s
    Input Text    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[2]/input    2
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Page Should Contain    2

C002 Filtar Busqueda por medio del Nombre
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Sleep    1s
    Input Text    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Hotel Onvacation Caribbean
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Page Should Contain    Hotel Onvacation Caribbean

C003 Filtrar búsqueda por medio del usuario  
    Sleep    2s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Sleep    1s
    Input Text    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[4]/input   hotelbeach
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[2]/input 
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Page Should Contain    hotelbeach

C004 Filtrar búsqueda por Perfil 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Sleep    1s
    Input Text    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[5]/input    Hotel
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[2]/input 
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Page Should Contain    Hotel
    

C005 Filtrar búsqueda por Estado   
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Sleep    1s    
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[3] 
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}

C006 Visualizar los datos del usuario
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Sleep    1s   
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Sleep    1s
    Wait Until Element Is Visible    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[1]   ${Time}
    Wait Until Element Is Visible    xpath=//*[@id="myTab"]/li[2]/a    ${Time}
    click Element    xpath=//*[@id="myTab"]/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C007 Crear un nuevo usuario
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Sleep    1s
    Input Text    xpath=//*[@id="usuarioLabel"]    Hotel Onvacation Caribbean
    Wait Until Element Is Visible    xpath=//*[@id="TblUsuarios-form"]/fieldset/div/div[1]/div[2]/ul/li/a/strong    ${Time}
    click Element    xpath=//*[@id="TblUsuarios-form"]/fieldset/div/div[1]/div[2]/ul/li/a/strong
    click Element    xpath=//*[@id="select2-TblUsuarios_id_perfil-container"]
    click Element    xpath=//*[@id="TblUsuarios_id_perfil"]/option[27]
    click Element    xpath=//*[@id="select2-TblUsuarios_id_perfil-container"]
    ${PO_Number}   Generate random string    4    0123456789
    Input Text    xpath=//*[@id="TblUsuarios_usuario"]    Creacion de prueba ${PO_Number}
    Input Text    xpath=//*[@id="TblUsuarios_clave"]    123456 
    click Element    xpath=//*[@id="select2-TblTerceroCanal_id_canal-container"]
    click Element    xpath=//*[@id="TblTerceroCanal_id_canal"]/option[9]
    click Element    xpath=//*[@id="select2-TblTerceroCanal_id_canal-container"]
    click Element    xpath=//*[@id="btnGuardarPermisos"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]   ${Tme_load}
    Sleep    2s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}

C008 Actualizar Los datos del Usuario
    Sleep    1s
    Input Text    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[4]/input    Creacion de prueba 
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Sleep    1s
    click Element    xpath=//*[@id="TblUsuarios-grid"]/div[2]/table/tbody/tr/td[7]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="usuarioLabel"]
    Input Text    xpath=//*[@id="TblUsuarios_usuario"]    Act Creacion de prueba
    click Element    xpath=//*[@id="btnGuardarPermisos"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]   ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Close Browser
    
    
