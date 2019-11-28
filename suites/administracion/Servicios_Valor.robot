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
    Sleep    1s
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[10]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}



C002 Filtrar búsqueda por servicio
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Seguro Hotelero
    Click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Seguro Hotelero

C003 Filtrar Búsqueda por valor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[3]/input   35000
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    35000.00

C004 Filtrar Búsqueda por Fecha inicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[4]/input   2018-05-21
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2018-05-21

C005 Filtrar Búsqueda por fecha fin
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[5]/input   2019-12-31
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2019-12-31

C006 Filtrar Búsqueda por moneda
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    DOLLAR

C007 Filtrar Búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C008 Ver detalles del servicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4   ${Time}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo Servicio Valor
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Input Text    xpath=//*[@id="servicio"]    Prue
    Wait Until Element Is Visible    xpath=//*[@id="TblServiciosValor-form"]/fieldset/div[1]/ul/li[1]/a
    Click Element    xpath=//*[@id="TblServiciosValor-form"]/fieldset/div[1]/ul/li[1]/a
    ${Valor}   Generate random string    6    123456789
    Input Text    xpath=//*[@id="TblServiciosValor_valor"]    ${Valor}
    Click Element    xpath=//*[@id="TblServiciosValor_fecha_ini"]
    Click Element    xpath=//*[@id="TblServiciosValor-form"]/fieldset/div[4]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="TblServiciosValor-form"]/fieldset/div[4]/div/div[1]/table/tbody/tr[3]/td[1]
    Click Element    xpath=//*[@id="TblServiciosValor_fecha_fin"]
    Click Element    xpath=//*[@id="TblServiciosValor-form"]/fieldset/div[5]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="TblServiciosValor-form"]/fieldset/div[5]/div/div[1]/table/tbody/tr[3]/td[2]
    Click Button    xpath=//*[@id="TblServiciosValor-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Actualizar los datos del servicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Prueba
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblServiciosValor-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]
    click Element    xpath=//*[@id="select2-TblServiciosValor_estado-container"]
    click Element    xpath=//*[@id="TblServiciosValor_estado"]/option[2]
    click Element    xpath=//*[@id="select2-TblServiciosValor_estado-container"]
    click Button    xpath=//*[@id="TblServiciosValor-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser



