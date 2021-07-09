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
    Open Browser    url=https://www.redbus.in/    browser=gc
    Maximize Browser Window
    Click Element    id=sign-in-icon-down
    Wait Until Element Is Visible    id=signInLink
    Click Element    id=signInLink
    Set Browser Implicit Wait    20S
    Select Frame    //div[@class='modal']//iframe[@class='modalIframe']
    #Mouse Over    //div[@class='mobileInputContainer clearfix contact-box']
    Click Element    Id=mobileNoInp
    Input Text    Id=mobileNoInp        787878
    Unselect Frame
    Close Browser