*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}        //*[@id="contentwrapper"]/div/div/div[2]/div/div/a[1]/i
                 

*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Contabilidad\n")]
    Sleep    1s             
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[10]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nuevo Servicio
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbVuelos-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbVuelos_id_ctb_interface"]    2
    Input Text    xpath=//*[@id="num_doc_cli"]    LAN
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbVuelos-form"]/div/div[2]/div[2]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblCtbVuelos-form"]/div/div[2]/div[2]/ul/li/a
    Click Element    xpath=//*[@id="select2-TblCtbVuelos_id_ciudad_destino-container"]
    Click Element    xpath=//*[@id="TblCtbVuelos_id_ciudad_destino"]/option[4]
    Click Element    xpath=//*[@id="select2-TblCtbVuelos_id_ciudad_destino-container"]
    ${sucursal}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-TblCtbVuelos_id_sucursal-container"]
    Click Element    xpath=//*[@id="TblCtbVuelos_id_sucursal"]/option[${sucursal}]
    Click Element    xpath=//*[@id="select2-TblCtbVuelos_id_sucursal-container"]
    ${CC}   Generate random string    5    123456789
    Input Text    xpath=//*[@id="TblCtbVuelos_cc"]    ${CC}
    Click Button    xpath=//*[@id="TblCtbVuelos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por el codigo CTB
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    4
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[5]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	4

C003 Filtrar búsqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[92]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C004 Filtar busqueda por numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[180]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C005 Filtar busqueda por ciudad destino
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[14]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C006 Filtrar Búsqueda por proveedor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[15]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Filtrar Busqueda por CC
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[5]/input    020501
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Filtrar búsqueda por opción viajada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Ver informacion de la administración de vuelos
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/tbody/tr[1]/td[10]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C010 Actualizar administración de vuelos
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/tbody/tr[1]/td[10]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbVuelos-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Click Button    xpath=//*[@id="TblCtbVuelos-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C011 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[9]/select
    Click Element    xpath=//*[@id="TblCtbVuelos-grid"]/div[2]/table/thead/tr[2]/td[9]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
