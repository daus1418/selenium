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
    Click Element    xpath=//*[@id="collapse1"]/div/ul/li[3]/a
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C001 Agregar un nuevo Cron Destinatario
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="add"]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Time}
    Input Text    xpath=//*[@id="nombre"]    info@onvacation
    click Element    xpath=//*[@id="select2-TblCronDestinatarios_id_dominio_cron-container"]
    click Element    xpath=//*[@id="TblCronDestinatarios_id_dominio_cron"]/option[3]
    click Element    xpath=//*[@id="select2-TblCronDestinatarios_id_dominio_cron-container"]
    click Element    xpath=//*[@id="TblCronDestinatarios-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C002 Eliminar Cron Destinatarios Seleccionados
    Sleep    2s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblCronDestinatarios[email]    ccassantit@onzacation.com
    click Element    name=TblCronDestinatarios[id_cron_destinatario]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblCronDestinatarios-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[3]/i
    Wait Until Element Is Visible    (// button [text () = "Si , Eliminar!"]) [1]    ${Time}
    Sleep    1s
    click button    (// button [text () = "Si , Eliminar!"]) [1]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    

C003 Filtrar búsqueda mediante el id del cron destinatario
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblCronDestinatarios[id_cron_destinatario]    860
    click Element    name=TblCronDestinatarios[email]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    860

C004 Filtrar búsqueda por Tercero
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblCronDestinatarios[id_tercero]   YONATHAN
    click Element    name=TblCronDestinatarios[id_cron_destinatario]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    YONATHAN

C005 Filtrar búsqueda por Email
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    name=TblCronDestinatarios[email]   ccassantit@onzacation.com
    click Element    name=TblCronDestinatarios[id_cron_destinatario]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    ccassantit@onzacation.com

C006 Filtar busqueda por dominio 
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    name=TblCronDestinatarios[id_dominio_cron]   
    click Element    xpath=//*[@id="TblCronDestinatarios-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[9]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Informe Ocupacion

C007 Filtar Cron destinatario por estado
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    name=TblCronDestinatarios[estado]
    click Element    xpath=//*[@id="TblCronDestinatarios-grid"]/div[2]/table/thead/tr[2]/td[7]/select/option[2]
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Page Should Contain    Inactivo

C008 Visualizar Los datos del cron destinatario
    Sleep    1s
    click Element    xpath=${Re_load}
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s   
    click Element    xpath=//*[@id="TblCronDestinatarios-grid"]/div[2]/table/tbody/tr[1]/td[8]/div/a[1]/i
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4   ${Time}
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Close Browser

    
