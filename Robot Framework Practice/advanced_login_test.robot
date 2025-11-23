*** Settings ***
Library     SeleniumLibrary
Resource    Resource/Invalid_Login.robot
#Suite Setup Executed once before all test cases
Suite Setup         Visit URL
#Suite Teardown Executed once after all test cases
Suite Teardown      Close all windows
#Reuses the same test steps from the keyword defined with different data
Test Template       Invalid Login Test


*** Test Cases ***
#                           Username        Password
Right user wrong pass       Student         antoine 123
Right user empty pass       Student         ${EMPTY}
Wrong user wrong pass       Professor       antoine 123
Wrong user empty pass       Professor       ${EMPTY}
Wrong user right pass       Professor       Password123
Empty user empty pass       ${EMPTY}        ${EMPTY}