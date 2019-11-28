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
    Sleep    1s
    Click Element    xpath=//a[contains(.," Terceros\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[7]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo pais
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4   ${Time}
    Click Element    xpath=//*[@id="select2-TblPaises_continente-container"]
    Click Element    xpath=//*[@id="TblPaises_continente"]/option[4]
    Input Text    xpath=//*[@id="TblPaises_nombre"]   Creacion Pais prueba 
    ${Codigo}   Generate random string    3    123456789
    Input Text    xpath=//*[@id="TblPaises_codigo"]    ${Codigo}
    Click Button    xpath=//*[@id="TblPaises-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]   ${Time}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por Nombre del país
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[2]/input   Alemania
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Alemania

C003 Filtrar Búsqueda por código del país
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[3]/input   BRA
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    BRA

C004 Filtrar Búsqueda por medio del continente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[4]/input   Europe
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Europe

C005 Filtrar Búsqueda por medio de la Región
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[5]/input   Caribbean
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Caribbean


C006 Filtrar Búsqueda por medio de la capital del país
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[6]/span
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[48]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Buenos Aires

C007 Filtrar Búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[7]/span
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C008 Ver detalles del pais 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Not Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Actualizar los datos del país
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Creacion
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/tbody/tr/td[8]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="TblPaises_nombre"]    Actualizacion pais prueba
    click Button    xpath=//*[@id="TblPaises-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C010 Inactivar pais
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Actualizacion
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblPaises-grid"]/div[2]/table/tbody/tr/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    
    




