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
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//a[contains(.," Hotel\n")][1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse12"]/div/ul/li[7]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar una nueva habitación
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="select2-id_hotel-container"]
    Click Element    xpath=//*[@id="id_hotel"]/option[3]
    Click Element    xpath=//*[@id="select2-TblHabitaciones_id_hotel_acomodacion-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="TblHabitaciones_id_hotel_acomodacion"]/option[2]
    Click Element    xpath=//*[@id="select2-TblHabitaciones_id_hotel_acomodacion-container"]
    ${N_Habitacion}   Generate random string    3    0123456789
    Input Text    xpath=//*[@id="TblHabitaciones_num_habitacion"]    ${N_Habitacion}
    Click Element    xpath=//*[@id="guardar"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span


C002 Eliminar Habitaciones selecionadas
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[100]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="noty_center_layout_container"]    ${Tme_load}
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    

C003 Filtrar búsqueda por id
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input    3
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[5]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    3


C004 Filtrar búsqueda por hotel 
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[55]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Hotel Onvacation Caribbean

C005 Filtrar búsqueda por acomodación   
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[157]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    1X2 MAT (R)

C006 Filtrar búsqueda por numero de habitación
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[5]/input    206
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    206

C007 Filtrar búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C008 Visualizar los detalles de las habitaciones
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[1]/i

C009 Actualizar los datos de la habitación
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[100]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblHabitaciones-grid"]/div[2]/table/tbody/tr[1]/td[7]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="select2-TblHabitaciones_estado-container"]
    Click Element    xpath=//*[@id="TblHabitaciones_estado"]/option[1]
    Click Element    xpath=//*[@id="guardar"]
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser









