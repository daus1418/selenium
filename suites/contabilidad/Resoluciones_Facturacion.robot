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
    Click Element    xpath=//a[contains(.,"Contabilidad\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[15]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar Nueva resolución
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblResFacturacion-form"]/div/div[2]/button    ${Tme_load}
    ${Num_Resolucion}   Generate random string    12    123456789
    Input Text    xpath=//*[@id="TblResFacturacion_num_resolucion"]    ${Num_Resolucion}
    Click Element    xpath=//*[@id="TblResFacturacion_fecha_exp"]
    Click Element    xpath=//*[@id="TblResFacturacion-form"]/div/div[1]/div[2]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="TblResFacturacion_fecha_inicio"]
    Click Element    xpath=//*[@id="TblResFacturacion-form"]/div/div[1]/div[3]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="TblResFacturacion-form"]/div/div[1]/div[3]/div/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="TblResFacturacion_fecha_fin"]
    Click Element    xpath=//*[@id="TblResFacturacion-form"]/div/div[1]/div[4]/div/div[1]/table/tbody/tr[5]/td[1]
    Input Text    xpath=//*[@id="TblResFacturacion_rango_inicio_legal"]    1
    Input Text    xpath=//*[@id="TblResFacturacion_rango_fin_legal"]    1000
    ${No_Res_Grandes_Cont}   Generate random string    5    123456789
    Input Text    xpath=//*[@id="TblResFacturacion_num_resolucion_grandes_contribuyentes"]    0${No_Res_Grandes_Cont}
    Click Element    xpath=//*[@id="TblResFacturacion_fec_resolucion_grandes_contribuyentes"]
    Click Element    xpath=//*[@id="TblResFacturacion-form"]/div/div[1]/div[9]/div/div[1]/table/tbody/tr[2]/td[1]
    Input Text    xpath=//*[@id="TblResFacturacion_fuente_aplica"]    01
    Input Text    xpath=//*[@id="TblResFacturacion_prefijo"]    70
    Input Text    xpath=//*[@id="TblResFacturacion_texto"]    Creacion resolucion Automatizacion de pruebas
    Click Button    xpath=//*[@id="TblResFacturacion-form"]/div/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por numero de resolución
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblResFacturacion[num_resolucion]    12345678894
    Click Element    name=TblResFacturacion[fuente_aplica]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	12345678894

C003 Filtrar búsqueda por Fecha Expedición
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblResFacturacion[fecha_exp]    2017
    Click Element    name=TblResFacturacion[fuente_aplica]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2017

C004 Filtrar Búsqueda por fecha de inicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblResFacturacion[fecha_inicio]    2018
    Click Element    name=TblResFacturacion[fuente_aplica]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2018

C005 Filtrar Busqueda por fecha fin
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblResFacturacion[fecha_fin]    2020
    Click Element    name=TblResFacturacion[fuente_aplica]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2020

C006 Filtrar búsqueda por fuente a la cual aplica
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblResFacturacion[fuente_aplica]    01
    Click Element    name=TblResFacturacion[num_resolucion]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	01

C007 Filtrar Busqueda por prefijo
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblResFacturacion[prefijo]    77
    Click Element    name=TblResFacturacion[num_resolucion]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	77

C008 Filtrar Busqueda por sucursal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    name=TblResFacturacion[id_sucursal]
    Click Element    xpath=//*[@id="TblResFacturacion-grid"]/div[2]/table/thead/tr[2]/td[9]/select/option[94]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Tour Vacation Bogota Principal

C009 Filtrar Busqueda por Estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    name=TblResFacturacion[estado]
    Click Element    xpath=//*[@id="TblResFacturacion-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Activo

C010 Ver información resolución facturación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblResFacturacion-grid"]/div[2]/table/tbody/tr[1]/td[10]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C011 Editar resolución
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblResFacturacion-grid"]/div[2]/table/tbody/tr[1]/td[10]/div/a[2]
    Wait Until Element Is Visible    xpath=//*[@id="TblResFacturacion-form"]/div/div[2]/button
    Sleep    1s
    Click Element    xpath=//*[@id="TblResFacturacion-form"]/div/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
