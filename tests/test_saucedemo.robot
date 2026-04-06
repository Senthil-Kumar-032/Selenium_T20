*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../variables/variables.robot

Test Setup      Open Browser To SauceDemo
Test Teardown   Close Browser

*** Test Cases ***

Test Case 1 - Valid Login
    Login    ${VALID_USER}    ${VALID_PASS}
    Verify Products Page

Test Case 2 - Invalid Login
    Login    ${INVALID_USER}    ${INVALID_PASS}
    Verify Error Message

Test Case 3 - Add Single Product
    Login    ${VALID_USER}    ${VALID_PASS}
    Add Single Product To Cart
    Open Cart
    Verify Product In Cart

Test Case 4 - Add Multiple Products And Checkout
    Login    ${VALID_USER}    ${VALID_PASS}
    Add Multiple Products
    Go To Checkout
    Fill Checkout Details
    Verify Checkout Summary