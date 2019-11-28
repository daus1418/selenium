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
    Click Element    xpath=//*[@id="collapse11"]/div/ul/li[7]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar una nueva asociación de canal
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    ${Tercero}   Generate random string    1    123456789
    Input Text    xpath=//*[@id="terceroLabel"]    pru
    Wait Until Element Is Visible    xpath=//*[@id="TblTerceroCanalProducto-form"]/fieldset/div[1]/ul/li[1]/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblTerceroCanalProducto-form"]/fieldset/div[1]/ul/li[${Tercero}]/a
    Click Element    xpath=//*[@id="select2-TblTerceroCanalProducto_id_canal-container"]
    ${canal}   Generate random string    2    1234
    Click Element    xpath=//*[@id="TblTerceroCanalProducto_id_canal"]/option[${canal}]
    Click Element    xpath=//*[@id="select2-TblTerceroCanalProducto_id_canal-container"]
    Click Element    xpath=//*[@id="TblTerceroCanalProducto-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por identificación
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[2]/td[3]/input   51747095
    click Element    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Visible    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[1]   ${Time}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    51747095

C003 Filtrar búsqueda por nombre del tercero
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[2]/td[4]/input   MANUEL
    click Element    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Visible    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[1]   ${Time}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    MANUEL

C004 Filtrar búsqueda por canal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[2]/td[5]/input   Publico
    click Element    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Visible    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/thead/tr[1]   ${Time}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Publico

C005 Visualizar los detalles de la administración de terceros
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4   ${Time}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C006 Actualizar los datos de la Administracióne de Tercero canal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4   ${Time}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-TblTerceroCanalProducto_id_canal-container"]
    ${canal}   Generate random string    2    1234
    Click Element    xpath=//*[@id="TblTerceroCanalProducto_id_canal"]/option[${canal}]
    Click Element    xpath=//*[@id="select2-TblTerceroCanalProducto_id_canal-container"]
    Click Element    xpath=//*[@id="TblTerceroCanalProducto-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]   ${Time}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C007 Eliminar Tercero Canal Producto
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTerceroCanalProducto-grid"]/div[2]/table/tbody/tr[1]/td[6]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    





