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
    Open Browser    url=https://www.pepperfry.com/    browser=gc
    Maximize Browser Window
    Input Text    id=search    bedsheets
    Click Element    id=searchButton
    #Set Selenium Implicit Wait    10S
    #Wait Until Page Contains    Search Results For
    #${PopUp}        //div[@id='regPopUp']//a[@class='popup-close']
    #Alert Should Not Be Present     DISMISS
    Set Selenium Speed    30S
    Mouse Over    //div[contains(@class,'clip__filter is_stuck')]
    Select Checkbox    //label[@for='brandsnameSleep_Dove']
    
    Mouse Over      //div[@unbxdattr='product']
    Click Element    //div[@unbxdattr='product'][position()=1]
