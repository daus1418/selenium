*** Settings ***
Library           SeleniumLibrary
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/a[1]/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Administrador Usuarios
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Hotel\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse12"]/div/ul/li[4]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

*** Test Cases ***

C003 Filtrar búsqueda por el id
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[2]/input    25
    Click Element    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    25

C004 Filtrar búsqueda por Nombre
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Sheraton Bijao Beach Resort   
    Click Element    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Sheraton Bijao Beach Resort

C005 Filtrar búsqueda por acomodación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[4]/input     1
    Click Element    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    1

C006 Filtar busqueda por numero de pasajeros
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[5]/input    2
    Click Element    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[6]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2

C007 Filtar busqueda por cantidad 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[6]/input    10
    Click Element    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[7]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    10

C008 Filtar busqueda por Fecha inicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[7]/input    2015-06-03
    Click Element    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2015-06-03

C009 Filtar busqueda por Fecha Fin
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[8]/input    2015-06-08
    Click Element    xpath=//*[@id="TblTempordasModoCobro2-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2015-06-08
    Close Browser



