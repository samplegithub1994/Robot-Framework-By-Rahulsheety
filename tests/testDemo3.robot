*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Library     Collections
Library     String
Test Setup      open the browser with Mortgage payment url
Test Teardown       close browser
Resource        ../PageObjects/Generic.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Validate child window functionality
    select the link of child window
    varify the user is switched to child window
    grab the email id in the child window
    switch to parent window and enter the email


*** Keywords ***
select the link of child window
    click element       css:.blinkingText
    sleep               5
varify the user is switched to child window
    switch window       New
    Element Text Should Be      css:h1      DOCUMENTS REQUEST

grab the email id in the child window
    ${text}=    get text    css:.red
    @{words}=   Split String    ${text}     at
    # 0-index-->Please email us
    # 1-index-->mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=  Get From List    ${words}   1
    log    ${text_split}
    @{words_2}=   Split String    ${text_split}
    # 0-->mentor@rahulshettyacademy.com
    ${email}=   Get From List   ${words_2}  0
    Set Global Variable     ${email}

switch to parent window and enter the email
    switch window       MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input text          id:username     ${email}



