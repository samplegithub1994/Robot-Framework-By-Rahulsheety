*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary

*** Variables ***
${Shop_page_load}           css:.nav-link
${country_location}        xpath://a[contains(text(),'India')]


*** Keywords ***
Enter the Country and select the terms
    [arguments]      ${country_name}
    input text      country     ${country_name}
    sleep       2
    wait until element passed is located on page        xpath://a[contains(text(),'${country_name}')]
    click element        xpath://a[contains(text(),'${country_name}')]
    Sleep       2
    click element       css:.checkbox label

purchase the product and confirm the purchase
    click button    css:.btn-success
    page should contain     Success!

