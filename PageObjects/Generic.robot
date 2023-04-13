*** Setting ***
Documentation       A resource file with reusable keywords and variables.
...
...                 The system specific keywords created here from our own domain
...                 specific language . They utilize keywords provided by the imported
...                 SeleniumLibrary.
Library             SeleniumLibrary

*** Variables ***
${user_name}           rahulshettyacademy
${valid_password}       learning
${invalid_password}     12345
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with mortgage payment url
    #Create webdriver    Chrome  executable_path="C:\Program Files\Python310\Scripts\chromedriver.exe"
    open browser        ${url}           chrome      #Edge  #Firefox
close browser session
    close browser

wait until element passed is located on page
    [arguments]     ${page_locator}
    wait until element is visible        ${page_locator}


