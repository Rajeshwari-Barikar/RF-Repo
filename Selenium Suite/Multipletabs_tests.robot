*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary

*** Test Cases ***
TC1 Mple tabs
    Append To Environment Variable      Path    D:\\Browsers\\chromedriver
    Login to DB4
    Login to PhpAdmin

*** Keywords ***
Login to DB4
    Open Browser    url=https://db4free.net/       browser=gc
    #Maximize Browser Window
    Click Element   xpath=//b[contains(text(),'phpMyAdmin »')]
    
Login to PhpAdmin
    Switch Window   NEW
    Input Text    id=input_username    admin
    Input Text    id=input_password    pass123
    Select From List By Label    id=sel-lang    English
    Click Element    id=input_go
#   get and print the cannot log unto my SQL
    ##Get Text    xpath=//div[@id='js-https-mismatch']/following::div
    ${Err}  Get Text    (//div[@role='alert'])[2]
    Log To Console    ${Err}
    Close Window




