*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/div/a[1]/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
   
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//a[contains(.,"Usuarios\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse4"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    

C001 Filtrar busqueda por medio del id del Perfil
    Sleep    1s
    Input Text    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/thead/tr[2]/td[2]/input   2
    click Element    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2

C002 Filtrar Búsqueda por medio de la descripción
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/thead/tr[2]/td[3]/input   Hotel 
    click Element    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Hotel 

C003 Visualizar los detalles del perfil
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/tbody/tr[1]/td[4]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Time}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span


C004 Crear un nuevo perfil
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    ${PO_Number}   Generate random string    3    0123456789
    Input Text    xpath=//*[@id="TblPerfiles_descripcion"]    Perfil de prueba ${PO_Number}
    click Element    xpath=//*[@id="guardar"]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C005 Actualizar Los datos del Perfil
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/tbody/tr[1]/td[4]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    ${PO_Number}   Generate random string    3    0123456789
    Input Text    xpath=//*[@id="TblPerfiles_descripcion"]    Perfil de prueba ${PO_Number}
    click Element    xpath=//*[@id="guardar"]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Time}
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C006 Eliminar Perfil
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Perfil de prueba
    click Element    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblPerfiles-grid"]/div[2]/table/tbody/tr[1]/td[4]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]    ${Time}
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser





