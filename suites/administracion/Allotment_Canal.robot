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
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Hotel\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse12"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}

C001 Agregar un nuevo Allotment Canal
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Click Element    xpath=//*[@id="TblAllotmentCanal_fecha_inicio"]    
    Click Element    xpath=//*[@id="TblAllotmentCanal-form"]/fieldset/div[1]/div/div[1]/table/tbody/tr[4]/td[2]
    Sleep    1s
    Click Element    xpath=//*[@id="TblAllotmentCanal_fecha_fin"]   
    Click Element    xpath=//*[@id="TblAllotmentCanal-form"]/fieldset/div[2]/div/div[1]/table/tbody/tr[5]/td[4]
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanal_dias_vencimiento"]   1
    Click Element    xpath=//*[@id="select2-id_hotel-container"]
    Click Element    xpath=//*[@id="id_hotel"]/option[6]
    Click Element    xpath=//*[@id="select2-id_hotel-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="TblAllotmentCanal_id_hotel_acomodacion"]/option[2]
    Click Element    xpath=//*[@id="select2-TblAllotmentCanal_id_canal-container"]
    Click Element    xpath=//*[@id="TblAllotmentCanal_id_canal"]/option[3]
    Click Element    xpath=//*[@id="select2-TblAllotmentCanal_id_canal-container"]
      ##  xpath=//*[@id="TblAllotmentCanal_cantidad"]    10
    Click Element    xpath=//*[@id="TblAllotmentCanal-form"]/fieldset/div[8]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="guardar_alt"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="respondeDisp"]    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Time}


C002 Eliminar Allotment Canal 
    Sleep    1s
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/tbody/tr[1]/td[11]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=//*[@id="fakeLoader"]/div    ${Tme_load}
    Sleep    1s
    click Element    xpath=${Re_load}

C003 Filtrar búsqueda mediante Fecha creación
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[2]/input    2015-11-26 
    Click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2015-11-26

C004 Filtrar búsqueda por Fecha inicio
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[3]/input    2016-03-24
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2016-03-24

C005 Filtrar búsqueda por Fecha fin 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[4]/input    2016-03-10
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2016-03-10

C006 Filtar busqueda Dias de vencimiento
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[5]/input    20
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[4]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    20

C007 Filtar busqueda por canal
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[35]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Hoteles

C008 Filtrar busqueda por Hotel
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[83]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Hotel Onvacation Amazon

C009 Filtrar busqueda por acomodación 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[8]/select
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[8]/select/option[81]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    1X2+1 MAT (STD/OV)

C010 Filtrar busqueda por cantidad
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[9]/input    10
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    1X2+1 MAT (STD/OV)

C011 Filtrar busqueda por Estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[10]/select
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/thead/tr[2]/td[10]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C012 Visualizar los detalles 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblAllotmentCanal-grid"]/div[2]/table/tbody/tr[1]/td[11]/div/a[1]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser


        