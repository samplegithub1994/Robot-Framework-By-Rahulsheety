*** Setting ***
Documentation       All the page objects and keywords of landing page
Library             SeleniumLibrary

*** Variables ***
${shop_page_load}           css:.nav-link


*** Keywords ***
verify items in the checkout page and proceed
    click element       css:.btn-success
