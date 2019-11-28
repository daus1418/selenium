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
    Click Element    xpath=//a[contains(.," Tesoreria\n")]
    Sleep    1s
    Click Element    xpath=//*[@id="collapse34"]/div/ul/li[15]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Crear nuevo Cron
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="TblCronLiquidacion-form"]/div[2]/div[2]/div/button    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="fecha_inicio"]
    Click Element    xpath=//*[@id="TblCronLiquidacion-form"]/div[2]/div[1]/div[1]/div/div[2]/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="TblCronLiquidacion-form"]/div[2]/div[1]/div[1]/div/div[2]/div[1]/table/tbody/tr[2]/td[1]
    Click Element    xpath=//*[@id="fecha_fin"]
    Click Element    xpath=//*[@id="TblCronLiquidacion-form"]/div[2]/div[1]/div[2]/div/div[2]/div[1]/table/thead/tr[1]/th[1]/i
    Click Element    xpath=//*[@id="TblCronLiquidacion-form"]/div[2]/div[1]/div[2]/div/div[2]/div[1]/table/tbody/tr[5]/td[1]
    Click Element    xpath=//*[@id="select2-TblCronLiquidacion_mes-container"]
    Click Element    xpath=//*[@id="TblCronLiquidacion_mes"]/option[7]
    Click Element    xpath=//*[@id="select2-TblCronLiquidacion_mes-container"]
    Click Element    xpath=//*[@id="select2-dia-container"]
    Click Element    xpath=//*[@id="dia"]/option[11]
    Click Element    xpath=//*[@id="select2-dia-container"]
    Input Text    xpath=//*[@id="time"]    11111
    Click Element    xpath=//*[@id="select2-TblCronLiquidacion_mes_meta-container"]
    Click Element    xpath=//*[@id="TblCronLiquidacion_mes_meta"]/option[3]
    Click Button    xpath=//*[@id="TblCronLiquidacion-form"]/div[2]/div[2]/div/button
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Sleep    1s
    Click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser






