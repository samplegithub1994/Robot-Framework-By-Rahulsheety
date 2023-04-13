*** Setting ***
Documentation       All the page objects and keywords of landing page
Library             SeleniumLibrary

*** Variables ***
${shop_page_load}           css:.nav-link


*** Keywords ***
wait until element is located in the page
    wait until element passed is located on page        ${shop_page_load}

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
