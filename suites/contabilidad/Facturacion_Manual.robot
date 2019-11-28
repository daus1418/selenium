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
    Click Element    xpath=//*[@id="collapse106"]/div/ul/li[16]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Agregar nueva factura manual
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="formDetalleFactura"]/div[22]/button[1]    ${Tme_load}
    Click Element    xpath=//*[@id="fecha_vencimiento"]
    Click Element    xpath=//*[@id="formDetalleFactura"]/div[2]/div/div/div[1]/table/tbody/tr[5]/td[1]
    Input Text    xpath=//*[@id="num_doc_cli"]    1110507056
    Wait Until Element Is Visible    xpath=//*[@id="formDetalleFactura"]/div[6]/div/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="formDetalleFactura"]/div[6]/div/ul/li/a
    Input Text    xpath=//*[@id="tx_observaciones"]    Creacion de factura automatizacion de pruebas
    Click Element    xpath=//*[@id="aAddItem"]
    Wait Until Element Is Visible    xpath=//*[@id="ItemFacturaManual-form"]/div[12]/button[1]    ${Tme_load}
    Sleep    1s
    ${Item}   Generate random string    2    123456789
    Click Element    xpath=//*[@id="select2-selServicio-container"]
    Click Element    xpath=//*[@id="selServicio"]/option[${Item}]
    Click Element    xpath=//*[@id="select2-selServicio-container"]
    Input Text    xpath=//*[@id="descripcion"]    Agregación item prueba
    Input Text    xpath=//*[@id="vr_unit"]    50000
    Click Button    xpath=//*[@id="ItemFacturaManual-form"]/div[12]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="formDetalleFactura"]/div[22]/button[1]
    Sleep    1s
    Wait Until Element Is Visible    (// button [text () = "OK"])[1]    ${Tme_load}
    Sleep    1s
    Click Element    (// button [text () = "OK"])[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar búsqueda por numero de factura
    Wait Until Element Is not Visible    (// button [text () = "OK"])[1]    ${Tme_load}
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[2]/input    01-02-00020076
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	01-02-00020076

C003 Filtrar búsqueda por fecha de creación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[3]/input    2019
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2019

C004 Filtar busqueda por nit cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[4]/input    122190580
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	122190580

C005 Filtar busqueda por nombre cliente
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[5]/input    COLOMBIA TELECOMUNICACIONES
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	COLOMBIA TELECOMUNICACIONES

C006 Filtrar búsqueda por tipo de moneda
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	COP

C007 Filtrar búsqueda por tipo de valor
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[7]/input    5125662
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	5125662

C008 Visualizar los detalles de las Facturas
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Actualizar las factura
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblFacturasManuales-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="formDetalleFactura"]/div[22]/button    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="formDetalleFactura"]/div[22]/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
