# For creating list first time we have to use @ symbol and after that we can use $ symbol
*** Settings ***
Documentation       To validate the login form
Library             SeleniumLibrary
Library             Collections
Test Setup          open the browser with Mortgage payment url
Test Teardown       close browser session
Resource            ../PageObjects/Generic.robot


*** Variables ***
${Error_Message_Login}      css:.alert-danger
${shop_page_load}           css:.nav-link

*** Test Cases ***
Validate Unsuccessful Login      # TC1
    fill the login form     ${user_name}    ${invalid_password}
    wait until element is located in the page       ${Error_Message_Login}
    verify error message is correct
Validate cards display in the shopping page   # TC2
    Fill the login Form     ${user_name}    ${valid_password}
    wait until element is located in the page       ${shop_page_load}
    varify card titles in the shop page
    select the card         Nokia Edge
Select the form and navigate to child window
    Fill the login details and login form


*** Keywords ***
Fill the login Form
    [arguments]         ${username}     ${password}
    Input text          id:username     ${username}
    Input password      id:password     ${password}
    click button        id:signInBtn

wait until element is located in the page
    [arguments]     ${element}
    wait until element is visible        ${element}

verify error message is correct
    ${result}=  get text    ${Error_Message_Login}                     #css:.alert-danger
    Should Be Equal As Strings      ${result}        Incorrect username/password.

varify card titles in the shop page
    @{expectedlist} =   Create List      iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =   Get WebElements     css:.card-title
    @{actuallist} =     Create List
    FOR     ${element}  IN      @{elements}
        Log     ${element.text}
        Append To List  ${actuallist}   ${element.text}

    END
    Lists Should Be Equal   ${expectedlist}     ${actuallist}

select the card
    [arguments]     ${cardName}
    ${elements} =   Get WebElements     css:.card-title
    ${index}=   Set Variable    1
    FOR  ${element}  IN      @{elements}
        Exit For Loop If  '${cardName}' == '${element.text}'
        ${index}=   Evaluate    ${index}+ 1
    END
    click button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the login details and login form
    Input text          id:username     rahulshettyacademy
    Input password      id:password     learning
    Click Element       css:input[value='user']
    Wait Until Element Is Visible       css:.modal-body
    CLICK BUTTON        id:okayBtn
    CLICK BUTTON        id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value       css:select.form-control     teach
    Select Checkbox         id:terms
    Checkbox Should Be Selected    id:terms






