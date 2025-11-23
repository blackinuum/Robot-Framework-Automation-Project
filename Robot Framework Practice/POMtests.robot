*** Settings ***
Library     SeleniumLibrary
Variables   Page Objects/locator.py
Resource    Resource/POMresources.robot
Suite Setup  Open my Browser    ${URL}  ${browser}
Suite Teardown  close browser

*** Test Cases ***
Full Test
    set selenium speed  0.5s
    Login Attempt   ${username}     ${password}
    Page should contain     Logged In Successfully