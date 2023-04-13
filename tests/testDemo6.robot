*** Settings ***
Documentation       To validate the login form
Library             SeleniumLibrary
Library             Collections
Library             ../customLibraries/Shop.py
Test Setup          open the browser with Mortgage payment url
Test Teardown       close browser session
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/LandingPage.robot
Resource            ../PageObjects/ShopPage.robot
Resource            ../PageObjects/CheckoutPage.robot
Resource            ../PageObjects/ConformationPage.robot

*** Variables ***

@{listofproducts}            Blackberry         Nokia Edge
${country_name}              India

*** Test Cases ***
Validate Unsuccessful Login      # TC1
    LandingPage.Fill the login Form     ${user_name}    ${invalid_password}
    LandingPage.wait until element is located in the page
    LandingPage.verify error message is correct

Validate cards display in the shopping page   # TC2
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    ShopPage.wait until element is located in the page
    ShopPage.varify card titles in the shop page
    add items to cart and checkout         ${listofproducts}
    CheckoutPage.verify items in the checkout page and proceed
    ConformationPage.Enter the country and select the terms       ${country_name}
    ConformationPage.purchase the product and confirm the purchase
    #select the card         Nokia Edge

Select the form and navigate to child window
   LandingPage.Fill the login details and login form



