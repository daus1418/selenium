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
    Click Element    xpath=//a[contains(.,"Pago Aerolíneas\n")]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="collapse234"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Filtrar búsqueda por ciudad
    Sleep    1s
    Input Text    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Bogotá D.C.
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[3]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Bogotá D.C.

C003 Filtrar búsqueda por fecha inicial
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[3]/input    2019-01-01
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2019-01-01

C004 Filtar busqueda por fecha final
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[4]/input    2019-12-31
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	2019-12-31

C005 Filtar busqueda por valor
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Input Text    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[5]/input    15900
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[2]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	15900

C006 Filtrar búsqueda por destino
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[6]/select
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[6]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Internacional

C007 Filtrar búsqueda por estado
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[7]/select
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[3]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    	Activo

C008 Visualizar los detalles de las tasas aeroportuarias
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C009 Actualizar las tasas aeroportuarias
    Sleep    1s
    Click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[3]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-form"]/div[2]/button    ${Tme_load}
    Click Element    xpath=//*[@id="TblPagosAerolineasTasasAeroportuarias-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="success-note"]    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser