*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
*** Variables ***

*** Test Cases ***
Login RedBus
    Append To Environment Variable      Path    D:\\Browsers\\chromedriver
    Login

*** Keywords ***
Login
    Open Browser    url=https://phptravels.net/home    browser=gc
    Maximize Browser Window
    Click Element    //a[contains(text(),'Flights')]
    Mouse Over    id=select2-drop-mask
    #Input Text    @id=select2-drop-mask    Los Angeles (LAX)
    Capture Element Screenshot    id=select2-drop-mask