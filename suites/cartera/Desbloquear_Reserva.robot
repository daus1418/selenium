*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/a[1]/i
${Codigo}    1042036
${Vendedor}    MELISSA
${Cliente}    YONATHAN


*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Cartera\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse56"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Filtrar búsqueda codigo
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[2]/input    ${Codigo}
    Click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por nombre de vendedor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[3]/input     ${Vendedor}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    ${Vendedor}
    

C003 Filtrar búsqueda por nombre del cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[4]/input     ${Cliente}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	${Cliente}

C004 Filtrar búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C005 Visualizar los detalles de la reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="tabCliente"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="cliente"]/div[2]/h4    ${Tme_load}
    click Element    xpath=//*[@id="tabCambios"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="cambios"]/div/table/thead/tr    ${Tme_load}
    
    click Element    xpath=//*[@id="tabCambiosTitular"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tcambiostitular"]/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabAuditoriaPasajeros"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tauditoriapasajeros"]/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabComerciales"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C006 Desbloquear la reserva
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[5]/select
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/thead/tr[2]/td[5]/select/option[9]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblReservas-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblReservas-form"]/div[2]/button    ${Tme_load}
    Click Button    xpath=//*[@id="TblReservas-form"]/div[2]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
