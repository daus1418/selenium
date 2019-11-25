*** Settings ***
Library     Selenium2Library
Library     XvfbRobot

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
G001 Open Google buscar casos prueba
    Start Virtual Display    1920    1080
    Open Browser    https://www.google.com.co/    chrome
    Wait Until Element Is Visible   xpath=//*[@id="hplogo"]
    Input Text    xpath=//*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input    casos de prueba
    Click Element    xpath=//*[@id="hplogo"]
    Click Element    xpath=//*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[1]
    Click Link    xpath=//*[@id="hdtb-msb-vis"]/div[2]/a    
    Page Should Contain    casos de prueba

G002 Click en foto 
    Click Link    xpath=//*[@id="rg_s"]/div[1]/a[2]
    Page Should Contain    Plantilla
    Sleep    10 seconds
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
    GoTo    ${url}


