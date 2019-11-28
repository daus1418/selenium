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
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Hotel\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse12"]/div/ul/li[8]/a
   Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear una nueva migración de habitaciones
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="TblCronHabitaciones-form"]/div/div[1]/div[1]/span/span[1]/span
    Click Element    xpath=//*[@id="TblCronHabitaciones_id_hotel"]/option[73]
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    Click Element    xpath=//*[@id="TblCronHabitaciones_fecha_ejecucion"]
    Click Element    xpath=//*[@id="TblCronHabitaciones-form"]/div/div[1]/div[2]/div/div[2]/div[1]/table/tbody/tr[5]/td[2]
    Click Element    xpath=//*[@id="TblCronHabitaciones_fecha_inicio"]
    Click Element    xpath=//*[@id="TblCronHabitaciones-form"]/div/div[1]/div[3]/div/div[2]/div[1]/table/tbody/tr[5]/td[3]
    Click Element    xpath=//*[@id="TblCronHabitaciones-form"]/div/div[2]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    //*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Eliminar cron Habitaciones selecionadas
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]    ${Tme_load}
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C003 Filtrar búsqueda por fecha de ejecución
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input    2019
    Click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2019

C004 Filtrar búsqueda por Fecha de entrada
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/input    2019-03-08
    Click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    2019-03-08

C005 Filtrar búsqueda por Hotel
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[79]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Hotel Onvacation Amazon 

C006 Filtrar búsqueda por Usuario
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[5]/input    JOSE
    click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    JOSE
    
C007 Filtrar búsqueda por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[4]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Procesado

C008 Visualizar los detalles de las habitaciones
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCronHabitaciones-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Close Browser


    

