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
    Click Element    xpath=//a[contains(.," Reportes\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse2"]/div/ul/li[8]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Generar archivo excel de reporte de pagos
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    #Fecha inicial
    Click Element    xpath=//*[@id="fecha_ini"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div[1]/div/div[2]/div/div[1]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div[1]/div/div[2]/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]
    #Fecha final
    Click Element    xpath=//*[@id="fecha_fin"]
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div[1]/div/div[2]/div/div[2]/div/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="contentFiltroReporte"]/div[1]/div/div[2]/div/div[2]/div/div[1]/table/tbody/tr[5]/td[1]
    #Sucursal
    Click Element    xpath=//*[@id="select2-id_sucursal-container"]
    Click Element    xpath=//*[@id="id_sucursal"]/option[3]
    Click Element    xpath=//*[@id="select2-id_sucursal-container"]
    #Forma de pago
    Click Element    xpath=//*[@id="select2-id_forma_pago-container"]
    Click Element    xpath=//*[@id="id_forma_pago"]/option[2]
    Click Element    xpath=//*[@id="select2-id_forma_pago-container"]
    #Tipo de pago
    Click Element    xpath=//*[@id="select2-id_tipo_pago-container"]
    Click Element    xpath=//*[@id="id_tipo_pago"]/option[3]
    Click Element    xpath=//*[@id="select2-id_tipo_pago-container"]
    Click Button    xpath=//*[@id="contentFiltroReporte"]/div[1]/div/div[2]/div/div[6]/button[1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
    


    