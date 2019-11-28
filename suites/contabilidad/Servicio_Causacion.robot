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
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nuevo servicio causacion
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbServiciosCausacion-form"]/div/div[2]/div[3]/button    ${Tme_load}
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-form"]/div/div[2]/div[1]/div[1]/span/span[1]/span
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion_id_servicio"]/option[7]
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-form"]/div/div[2]/div[1]/div[1]/span/span[1]/span
    ${Cc}   Generate random string    9    123456789
    Input Text    xpath=//*[@id="TblCtbServiciosCausacion_cc"]    ${Cc}
    Input Text    xpath=//*[@id="ciudad"]    San Andres Islas
    click Element    xpath=//*[@id="TblCtbServiciosCausacion-form"]/div/div[2]/div[1]/div[7]/span/span[1]/span
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion_estado"]/option[2]
    Click Button    xpath=//*[@id="TblCtbServiciosCausacion-form"]/div/div[2]/div[3]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por el id
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[2]/input    3
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[6]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	3

C003 Filtrar búsqueda por Tipo de servicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[6]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Acuario Adz

C004 Filtar busqueda por ciudad
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	San Andrés Islas

C005 Filtar busqueda por hotel  
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[17]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Hotel Blue Cove

C006 Filtrar búsqueda por Cc
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[6]/input    03880401
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	03880401

C007 Visualizar los detalles de la causacion
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/tbody/tr[2]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Actualizar causacion
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbServiciosCausacion-form"]/div/div[2]/div[3]/button    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-form"]/div/div[2]/div[3]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    Click Element    xpath=//*[@id="TblCtbServiciosCausacion-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Inactivo
    Close Browser
    


