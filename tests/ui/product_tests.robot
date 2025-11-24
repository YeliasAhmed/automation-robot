*** Settings ***
Documentation     UI tests for Product Add to Cart and Checkout.
Resource          ../../pages/ui_keywords.robot
Library           ../../libraries/environment_manager.py

Suite Setup       Log To Console    Starting Product Tests...
Test Setup        Open Browser To Login Page From Env
Test Teardown     Close Browser
Suite Teardown    Log To Console    Completed Product Tests.

*** Variables ***
${ENV}    qa

*** Test Cases ***
TC03 Verify Add Product To Cart
    ${config}=    Load Env    ${ENV}
    Login To Application          ${config["ui"]["credentials"]["username"]}    ${config["ui"]["credentials"]["password"]}
    Add Product To Cart           Sauce Labs Backpack
    Open Cart
    Page Should Contain           Sauce Labs Backpack

TC04 Verify Checkout Flow
    ${config}=    Load Env    ${ENV}
    Login To Application          ${config["ui"]["credentials"]["username"]}    ${config["ui"]["credentials"]["password"]}
    Add Product To Cart           Sauce Labs Bike Light
    Open Cart
    Proceed To Checkout
    Enter Checkout Details        John    Doe    12345
    Finish Checkout
    Page Should Contain Element   ${SUCCESS_MESSAGE}
    Logout From Application
