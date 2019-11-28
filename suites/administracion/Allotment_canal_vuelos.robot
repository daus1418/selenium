*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Variable ***
${Re_load}    //*[@id="contentwrapper"]/div/div/div[2]/div/a[1]/i

*** Keywords ***
Vuelo Creado
    Click Element    (// button [text () = "OK"]) [1]

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Vuelos\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse26"]/div/ul/li[2]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear un nuevo allotment vuelo
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Input Text    xpath=//*[@id="ciudadOrigenLabel"]    BOG
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltro"]/div/div[2]/div[1]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltro"]/div/div[2]/div[1]/ul/li/a
    Input Text    xpath=//*[@id="ciudadDestinoLabel"]    ADZ
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltro"]/div/div[2]/div[2]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltro"]/div/div[2]/div[2]/ul/li/a
    Click Element    xpath=//*[@id="fechaSalidaVueloYield"]
    Click Element    xpath=//*[@id="contentFiltro"]/div/div[2]/div[3]/div/div[1]/table/thead/tr[1]/th[3]/i
    Click Element    xpath=//*[@id="contentFiltro"]/div/div[2]/div[3]/div/div[1]/table/tbody/tr[5]/td[3]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-vuelosYield-container"]
    Wait Until Element Is Visible    xpath=//*[@id="vuelosYield"]/option[2]
    Click Element    xpath=//*[@id="vuelosYield"]/option[2]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-vuelosYield-container"]
    Click Element    xpath=//*[@id="select2-vuelos_clase-container"]
    Click Element    xpath=//*[@id="vuelos_clase"]/option[2]
    Input Text    xpath=//*[@id="cantidad"]    1
    Input Text    xpath=//*[@id="dias_vencimiento"]    10
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Click Element    xpath=//*[@id="id_canal"]/option[38]
    Click Element    xpath=//*[@id="select2-id_canal-container"]
    Click Element    xpath=//*[@id="agregar_alt"]
    Wait Until Element Is Visible    xpath=//*[@id="filas_alt"]/tbody/tr/td[6]/a/i    ${Tme_load}
    Click Element    xpath=//*[@id="guardar_alt"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Be Visible    (// button [text () = "OK"]) [1]
    Run Keyword if    '${status}' == 'PASS'    Vuelo Creado
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C002 Filtrar busqueda por medio del id allotment
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input    4
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    4 

C003 Filtrar Búsqueda por medio del id vuelo
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[3]/input    8895
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    8895

C004 Filtrar Búsqueda por Origen
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[4]/input    Pereira
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Pereira

C005 Filtrar Búsqueda por medio del Destino
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[5]/input    Riohacha
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Riohacha

C006 Filtrar Búsqueda por medio del proveedor
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[6]/input    LAN
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    LAN

C007 Filtrar Búsqueda por medio de la fecha ida
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[7]/input    2016-06-04
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2016-06-04

C008 Filtrar Búsqueda por medio de la fecha regreso
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[8]/input    2016-06-07
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2016-06-07

C009 Filtrar Búsqueda por Clase
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[9]/input    Z (Ejecutiva adz)
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Z (Ejecutiva adz)

C010 Filtrar Búsqueda por Canal
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[10]/input    Interno
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Interno

C011 Filtrar Búsqueda por cantidad
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[11]/input    94
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    94

C012 Filtrar Búsqueda por días de vencimiento
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[12]/input    15
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    15

C013 Filtrar Búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[13]/select
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/thead/tr[2]/td[13]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Activo

C014 Ver detalles del Allotment vuelo
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblAllotmentCanalVuelo-grid"]/div[2]/table/tbody/tr[1]/td[14]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser

    