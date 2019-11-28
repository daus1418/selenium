*** Settings ***
Library           SeleniumLibrary
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
    Click Element    xpath=//*[@id="collapse12"]/div/ul/li[3]/a

C001 Agregar una nueva Acomodación
    Sleep    1s
    Click Element    xpath=//*[@id="add"]/i
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones_nombre"]    Acomodacion Prueba 2
    Click Element    xpath=//*[@id="select2-TblAcomodaciones_id_dominio_clasehab-container"]
    Click Element    xpath=//*[@id="TblAcomodaciones_id_dominio_clasehab"]/option[6]
    Click Element    xpath=//*[@id="select2-TblAcomodaciones_id_dominio_clasehab-container"]
    Sleep    1s
    Click Element    xpath=//*[@id="select2-TblAcomodaciones_id_dominio_tipohab-container"]
    Click Element    xpath=//*[@id="TblAcomodaciones_id_dominio_tipohab"]/option[2]
    Click Element    xpath=//*[@id="select2-TblAcomodaciones_id_dominio_tipohab-container"]
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones_adl_max"]    2
    Input Text    xpath=//*[@id="TblAcomodaciones_adl_min"]    1
    Input Text    xpath=//*[@id="TblAcomodaciones_chd_max"]    2
    Input Text    xpath=//*[@id="TblAcomodaciones_chd_min"]    0
    Input Text    xpath=//*[@id="TblAcomodaciones_descripcion"]    Creación de acomodación prueba
    click button    xpath=//*[@id="TblAcomodaciones-form"]/div[2]/button
    Wait Until Element Is Visible    xpath=//*[@id="MyBsModal"]/div/div/div[1]/h4    ${Tme_load}  
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}

C003 Filtrar búsqueda por medio del nombre 
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input    Habitación Sencilla
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[5]/input  
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}     

C004 Filtrar búsqueda por clase de habitación  
    Sleep    2s
    click Element    xpath=${Re_load}   
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s    
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[3]/select/option[3] 
    Sleep    1s
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[5]/input 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}    

C005 Filtrar búsqueda por Tipo
    click Element    xpath=${Re_load}   
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s       
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[4]/select
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[4]/select/option[3] 
    Sleep    1s
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[5]/input
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 

C006 Filtar busqueda por el maximo de adultos 
    Sleep    1s
    click Element    xpath=${Re_load} 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[5]/input    4
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input  
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 

C007 Filtar busqueda por el minimo de adultos
    Sleep    1s
    click Element    xpath=${Re_load} 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[6]/input    2 
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 

C008 Filtrar busqueda por el numero maximo de niños
    Sleep    1s
    click Element    xpath=${Re_load} 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[7]/input    5 
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 

C009 Filtrar busqueda por el numero minimo de niños 
    Sleep    1s
    click Element    xpath=${Re_load} 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[8]/input    0 
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 

C010 Filtrar busqueda por el encargado del registro
    Sleep    1s
    click Element    xpath=${Re_load} 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[9]/input    calvarez 
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[2]/input 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 

C011 Filtrar busqueda por Estado
    Sleep    1s
    click Element    xpath=${Re_load} 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s       
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[10]/select
    Sleep    1s
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/thead/tr[2]/td[10]/select/option[2] 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 

C012 Visualizar los detalles de las acomodaciones
    Sleep    1s
    click Element    xpath=${Re_load} 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/tbody/tr[1]/td[11]/div/a[1]/i
    Sleep    1s
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load} 

C013 Actualizar los datos de las acomodaciones
    Sleep    1s
    click Element    xpath=${Re_load} 
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    Sleep    1s
    click Element    xpath=//*[@id="TblAcomodaciones-grid"]/div[2]/table/tbody/tr[1]/td[11]/div/a[3]/i
    Sleep    1s
    Input Text    xpath=//*[@id="TblAcomodaciones_adl_max"]    2
    Input Text    xpath=//*[@id="TblAcomodaciones_chd_max"]    1
    click Element    xpath=//*[@id="select2-TblAcomodaciones_estado-container"]
    click Element    xpath=//*[@id="TblAcomodaciones_estado"]/option[1] 
    click Element    xpath=//*[@id="select2-TblAcomodaciones_estado-container"]
    click Element    xpath=//*[@id="TblAcomodaciones-form"]/div[2]/button
    Wait Until Element Is Visible    //*[@id="success-note"]
    click Element    xpath=//*[@id="MyBsModal"]/div/div/div[1]/button/span
    Wait Until Element Is Not Visible    xpath=${load}    ${Tme_load}
    close Browser
