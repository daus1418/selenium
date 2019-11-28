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
    Click Element    xpath=//a[contains(.," Terceros\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse11"]/div/ul/li[5]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar un Nuevo Asociación de Canal
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblTerceroCanal-form"]/div[2]/button    ${Tme_load}
    Input Text    xpath=//*[@id="terceroLabel"]    Hot
    Wait Until Element Is Visible    xpath=//*[@id="TblTerceroCanal-form"]/fieldset/div[1]/ul/li[1]/a    ${Tme_load}
    ${Tercero}   Generate random string    1    123456789
    click Element    xpath=//*[@id="TblTerceroCanal-form"]/fieldset/div[1]/ul/li[${Tercero}]/a
    ${Canal}   Generate random string    2    1234
    click Element    xpath=//*[@id="select2-TblTerceroCanal_id_canal-container"]
    click Element    xpath=//*[@id="TblTerceroCanal_id_canal"]/option[${Canal}]
    click Element    xpath=//*[@id="select2-TblTerceroCanal_id_canal-container"]
    click Element    xpath=//*[@id="TblTerceroCanal-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por identificación
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/thead/tr[2]/td[3]/input   211312331 
    click Element    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    

C003 Filtrar búsqueda por nombre del tercero
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/thead/tr[2]/td[4]/input   CARLOS 
    click Element    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/thead/tr[1]   ${Time}
    Page Should Contain    CARLOS

C004 Filtrar búsqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/thead/tr[2]/td[5]/input   Hoteles
    click Element    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/thead/tr[1]   ${Time}
    Page Should Contain    Hoteles

C005 Visualizar los detalles de la administración de terceros
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceroCanal-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[1]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
