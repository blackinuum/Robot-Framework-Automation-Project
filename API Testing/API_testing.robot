*** Settings ***
Library     RequestsLibrary
Library     SeleniumLibrary
#For prompts
Library     Dialogs

*** Variables ***
${base_url}=    https://jsonplaceholder.typicode.com
${base_url2}=   https://dummyjson.com

*** Keywords ***

*** Test Cases ***
GET Request
    create session  first_session   ${base_url}
    ${id}=  Get value from user     Post ID :
    ${response}=    Get Request    first_session   /posts/${id}
    IF  ${response.status_code}==200
        log to console  The request was a success !
        log to console  ${response.content}
    ELSE
        log to console  Something went wrong !
        log to console  Error code : ${response.status_code}
    END

POST Request
    create session  second_session  ${base_url2}/users/add
    ${firstName}=   get value from user     Enter a FirstName
    ${lastName}=   get value from user     Enter a LastName
    ${age}=   get value from user     Enter an Age
    ${gender}=   get value from user     Enter a Gender

    ${new_user_data}=   create dictionary   firstName=${firstname}  lastName=${lastName}    age=${age}     gender=${gender}
    log to console  ${new_user_data}
    ${response}=    Post Request    second_session  data=${new_user_data}   uri=${base_url2}
    IF  ${response.status_code}==201
        log to console  POST request successfull ! New entry created !
    ELSE
        log to console  Something went wrong ! Status code is : ${response.status_code}
    END

PUT Request
    create session  third_session  ${base_url2}
    ${newTitle}=   get value from user     Enter a new title
    ${newBody}=   get value from user     Enter a new body
    ${id}=  get value from user     Enter the ID of the post to update

    ${new_user_data}=   create dictionary   title=${newTitle}   body=${newBody}
    log to console  ${new_user_data}
    ${response}=    put Request    third_session  data=${new_user_data}   uri=${base_url2}/posts/${id}
    IF  ${response.status_code}==200
        log to console  PUT request successfull ! Post updated !
    ELSE
        log to console  Something went wrong ! Status code is : ${response.status_code}
    END


DELETE Request
    create session  fourth_session  ${base_url2}
    ${id}=  get value from user     Enter the ID of the post to delete

    ${response}=    delete Request    fourth_session  uri=${base_url2}/posts/${id}
    IF  ${response.status_code}==200
        log to console  DELETE request successfull ! Post deleted !
    ELSE
        log to console  Something went wrong ! Status code is : ${response.status_code}
    END