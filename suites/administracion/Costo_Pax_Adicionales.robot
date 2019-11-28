*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div[2]/div/a[1]/i

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Producto\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse85"]/div/ul/li[3]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo adicional
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4   ${Time}
    Sleep    1s
    ${Hotel}   Generate random string    2    123456789
    click Element    xpath=//*[@id="select2-TblCostoPaxAdiconal_id_hotel-container"]
    click Element    xpath=//*[@id="TblCostoPaxAdiconal_id_hotel"]/option[${Hotel}]
    click Element    xpath=//*[@id="select2-TblCostoPaxAdiconal_id_hotel-container"]
    click Element    xpath=//*[@id="TblCostoPaxAdiconal_fecha_inicio"]
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-form"]/fieldset/div[2]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-form"]/fieldset/div[2]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-form"]/fieldset/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    click Element    xpath=//*[@id="TblCostoPaxAdiconal_fecha_fin"]
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-form"]/fieldset/div[3]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-form"]/fieldset/div[3]/div/div[1]/table/thead/tr[1]/th[3]/i
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-form"]/fieldset/div[3]/div/div[1]/table/tbody/tr[5]/td[2]
    Input Text    xpath=//*[@id="TblCostoPaxAdiconal_valor_adulto"]    5000
    Input Text    xpath=//*[@id="TblCostoPaxAdiconal_valor_nino"]    2000
    click Element    xpath=//*[@id="select2-TblCostoPaxAdiconal_id_tipo_moneda-container"]
    click Element    xpath=//*[@id="TblCostoPaxAdiconal_id_tipo_moneda"]/option[3]
    click Element    xpath=//*[@id="select2-TblCostoPaxAdiconal_id_tipo_moneda-container"]
    click Button    xpath=//*[@id="TblCostoPaxAdiconal_enviar"]      
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]   ${Time}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por Hotel 
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[2]/select
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[2]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Hotel Blue Tone

C003 Filtrar Búsqueda por fecha inicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[3]/input    2018-03-30
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2018-03-30

C004 Filtrar Búsqueda por medio de la fecha fin
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[4]/input    2018-03-22
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2018-03-22

C005 Filtrar Búsqueda por tipo moneda
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    PESOS

C006 Ver detalles del adicional
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Actualizar los datos del adicional
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/thead/tr[1]   ${Time}
    click Element    xpath=//*[@id="TblCostoPaxAdiconal-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    click Element    xpath=//*[@id="select2-TblCostoPaxAdiconal_id_tipo_moneda-container"]
    click Element    xpath=//*[@id="TblCostoPaxAdiconal_id_tipo_moneda"]/option[2]
    click Element    xpath=//*[@id="select2-TblCostoPaxAdiconal_id_tipo_moneda-container"]
    click Element    xpath=//*[@id="TblCostoPaxAdiconal_enviar"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]   ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser





