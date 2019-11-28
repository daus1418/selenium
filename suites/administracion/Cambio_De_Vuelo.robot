*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Recursos/config/Recursos.robot

*** Test Cases ***

Iniciar Sesion
    FN Login

Menu desplegable
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    //a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.,"Administracion\n")]
    Sleep    1s
    Click Element    xpath=//a[contains(.," Vuelos\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse26"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Cambiar Vuelo
    Sleep    1s
    Input Text    xpath=//*[@id="id_reserva"]    778523
    Click Element    xpath=//*[@id="searchCambioVuelo"]/div/div[2]/button[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="resultTourConducto"]/thead/tr    ${Tme_load} 
    Click Element    xpath=//*[@id="resultTourConducto"]/tbody/tr/td[10]/div/a[2]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    2s
    Input Text    xpath=//*[@id="ciudad_origen-2125055"]    BOG
    Wait Until Element Is Visible    xpath=//*[@id="formBuscar-2125055"]/div[1]/ul/li/a    ${Tme_load}
    Click Element    xpath=//*[@id="formBuscar-2125055"]/div[1]/ul/li/a
    Sleep    1s
    Click Element    xpath=//*[@id="fecha_salida-2125055"]
    Click Element    xpath=//*[@id="formBuscar-2125055"]/div[2]/div/div[1]/table/tbody/tr[5]/td[2]
    Click Element    xpath=//*[@id="buscarVuelo-2125055"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="select2-2125055-container"]
    Click Element    xpath=//*[@id="2125050"]/option[2]
    Click Element    xpath=//*[@id="select2-2125055-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="formAgregar-2125055"]/div[2]/span
    Click Element    xpath=//*[@id="formAgregar-2125055"]/div[2]/select/option[2]
    Click Element    xpath=//*[@id="formAgregar-2125055"]/div[2]/span
    Input Text    xpath=//*[@id="num_pax-2125055"]    2
    Click Element    xpath=//*[@id="agregarVuelo-2125055"]
    Wait Until Element Is Visible    xpath=//*[@id="tabla_contenedor_vuelos-2125050"]/thead/tr[2]    ${Tme_load}
    Click Element    xpath=//*[@id="guardarVuelo-778523"]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Wait Until Element Is Visible    xpath=/html/body/div[23]/h2    ${Tme_load}
    click button    (// button [text () = "Cancelar"]) [1]
    Wait Until Element Is Visible    xpath=/html/body/div[23]/h2    ${Tme_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    


    