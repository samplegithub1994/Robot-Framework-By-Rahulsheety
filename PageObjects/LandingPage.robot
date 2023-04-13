*** Setting ***
Documentation       All the page objects and keywords of landing page
Library             SeleniumLibrary
Resource            Generic.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Keywords ***
Fill the login Form
    [arguments]         ${username}     ${password}
    Input text          id:username     ${username}
    Input password      id:password     ${password}
    click button        id:signInBtn

wait until element is located in the page
    wait until element passed is located on page        ${Error_Message_Login}

verify error message is correct
    ${result}=  get text    ${Error_Message_Login}                     #css:.alert-danger
    Should Be Equal As Strings      ${result}        Incorrect username/password.

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
