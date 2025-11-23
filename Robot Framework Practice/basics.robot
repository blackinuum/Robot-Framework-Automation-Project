*** Settings ***
Library  SeleniumLibrary
Library     Collections
Resource  first_resource.robot

*** Variables ***
${url}  https://www.saucedemo.com/
${url2}  https://artoftesting.com/samplesiteforselenium#:~:text=This%20is%20a%20sample%20web%20page%20with%20dummy,drop-downs%2C%20alert%20boxes%2C%20and%20drags%20%26%20drop%20widgets.
${username}     visual_user
${password}     secret_sauce


*** Keywords ***
#Creating custom keywords to use instead of predefined ones
#Custom keywords are re-usable and flexible
fullLoginUnlogTest
    input text  id:user-name    ${username}
    input text  id:password     ${password}
    click element   ${loginButton}
    click element   ${menuButton}
    sleep   5
    Wait Until Element Is Visible   xpath://div/div/nav/a[@id="logout_sidebar_link"]
    click element  xpath://div/div/nav/a[@id="logout_sidebar_link"]

*** Test Cases ***
LoginTest
    open browser    ${url}
    fullLoginUnlogTest

Mix
    Set Selenium Speed  1s
    title should be     Swag Labs
    input text  id:user-name    ${username}
    input text  id:password     ${password}
    clear element text  id:user-name
    element should be visible   id:user-name
    sleep   5
    input text  id:user-name    Yooooooooooooooooooooo


RadioCheckBoxes
    # Go to in order to move from one url to another in the same browser window
    Go to   ${url2}
    select radio button     gender  male
    select checkbox    Automation
    select checkbox     Performance
    click element   xpath://*[@id="AlertBox"]/button
    close browser

TryingDropDowns and Lists
    #Tags can be used in order to include or exclude test cases from the execution process.fullLoginUnlogTest.*** Keywords ***
    #robot --include smoke "test case file.robot" in order to only execute the test case with the tag smoke on it
    [tags]
    open browser    ${url2}
    maximize browser window
    #We will be trying in here to test list selection using different parameters index, value and label
    select from list by index   testingDropdown   2
    sleep   3
    select from list by value   testingDropdown   Database
    sleep   3
    select from list by label   testingDropdown   Manual Testing
    sleep   3
    unselect from list by value     testingDropdown     Manual
    close browser

Testing Speed, waits ( & implicit waits) and timeouts
    open browser    ${url2}
    #part I to check how the speed of selenium actions execution changes (initially 0 seconds)
    ${speed}=   get selenium speed
    log to console  ${speed}
    comment     The difference between sleep 3 and set selenium speed 3 is that set selenium speed is more like an
    comment     automated version of sleep that automatically puts sleep 3 after each selenium action
    select radio button     gender  male
    select checkbox    Automation
    select checkbox     Performance
    #part II to check how the speed of selenium actions execution changes (at this stage it becomes 3 seconds)
    ${speed}=   get selenium speed
    log to console  ${speed}
    ${timeout}=     get selenium timeout
    log to console  ${timeout}
    #Waits
    comment     We already used wait early on in the LoginTest as follows :
    comment     Wait Until Element Is Visible   xpath://div/div/nav/a[@id="logout_sidebar_link"]
    comment     With wait a specified condition must first be satisfied in order to proceed with the execution of the next action
    comment     As for timeout, it's the duration that selenium would wait for the specified element to be visible
    comment     Now for implicit wait, it specifies the time that selenium should wait for an element to be visible, the catch is that
    ...         it is applied globally and not just to one specified element
    # by default, selenium would wait 5 seconds for the element to appear, let's make it 10 seconds
    set selenium timeout    10 seconds
    ${timeout}=     get selenium timeout
    log to console  ${timeout}
    #wait until page contains    congrats   - we commented this line in order to prevent test case failure since the congrats
    ...     element does not exist
    set selenium implicit wait  10 seconds
    # We will use the wrong id on purpose in order to trigger the implicit wait
    input text  //*[@id="fname1"]    John Doe
    close browser

Closing Browsers (single & multiple)
    open browser    ${url}
    open browser    ${url2}
    #Closing one browser
    close browser
    #closing all opened browsers
    #close all browsers


AlertBox
    open browser    ${url2}
    click button    //*[@id="ConfirmBox"]/button
    sleep   5
    #Alert box handling
    handle alert    dismiss
    #handle alert    accept
    #handle alert    leave

    #Alert box conditions
    #alert should be present     Welcome ! Everyone.
    alert should not be present     Welcome ! Everyone.
    close browser

frames
    open browser    https://www.globalsqa.com/demo-site/frames-and-windows/#iFrame
    select frame    //*[@id="post-2632"]/div[2]/div/div/div[3]/p/iframe
    click element   //*[@id="portfolio_items"]/div[1]/a/div/div/div[1]/img
    close browser

tabbed windows
    set selenium speed  1
    open browser    https://www.qaplayground.com/practice/window    edge
    click element   //a[@href="/practice/select"]
    #First select window, but now deprecated must use switch window instead
    switch window   title=How to handle drop-down using select class of selenium
    click element   //a[@href="/blog"]
    switch window   title=How to handle multiple windows using selenium
    close browser

browser windows
    open browser    https://www.google.com/chrome/  edge
    maximize browser window
    open browser    https://www.rockstargames.com/fr/games/maxpayne3    edge
    switch browser  1
    ${title_b1}=    get title
    log to console  ${title_b1}
    switch browser  2
    ${title_b2}=    get title
    log to console  ${title_b2}
    switch browser  1
    ${title_b1}=    get title
    log to console  ${title_b1}
    close all browsers

