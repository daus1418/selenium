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
    Click Element    xpath=//*[@id="collapse11"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear una nueva bolsa de descuento
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblBolsaDescuento_fecha_inicial"]
    Click Element    xpath=//*[@id="bolsa"]/div[1]/div[1]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="bolsa"]/div[1]/div[1]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="TblBolsaDescuento_fecha_final"]
    Click Element    xpath=//*[@id="bolsa"]/div[1]/div[2]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="bolsa"]/div[1]/div[2]/div/div[1]/table/tbody/tr[5]/td[2]
    Input Text    xpath=//*[@id="tercero"]   Ter
    Wait Until Element Is Visible    xpath=//*[@id="bolsa"]/div[1]/div[3]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="bolsa"]/div[1]/div[3]/ul/li/a
    ${Valor_Monto}   Generate random string    5    0123456789
    Input Text    xpath=//*[@id="monto"]    ${Valor_Monto}
    Input Text    xpath=//*[@id="TblBolsaDescuento_valor_max_descuento"]    5
    Click Element    xpath=//*[@id="btnSend"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por fecha inicial
    Sleep    1s
    Click Element    xpath=${Re_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[2]/input    2017-10-02
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2017-10-02

C003 Filtrar búsqueda por fecha final
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[3]/input    2019-07-21
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2019-07-21

C004 Filtrar búsqueda por monto de la bolsa de descuentos
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[4]/input    1900000
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    $ 1,900,000

C005 Filtrar búsqueda por descuento
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[5]/input    50
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    50

C006 Filtrar búsqueda por identificación
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[6]/input    37946041
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    37946041

C007 Filtrar búsqueda por nombre
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[7]/input    JANETH
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    JANETH

C008 Filtrar búsqueda por el estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C009 Ver detalles de la bolsa de descuentos 
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C010 Actualizar los datos de la bolsa de descuento
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblBolsaDescuento-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="TblBolsaDescuento_valor_max_descuento"]    10
    Click Element    xpath=//*[@id="btnSend"]
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    