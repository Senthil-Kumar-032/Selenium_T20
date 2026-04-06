*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Open Browser To SauceDemo
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    # Disable Chrome password manager & security popup
    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    profile.password_manager_leak_detection=${False}

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Open Browser    ${URL}    chrome    options=${options}
    Maximize Browser Window
    Wait Until Element Is Visible    id:user-name    10s

Close Browser
    Close All Browsers

Login
    [Arguments]    ${username}    ${password}
    Input Text    id:user-name    ${username}
    Input Text    id:password     ${password}
    Click Button  id:login-button

Verify Products Page
    Wait Until Page Contains Element    class:title    10s

Verify Error Message
    Wait Until Page Contains    Epic sadface    10s

Add Single Product To Cart
    Click Button    xpath:(//button[text()='Add to cart'])[1]

Open Cart
    Click Element    class:shopping_cart_link

Verify Product In Cart
    Page Should Contain    Remove

Add Multiple Products
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-bike-light

Go To Checkout
    Click Element    class:shopping_cart_link
    Click Button     id:checkout
    Wait Until Element Is Visible    id:first-name    10s

Fill Checkout Details
    Wait Until Element Is Visible    id:first-name    10s
    Input Text    id:first-name    Senthil
    Input Text    id:last-name     Kumar
    Input Text    id:postal-code   627011
    Click Button  id:continue

Verify Checkout Summary
    Wait Until Page Contains    Checkout: Overview    10s