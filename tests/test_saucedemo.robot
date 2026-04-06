*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../variables/variables.robot

# Runs before each test - opens browser
Test Setup      Open Browser To SauceDemo

# Runs after each test - closes browser
Test Teardown   Close Browser

*** Test Cases ***

# Valid login and verify landing page
Test Case 1 - Valid Login
    Login    ${VALID_USER}    ${VALID_PASS}
    Verify Products Page

# Invalid login and verify error message
Test Case 2 - Invalid Login
    Login    ${INVALID_USER}    ${INVALID_PASS}
    Verify Error Message

# Add one product to cart and verify
Test Case 3 - Add Single Product
    Login    ${VALID_USER}    ${VALID_PASS}
    Add Single Product To Cart
    Open Cart
    Verify Product In Cart

# Add multiple products and complete checkout flow
Test Case 4 - Add Multiple Products And Checkout
    Login    ${VALID_USER}    ${VALID_PASS}
    Add Multiple Products
    Go To Checkout
    Fill Checkout Details
    Verify Checkout Summary