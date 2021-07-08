*** Settings ***
Library     DateTime
Library     SeleniumLibrary
Library     OperatingSystem
*** Test Cases ***
TC1 Get Datetime
    ${Datetime}      Get Current Date
    Log To Console      ${Datetime}

TC2 Print Name
    ${Name1}     Set Variable        Python1
    Log To Console      ${Name1}
    Set Local Variable      ${Name2}    Python2
    Log To Console      ${Name2}

TC3
    Append To Environment Variable      Path    D:\\Browsers\\chromedriver
    Open Browser    url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default       browser=gc
    Maximize Browser Window
    ##Set Selenium Implicit Wait   30s

    Input Text    id:authUser    admin
    Input Password  id=clearPass    pass
    ##Select From List By Value    name=languageChoice    18
    Select From List By Label    name=languageChoice  English (Indian)
    ##Click Element    class=btn
    Click Element       xpath=//button[@type='submit']
    Wait Until Page Contains    Flow Board
    ${Atitle}       Get Title
    Log    ${Atitle}
    Log To Console    ${Atitle}
    
    IF    '${Atitle}' == 'OpenEMR'
            Log To Console    PASS-continue
        
    ELSE
        Log To Console    FAIL
        Fatal Error
    END
    
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
     Click Element    class=closeDlgIframe
     Select Frame    xpath=//iframe[@name='pat']
     Get Text    xpath=//h2[contains(text(),'Record')]
     Element Should Contain    xpath=//h2[contains(text(),'Record')]    RR1 RLast
     Capture Page Screenshot
    ##Close Browser


    ##Close Browser
TC4 Environment
    Log To Console    ${TEST_NAME}
    Log To Console    ${EXECDIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${EXECDIR}\\Driver
    Log To Console    ${EXECDIR}${/}Driver
