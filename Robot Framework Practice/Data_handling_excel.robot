*** Settings ***
Resource    Resource/Invalid_Login.robot
Library     SeleniumLibrary
#Loads the excel file
Library   DataDriver    Resource/Invalid_Login.xlsx

Suite Setup  Visit URL
Suite Teardown  Close all windows
Test Template  Invalid Login Test

*** Keywords ***

Invalid Login Test
    [arguments]     ${username}     ${password}
    input text      //*[@id="username"]     ${username}
    input text      //*[@id="password"]     ${password}
    click element   //*[@id="submit"]
    sleep   1
    element should be visible   //*[@id="error"]

*** Test Cases ***
#Will run the Invalid Login Test with each row from the excel table
LoginWithExcel      ${username}     ${password}

