# Here we see how to parameterize our test or how to trigger our test with multiple datasets

*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Test Teardown       close browser
Test Template       Validate Unsuccessful Login
*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***      username        password
Invalid username        ashok           learning
Invalid password        rahulsheety     akpww
special characters      @$#             learning

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]     ${username}     ${password}
    open the browser with Mortgage payment url
    fill the login form     ${username}     ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with mortgage payment url
    #Create webdriver    Chrome  executable_path="C:\Program Files\Python310\Scripts\chromedriver.exe"
    open browser   https://rahulshettyacademy.com/loginpagePractise/    chrome

Fill the login Form
    [arguments]         ${username}     ${password}
    Input text          id:username     ${username}
    Input password      id:password     ${password}
    click button        id:signInBtn

wait until it checks and display error message
    wait until element is visible       ${Error_Message_Login}        #css:.alert-danger
verify error message is correct
    ${result}=  get text    ${Error_Message_Login}                     #css:.alert-danger
    Should Be Equal As Strings      ${result}        Incorrect username/password.
    element text should be      ${Error_Message_Login}      Incorrect username/password. # In stead of above 2-line we can this keyword
