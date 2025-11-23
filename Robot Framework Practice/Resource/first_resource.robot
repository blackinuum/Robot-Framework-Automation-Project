*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
LaunchBrowser
    [arguments]  ${url}     ${browser}
    open browser    ${url}  ${browser}
    ${tab_title}=   get title
    RETURN  ${tab_title}

*** Test Cases ***
