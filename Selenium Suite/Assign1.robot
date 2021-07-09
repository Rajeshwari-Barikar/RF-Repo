*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
*** Variables ***

*** Test Cases ***
Login Magnito site
    Append To Environment Variable      Path    D:\\Browsers\\chromedriver
    Login

*** Keywords ***
Login
    Open Browser    url=https://magento.com/    browser=gc
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Sign in')]
    Mouse Over    xpath=//span[contains(text(),'Sign in')]
    Click Element   xpath=//span[contains(text(),'Sign in')]
    Input Text    id=email    balaji0017@gmail.com
    Input Text    id=pass    balaji@12345
    Click Button  xpath=//button[@id='send2']
    ${Title}      Get Title
    Log To Console   \n Title of Page is '' ${Title} ''
    Click Element    xpath=//a[.='Log Out']
    Log To Console    Logged out from Page
    Close Browser
    