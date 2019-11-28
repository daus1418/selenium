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
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[5]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nueva Cuenta
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCtbHoteles-form"]/div/div[4]/button    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbHoteles_id_ctb_interface"]    1
    ${CC}   Generate random string    9    123456789
    Click Button    xpath=//*[@id="TblCtbHoteles-form"]/div/div[4]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por el codigo CTB
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[2]/input    2
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[5]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2

C003 Filtrar búsqueda por hotel
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[82]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    

C004 Filtar busqueda numero de cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[243]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C005 Filtar busqueda por Cc
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[5]/input    03910101
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	03910101

C006 Filtrar búsqueda por reserva viajada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    
C007 Visualizar los detalles de la administracion de Hoteles
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C008 Actualizar cuenta
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Filtrar búsqueda por medio del estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    Click Element    xpath=//*[@id="TblCtbHoteles-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    		Inactivo
    Close Browser
    