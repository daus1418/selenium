*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/a[1]/i

*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    //a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Vuelos\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse26"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar una nueva clase
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${PO_Number}    Generate random string    3    0123456789
    Input Text    xpath=//*[@id="TblClases_clase"]    PC(PRIMERA CLASE)${PO_Number}
    ${valor}    Generate random string    4    0123456789
    Input Text    xpath=//*[@id="TblClases_valor"]    ${PO_Number}
    Click Element    xpath=//*[@id="select2-TblClases_id_tipo_moneda-container"]
    Click Element    xpath=//*[@id="TblClases_id_tipo_moneda"]/option[3]
    Click Element    xpath=//*[@id="TblClases-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por el nombre de la clase
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[2]/input    PC (PRIMERA CLASE)
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    PC (PRIMERA CLASE)

C003 Filtrar búsqueda por valor
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[3]/input    255000.00
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    255000.00

C004 Filtrar búsqueda tipo de moneda
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    DOLLAR

C005 Filtrar búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C006 Visualizar los detalles de las clases
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[1]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C007 Actualizar los datos de la clase
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[2]/input    PC(PRIMERA CLASE)
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblClases-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]    ${Tme_load}
    ${nuevo_valor}    Generate random string    5    0123456789
    Input Text    xpath=//*[@id="TblClases_valor"]    ${nuevo_valor}
    Click Element    xpath=//*[@id="TblClases-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    
