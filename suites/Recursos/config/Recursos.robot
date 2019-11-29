*** Settings ***
Library     SeleniumLibrary
Library     String
#Libreria para ejecucion en docker (Se debe descargar previamenete)
Library    XvfbRobot

*** Variables ***
#Se debe modificar la url por la url donde se ejecuta osiris localmente
${URL}    http://localhost/osiris/#/login
${Navegador}    chrome
${InputUsuario}    //*[@id="TblUsuarios_usuario"]
#Se debe modificar el usuario
${Usuario}    duseche
${InputClave}    //*[@id="TblUsuarios_clave"]
#Se debe modificar la contraseña
${Clave}    123456
${Time}    3 minutes
${Tme_load}    3 minutes
${Extra_Time}     5 minutes
${load}    //*[@id="fakeLoader"]/div
${TMP_PATH}    /tmp



*** Keywords ***

FN Login
    Open Browser    ${URL}    ${Navegador}
    input text    ${InputUsuario}    ${Usuario}
    input text    ${InputClave}    ${Clave}
    click button    //*[@id="ButtonLoginForm"]
    Wait Until Element Is Visible    //*[@id="topNav"]/div/a/img  ${Tme_load}



import SendKeys

def send_enter_key():
   
    SendKeys.SendKeys("{ENTER}")


#Solamente se utiliza este Keyword para ejecucion en docker
Open Browser
    [Arguments]    ${url}    ${browser}
    Start Virtual Display    1920    1080
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    SeleniumLibrary.Create Webdriver    Chrome    chrome_options=${options}
    GoTo    ${url}