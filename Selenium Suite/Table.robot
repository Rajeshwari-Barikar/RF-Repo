*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library    XML
Library    String
*** Variables ***

*** Test Cases ***
Open EMR Site
    Append To Environment Variable      Path    D:\\Browsers\\chromedriver
    ##Table methods
    ##Print Name
    Total Number
*** Keywords ***

Table methods

    Open Browser   https://datatables.net/extensions/select/examples/initialisation/checkbox.html   browser=gc
    ${name1}    Get Text    //table[@id='example']/tbody/tr[1]/td[2]
    ${name2}    Get Text    //table[@id='example']/tbody/tr[2]/td[2]
    Log To Console    \n ${name1}
    Log To Console    \n ${name2}
    Select From List By Label    name=example_length    25
    ${rowcount}  Get Element Count    //table[@id='example']/tbody/tr

    FOR    ${i}    IN RANGE    1    ${rowcount}+1
        ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        ##Log To Console    ${i}
        Log To Console    ${name}
        ${age}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[5]
        Log To Console    ${age}

       ## IF    '${name}' == 'Brenden Wagner'
         ##      Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
           ##    Exit For Loop
        ##END
        Run Keyword If    '${name}' == 'Brenden Wagner'
        ...    Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
        Exit For Loop If    '${name}' == 'Brenden Wagner'

        Run Keyword If    '${name}' == 'Brenden Wagner'
        ...     Set Local Variable  ${cname}    ${name}
        Log To Console    ${cname}

    END

    ${n1}   Set Variable    b
    ${n2}   Set Variable    ${n1}

Print Name
    Open Browser   https://datatables.net/extensions/select/examples/initialisation/checkbox.html   browser=gc

    FOR    ${pagecount}    IN RANGE    1    7
        ${rowcount}  SeleniumLibrary.Get Element Count    //table[@id='example']/tbody/tr
        FOR    ${i}    IN RANGE    1    ${rowcount}+1
            ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            ##Log To Console    ${i}
            Log To Console    ${name}
            ${age}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[5]
            Log To Console    ${age}
        END
        ##Log    ${pagecount}
        Click Element    link=Next

    END

Total Number
    Open Browser   https://datatables.net/extensions/select/examples/initialisation/checkbox.html   browser=gc
    ##Click Element   xpath= //div[@id='example_info']
    Set Local Variable    ${text}   Showing 1 to 25 of 57 entries
    Log To Console     ${text}
    ${text1}     Remove String     ${text}    entries
    Log To Console     ${text1}