browserKeywords
    #get location gets you the url you are currently browsing
    #go to visits the specified url
    #go back moves back to the previous url in your browsing history
    set selenium speed  4
    open browser    https://www.google.com/chrome/  edge
    ${current_url}=     get location
    log to console  ${current_url}
    go to   https://www.rockstargames.com/fr/games/maxpayne3
    ${current_url}=     get location
    log to console  ${current_url}
    go back
    ${current_url}=     get location
    log to console  ${current_url}
    close browser

Captures
    set selenium speed  3s
    open browser    https://www.rockstargames.com/fr/games/maxpayne3    edge
    maximize browser window
    set selenium timeout    10s
    wait until element is visible   //*[@id="main"]/div/div[1]/div[2]
    capture element screenshot  //*[@id="main"]/div/div[1]/div[2]   C:\\Users\\bazou\\OneDrive\\Desktop\\robot_screens\\max_payne_cover.png
    capture page screenshot     C:\\Users\\bazou\\OneDrive\\Desktop\\robot_screens\\max_payne_website.png
    close browser

MouseAct
#This test case tries : Mouse right click -> open context menu -- Mouse double click -> double click element -- Drag and drop -> drag and drop
    open browser    https://swisnl.github.io/jQuery-contextMenu/demo.html  edge
    maximize browser window
    set selenium speed  2s
    open context menu   //span[@class="context-menu-one btn btn-neutral"]
    go to   https://demoqa.com/buttons
    double click element    //*[@id="doubleClickBtn"]
    go to   https://demoqa.com/droppable
    drag and drop   //*[@id="draggable"]    //*[@id="droppable"]
    close browser

CustomKeywordsWithArgs
#In this test case we will focus on creating a user defined keyword which is launchbrowser that takes two arguments,
#We have created a new .robot file named first_resource that contains the created keyword and then we import it to this file
#using Resource "file name"
#We also used RETURN keyword in order to recover the tab title value and display it in the console
    ${title}=   launchbrowser   https://www.youtube.com/watch?v=Ar-iQnvahxQ&list=PLUDwpEzHYYLsCHiiihnwl3L0xPspL7BPG&index=13    edge
    log to console  ${title}
    close browser

ScrollingAct
    set selenium speed  3s
    open browser    https://www.history.com/    edge
    #Scroll down using pixels
    #execute javascript  window.scroll(0,1500)
    #Scroll all the way to the bottom
    #execute javascript  window.scroll(0,document.body.scrollHeight)
    #Scroll until an element is visbile
    scroll element into view    //div[@class="l56tod1 g1fwxflu g1fwxfm9 g1fwxfk0 g1fwxfzm"]
    close browser

Forloop
    ############################# First example
    #FOR     ${i}  IN   1   2   3   4   5   6   7   8   9   10
    #   log to console  ${i}
    #END
    ############################# Second example
    #FOR     ${i}  IN RANGE  1   10
    #   log to console  ${i}
    #END
    ############################ Third example with lists
    #@{items}    create list     1   2   3   4   8   9
    #FOR     ${i}    IN  @{items}
    #    log to console  ${i}
    #END
    ############################ Fourth example with strings and EXIT
    FOR     ${i}    IN  JAVA    C++     JAVASCRIPT      PYTHON      C#
        log to console  ${i}
            EXIT FOR LOOP IF    '${i}'=='JAVASCRIPT'
    END

LinksExtraction
    Open Browser    https://www.history.com/    edge
    #Count number of urls in the url
    ${links_count}=     get element count   //a
    log to console  Number of links in this url : ${links_count}
    #Creating a list to store all urls
    @{links}=   create list
    #Going through each <a/> element and extracting the url it contains, then we add it to the links list
    FOR     ${index}    IN RANGE   1     ${links_count}+1
        ${element_url}=     Get Element Attribute   (//a)[${index}]  href
        APPEND TO LIST  ${links}    ${element_url}
    END
    #Display the content of the links list
    FOR     ${url}  IN  @{links}
        log to console  URL : ${url}
    END
    close browser

TableHandling
    open browser    https://www.englishclub.com/vocabulary/world-countries-nationality.php  edge
    #below we will try to recover the number of lines the table contains along with the number of columns
    ${num_of_lines}=    get element count   //tr
    ${num_of_columns}=  get element count   //tr[1]/th
    log to console  this table contains ${num_of_lines} line and ${num_of_columns} columns
    #we will try to display the 14th line content
    @{table_portion}=   create list
    FOR     ${i}    IN RANGE    1   4
        ${value}=   get text    //tr[14]/td[${i}]
        APPEND TO LIST  ${table_portion}    ${value}
    END
    FOR     ${content}    IN    @{table_portion}
        log to console  ${content}
    END
    #Now we will finally move to the validation *** test cases ***
    #table column should contain     //table[@class="ec-table"]  3   power          ####### Failed test
    #table column should contain     //table[@class="ec-table"]  3   person         ####### Valid test
    #table row should contain    //table[@class="ec-table"]  3   German             ####### Failed test
    #table row should contain    //table[@class="ec-table"]  3   an Albanian           ####### Valid test
    #table cell should contain    //table[@class="ec-table"]  5     2   German             ####### Failed test
    #table cell should contain    //table[@class="ec-table"]  5      2   Andorran           ####### Valid test