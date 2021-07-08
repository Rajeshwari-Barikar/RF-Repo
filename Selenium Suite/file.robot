*** Settings ***
Library     OperatingSystem
*** Variables ***
${PATH}     ${CURDIR}\\ex3.txt
Set Test Variable ${count} , ${items},${files},${line}
*** Test Cases ***
TC1 FilePath

        ##Create File     ${PATH}
        File Should Exist    ${PATH}
        Copy File    ${PATH}    ${CURDIR}\\file2.txt
        Log To Console    \n Current Directory is = ${CURDIR}
        ##Append To File       ${PATH}  rasd werew aayu
        ##Get File    ${CURDIR}\\ex3.txt
        ${count} =     Count Files In Directory   ${CURDIR}
        ${items} =     List Directory    ${CURDIR}
        ${files} =     List Files In Directory    ${CURDIR}     *.txt
        ${line} =      Grep File  ${PATH}   aayu
        Log To Console    \n Number of Files in Directory = ${count}
        Log To Console    \n Number of items in Directory = ${items}
        Log To Console    \n Number of files in Directory = ${files}