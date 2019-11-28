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
    Sleep    1s
    Click Element    xpath=//a[contains(.," Producto\n")][1]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse85"]/div/ul/li[1]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}


C001 Clonar Producto
    Input Text    xpath=//*[@id="num_doc_cli"]    LINEALES BAJA II 2013 5N AD
    Wait Until Element Is Visible    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[1]/ul/li/a/strong    ${Tme_load}
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[1]/ul/li/a/strong
    ${Producto}   Generate random string    8    123456789
    Input Text    xpath=//*[@id="nombreProducto"]    Prueba clonar Producto ${Producto}
    Click Element    xpath=//*[@id="contentFiltro"]/div/div/div[2]/div/div[3]/button/i
    Wait Until Element Is Visible    xpath=/html/body/div[22]/h2    ${Tme_load}
    Click Button    xpath=/html/body/div[22]/div[7]/div/button
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser
