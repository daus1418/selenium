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
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Vuelos\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse26"]/div/ul/li[5]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nueva clase valor
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    ${clase}   Generate random string    2    1234
    Click Element    xpath=//*[@id="select2-TblClasesValor_id_clase-container"]
    Click Element    xpath=//*[@id="TblClasesValor_id_clase"]/option[${clase}]
    Click Element    xpath=//*[@id="select2-TblClasesValor_id_clase-container"]
    ${Valor_clase}   Generate random string    5    123456789
    Input Text    xpath=//*[@id="TblClasesValor_valor"]    ${Valor_clase}
    Click Element    xpath=//*[@id="fecha_inicio"]
    Click Element    xpath=//*[@id="TblClasesValor-form"]/fieldset/div[3]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="TblClasesValor-form"]/fieldset/div[3]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="fecha_fin"]
    Click Element    xpath=//*[@id="TblClasesValor-form"]/fieldset/div[4]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="TblClasesValor-form"]/fieldset/div[4]/div/div[1]/table/tbody/tr[5]/td[2]
    ${Moneda}   Generate random string    1    23
    Click Element    xpath=//*[@id="select2-TblClasesValor_id_tipo_moneda-container"]
    Click Element    xpath=//*[@id="TblClasesValor_id_tipo_moneda"]/option[${Moneda}]
    Click Element    xpath=//*[@id="TblClasesValor-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar busqueda por codigo
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input    3
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    3

C003 Filtrar Búsqueda por el nombre de la clase
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[46]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    E (Ejecutiva let)

C004 Filtrar Búsqueda por medio del valor
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[4]/input    255000.00
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    255000.0

C005 Filtrar Búsqueda por medio de la fecha inicio
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[5]/input    2014-06-11
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2014-06-11

C006 Filtrar Búsqueda por medio de la fecha fin
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[6]/input    2014-06-10
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2014-06-10

C007 Filtrar Búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C008 Filtrar Búsqueda por tipo moneda
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    DOLLAR

C009 Ver detalles de la clase 
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblClasesValor-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Close Browser
