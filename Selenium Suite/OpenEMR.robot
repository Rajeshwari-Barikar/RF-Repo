*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
*** Variables ***

*** Test Cases ***
Open EMR Site
    Append To Environment Variable      Path    D:\\Browsers\\chromedriver
    Login to EMR
    Verify Patient section
    Add Patient Record
    Search Patient Record
*** Keywords ***
Login to EMR
    Open Browser    url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default       browser=gc
    Maximize Browser Window
    ##Set Selenium Implicit Wait   30s
    Input Text    id:authUser    admin
    Input Password  id=clearPass    pass
    ##Select From List By Value    name=languageChoice    18
    Select From List By Label    name=languageChoice  English (Indian)
    ##Click Element    class=btn
    Click Element       xpath=//button[@type='submit']

Verify Patient section
    Wait Until Page Contains    Flow Board
    ${Atitle}       Get Title
    Log    ${Atitle}
    Log To Console    ${Atitle}
    ${url}=  Run Keyword If    '${Atitle}' == 'OpenEMR'
    ...    Log To Console    PASS-continue
          Get Location
    Log To Console      ${url}

Add Patient Record
    Mouse Over         xpath=//div[text()='Patient/Client']
    Click Element      xpath=//div[text()='Patient/Client']
    Click Element    xpath=//div[text()='Patients']
    Select Frame    name=fin
    ##//div[contains(text(),'Patients')]
        Click Button    id=create_patient_btn1
    Unselect Frame
    Select Frame    name=pat
        Input Text      id=form_fname    RR1
        Input Text      id=form_lname    RLast
        Input Text      id=form_DOB    1-01-2007
        Select From List By Label    id=form_sex    Male
        Click Element    id=create
    Unselect Frame
    Select Frame    id=modalframe
        Click Element    xpath=//input[@value='Confirm Create New Patient']
        Unselect Frame
    ${alertt}      Handle Alert       action=ACCEPT  timeout=50s
     Log To Console     ${alertt}
     ##Run Keyword If      Element Should Contain       class=closeDlgIframe
     ##...    Click Element    class=closeDlgIframe
     ##...    ELSE
     ##...    END
     ##Click Element    class=closeDlgIframe
     Select Frame    xpath=//iframe[@name='pat']
     Get Text    xpath=//h2[contains(text(),'Record')]
     Element Should Contain    xpath=//h2[contains(text(),'Record')]    RR1 RLast

Search Patient Record
    ##Mouse Over    xpath=//span[normalize-space()='Patient Finder']
    Mouse Over    xpath=//span[contains(text(),'Patient Finder')]
    ## //span[contains(text(),'Patient Finder')]
    Click Element   xpath=//span[contains(text(),'Patient Finder')]
    Capture Page Screenshot    xpath=//span[contains(text(),'Patient Finder')]
