*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div[1]/div[2]/div/div/a[1]/i

*** Test Cases ***
Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Filtrar busqueda por medio del id Banco
    Sleep    1s
    Input Text    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[2]/input    32
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    32
    Sleep    1s
    

C002 Filtrar Búsqueda por medio del Nombre
    click Element    xpath=${Re_load}
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[3]/input    BANCO HSBC
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    BANCO HSBC
    Sleep    1s
    

C003 Filtrar Búsqueda por medio del Codigo
    click Element    xpath=${Re_load}
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[4]/input    14
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    14
    Sleep    1s
    

C004 Filtrar Búsqueda por medio del numero de cuenta
    click Element    xpath=${Re_load}
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[5]/input    493009542
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    

C005 Filtrar Búsqueda por medio del estado  
    click Element    xpath=${Re_load}
    Sleep    1s       
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Sleep    1s
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo
    Sleep    1s
    

C006 Visualizar Los datos Banco
    click Element    xpath=${Re_load}
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s

C007 Crear nuevo Banco  
    click Element    xpath=${Re_load}
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Time}
    Sleep    1s
    ${PO_Number}   Generate random string    2    0123456789
    Input Text    xpath=//*[@id="TblBancos_nombre"]    Banco Prueba ${PO_Number}
    Input Text    xpath=//*[@id="TblBancos_codigo"]    ${PO_Number}
    click Element    xpath=//*[@id="TblBancos-form"]/fieldset/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s

C008 Actualizar Los datos del Banco
    click Element    xpath=${Re_load}
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[3]/input    Banco Prueba
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Sleep    1s
    click Element    xpath=//*[@id="TblBancos-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Time}
    Input Text    xpath=//*[@id="TblBancos_nombre"]    Act Banco Prueba
    click Element    xpath=//*[@id="TblBancos-form"]/fieldset/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser


