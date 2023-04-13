*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Test Teardown       close browser
*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Validate Unsuccessful Login      # Tc
    open the browser with Mortgage payment url
    fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with mortgage payment url
    #Create webdriver    Chrome  executable_path="C:\Program Files\Python310\Scripts\chromedriver.exe"
    open browser   https://rahulshettyacademy.com/loginpagePractise/    chrome

Fill the login Form
    Input text          id:username     ashokpanda
    Input password      id:password     12345
    click button        id:signInBtn
wait until it checks and display error message
    wait until element is visible       ${Error_Message_Login}        #css:.alert-danger
verify error message is correct
    ${result}=  get text    ${Error_Message_Login}                     #css:.alert-danger
    Should Be Equal As Strings      ${result}        Incorrect username/password.
    element text should be      ${Error_Message_Login}      Incorrect username/password. # In stead of above 2-line we can this keyword
