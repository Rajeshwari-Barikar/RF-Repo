*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
*** Variables ***

*** Test Cases ***
Open DB4Free site
    Append To Environment Variable      Path    D:\\Browsers\\chromedriver
    Login to DB4


*** Keywords ***
Login to DB4
    Open Browser    url=https://db4free.net/       browser=gc
    Maximize Browser Window
    ##Set Selenium Implicit Wait   30s
