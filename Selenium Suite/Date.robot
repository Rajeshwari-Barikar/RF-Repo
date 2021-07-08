*** Settings ***
Library     OperatingSystem
Library    DateTime



*** Test Cases ***
TC1
    ${c}        Get Current Date
    Log To Console    'Tday date is'=${c}

