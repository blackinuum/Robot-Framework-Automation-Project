

*** Variables ***
${URL}=     https://practicetestautomation.com/practice-test-login/
${browser}=     edge


*** Keywords ***
Visit URL
    open browser    ${URL}  ${browser}
    maximize browser window
    set selenium speed  0.5s
    scroll element into view    //*[@id="form"]

Close all windows
    close all browsers

Invalid Login Test
    [arguments]     ${username}     ${password}
    input text      //*[@id="username"]     ${username}
    input text      //*[@id="password"]     ${password}
    click element   //*[@id="submit"]
    sleep   1
    element should be visible   //*[@id="error"]