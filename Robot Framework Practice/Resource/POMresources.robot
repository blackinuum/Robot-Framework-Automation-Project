*** Variables ***
${URL}=     https://practicetestautomation.com/practice-test-login/
${browser}=     edge
${username}=    student
${password}=    Password123

*** Keywords ***
Login Attempt
    [Arguments]     ${username}     ${password}
    input text  ${username_field}   ${username}
    input text  ${password_field}   ${password}
    click button    ${login_btn}

Open My Browser
    [Arguments]     ${url}  ${browser}
    open browser    ${url}  ${browser}
    maximize browser window
    scroll element into view    //*[@id="form"]