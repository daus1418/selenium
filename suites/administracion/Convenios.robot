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
    Click Element    xpath=//*[@id="collapse11"]/div/ul/li[8]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo convenio
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Not Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="tercero"]    prueba
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosConvenios-form"]/fieldset/div[1]/ul/li[2]/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblTercerosConvenios-form"]/fieldset/div[1]/ul/li[2]/a
    Input Text    xpath=//*[@id="TblTercerosConvenios_descripcion"]    Creacion Convenio automatizacion de puebas 
    Input Text    xpath=//*[@id="TblTercerosConvenios_valor"]    5
    Click Element    xpath=//*[@id="select2-TblTercerosConvenios_id_dominio_categoria_producto-container"]
    ${producto}   Generate random string    1    23456789
    Click Element    xpath=//*[@id="TblTercerosConvenios_id_dominio_categoria_producto"]/option[${producto}]
    Click Element    xpath=//*[@id="TblTercerosConvenios_fecha_inicio"]
    Click Element    xpath=//*[@id="TblTercerosConvenios-form"]/fieldset/div[5]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="TblTercerosConvenios-form"]/fieldset/div[5]/div/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="TblTercerosConvenios_fecha_fin"]
    Click Element    xpath=//*[@id="TblTercerosConvenios-form"]/fieldset/div[6]/div/div[1]/table/thead/tr[1]/th[3]
    Click Element    xpath=//*[@id="TblTercerosConvenios-form"]/fieldset/div[6]/div/div[1]/table/tbody/tr[5]/td[2]
    Input Text    xpath=//*[@id="ciudad_destino"]    adz
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosConvenios-form"]/fieldset/div[7]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="TblTercerosConvenios-form"]/fieldset/div[7]/ul/li/a
    Sleep    1s
    Click Element    xpath=//*[@id="servicio_ciudad"]/option[2]
    Sleep    1s
    Click Element    xpath=//*[@id="agregarServicio"]
    Click Button    xpath=//*[@id="TblTercerosConvenios-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por identificación
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[2]/input   809008658
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    809008658

C003 Filtrar búsqueda por Nombre
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[3]/input   ESTILO
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    ESTILO

C004 Filtrar búsqueda por Valor (%)
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[4]/input   5
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    5

C005 Filtar busqueda por fecha de inicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[5]/input   2018-05-24
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2018-05-24

C006 Filtar busqueda por fecha fin
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[6]/input   2023-12-31
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2023-12-31

C007 Filtrar busqueda por Estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[1]   ${Time}
    Page Should Contain    Inactivo
    

C008 Filtrar busqueda por descripción
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[7]/input   CONVENIO CANAL COORPORATIVO
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    CONVENIO CANAL COORPORATIVO

C009 Visualizar los detalles del convenio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/tbody/tr[1]/td[9]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span

C010 Actualizar los datos del convenio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[7]/input   Creacion Convenio
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    click Element    xpath=//*[@id="TblTercerosConvenios-grid"]/div[2]/table/tbody/tr/td[9]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="TblTercerosConvenios_descripcion"]    Creacion Convenio automatizacion de puebas actualizacion
    Click Button    xpath=//*[@id="TblTercerosConvenios-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    
    



