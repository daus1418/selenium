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
    Click Element    xpath=//*[@id="list"]/div[11]/div[1]/a/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse21"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar busqueda
    Sleep    1s
    Click Element    xpath=//*[@id="contentFiltro"]/div[1]/div/div[2]/div/div[1]/button
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltro"]/div[1]/div/div[2]/div/div[1]/div/ul/li[1]/label
    Click Element    xpath=//*[@id="ui-multiselect-combo_hotel-option-4"]
    Click Element    xpath=//*[@id="contentwrapper"]/div/div/div[1]/h3
    Click Element    xpath=//*[@id="contentFiltro"]/div[1]/div/div[2]/div/div[3]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    2s

C002 Asignar habitación
    Click Element    xpath=//*[@id="comboHabHotel2710657"]
    Click Element    xpath=//*[@id="comboHabHotel2710657"]/option[3]
    Sleep    1s
    Click Element    xpath=//*[@id="btnFinalGuardaHab"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s

C003 Cambiar la asignación
    Click Element    xpath=//*[@id="contentFiltro"]/div[1]/div/div[2]/div/div[3]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="comboHabHotel2710657"]
    Click Element    xpath=//*[@id="comboHabHotel2710657"]/option[3]
    Wait Until Element Is Visible    xpath=//*[@id="btnCambiar"]    ${Tme_load}
    Click Element    xpath=//*[@id="motivo_2710657"]
    Click Element    xpath=//*[@id="motivo_2710657"]/option[2]
    Input Text    xpath=//*[@id="comentario_2710657"]    Re asignacion de habitacion automatización de pruebas
    Click Element    xpath=//*[@id="btnCambiar"]
    Sleep    1s
    Click Element    xpath=//*[@id="btnFinalGuardaHab"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s

C004 Ver pasajeros
    Click Element    xpath=//*[@id="contentFiltro"]/div[1]/div/div[2]/div/div[3]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="resultBusquedaReservaHotelHab"]/tbody/tr[1]/td[13]/div/button
    Click Element    xpath=//*[@id="resultBusquedaReservaHotelHab"]/tbody/tr[1]/td[13]/div/ul/li[1]/a
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s

C005 ver informacion de la reserva
    Click Element    xpath=//*[@id="resultBusquedaReservaHotelHab"]/tbody/tr[1]/td[2]/a
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    click Element    xpath=//*[@id="tabCliente"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="cliente"]/div[2]/h4    ${Tme_load}
    click Element    xpath=//*[@id="tabCambios"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="cambios"]/div/table/thead/tr    ${Tme_load}
    
    click Element    xpath=//*[@id="tabCambiosTitular"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tcambiostitular"]/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabAuditoriaPasajeros"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=//*[@id="tauditoriapasajeros"]/thead/tr    ${Tme_load}
    click Element    xpath=//*[@id="tabComerciales"]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s

C006 ver informacion de vuelo (solo para vuelo charter de la aerolinea viva air)
    Click Element    xpath=//*[@id="resultBusquedaReservaHotelHab"]/tbody/tr[1]/td[4]/a
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser







