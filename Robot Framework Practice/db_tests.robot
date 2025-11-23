*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem
Suite Setup  Connect To Database    pymysql     ${DBname}  ${DBuser}   ${DBpassword}   ${DBhost}   ${DBport}
Suite Teardown  Disconnect From Database

*** Variables ***
${DBname}=  robot
${DBuser}=  root
${DBpassword}=
${DBhost}=  127.0.0.1
${DBport}=  3306

*** Test Cases ***
Create book table
    ${output}=  Execute SQL String  Create table book(id integer, title varchar(20));
    log to console  ${output}
    should be equal as strings  ${output}   None

Insert book row
    ${row}=     Execute SQL String  Insert into book values(3,"South Paw")
    log to console  ${row}
    should be equal as strings      ${row}   None

Check If Book exists
    ${response}=    Query     select title from book where title="South Paw"
    log to console  ${response}
    IF  ${response}
        log to console  The book exists!
    ELSE
        log to console  The book does not exist !
    END

Check employees count
    ${employees}=   Query  Select COUNT(name) from employees where department="Editorial Department"
    log to console  Editorial Department has ${employees} employee


Check employees count constraint
    ${employees}=   Query  Select COUNT(name) as employees from employees where department="Editorial Department"
    log to console  ${employees[0][0]}
    IF  ${employees[0][0]} > 12
        log to console  Too many employees !
    ELSE
        log to console  Still in the accepted range !
    END
Update row
    ${upd}=     Execute SQL String   Update book set title="New Dawn" where title="South Paw"

Delete row
    ${del}=     Execute SQL String   Delete from Book where id=NULL

Delete table
    ${dropTable}=   Execute SQL String  Drop table if exists book


