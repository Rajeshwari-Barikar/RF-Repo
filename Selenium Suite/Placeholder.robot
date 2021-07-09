*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Open EMR Site
    Append To Environment Variable      Path    D:\\Browsers\\chromedriver
    ##Login to EMR
    Table methods
*** Keywords ***
Login to EMR
    Open Browser    url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default       browser=gc
    Maximize Browser Window
    ##Set Selenium Implicit Wait   30s
    ${att}      Get Element Attribute    id=authUser    placeholder
    Log To Console    ${att}
    Element Attribute Should Be         id=authUser    placeholder  Username:
    Click Element    partial link=Acknowledge
 
Table methods
    Go To    https://datatables.net/extensions/select/examples/initialisation/checkbox.html
