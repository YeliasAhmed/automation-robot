*** Settings ***
Documentation     UI tests for SauceDemo login and product page.
Resource          ../../keywords/ui_keywords.robot
Library           ../../libraries/environment_manager.py

Suite Setup       Log To Console    Starting UI Test Suite...
Test Setup        Open Browser To Login Page From Env
Test Teardown     Close Browser
Suite Teardown    Log To Console    UI Test Suite Completed.

*** Variables ***
${ENV}    dev

*** Test Cases ***
TC01 Verify Login Page Loads
    [Documentation]    Check that the login page loads correctly and all key elements are visible.
    Title Should Be    Swag Labs
    Wait Until Element Is Visible    id:login-button    timeout=10s
    Page Should Contain Element      id:login-button

TC02 Verify Invalid Login Shows Error
    [Documentation]    Attempt login with wrong credentials and confirm error message appears.
    Input Text         id:user-name    wrong_user
    Input Text         id:password     wrong_pass
    Click Button       id:login-button
    Wait Until Page Contains    Epic sadface    timeout=5s
    Page Should Contain         Epic sadface

TC03 Verify Successful Login
    [Documentation]    Log in with valid credentials and verify successful redirect to product page.
    ${config}=    Load Env    ${ENV}
    Login To Application        ${config["username"]}    ${config["password"]}
    Verify Login Successful
    Wait Until Page Contains Element    class:inventory_list    timeout=10s
    Page Should Contain Element         class:inventory_item

TC04 Verify Product List Is Visible
    [Documentation]    After successful login, verify product items are visible on the inventory page.
    ${config}=    Load Env    ${ENV}
    Login To Application        ${config["username"]}    ${config["password"]}
    Wait Until Page Contains Element    xpath://div[@class='inventory_item']    timeout=10s
    Page Should Contain         Sauce Labs Backpack
    Page Should Contain Element    xpath://div[contains(text(),'Sauce Labs Bike Light')]

TC05 Verify Logout Works
    [Documentation]    Log in, perform logout, and verify user is redirected back to login page.
    ${config}=    Load Env    ${ENV}
    Login To Application        ${config["username"]}    ${config["password"]}
    Logout From Application
    Wait Until Element Is Visible    id:login-button    timeout=10s
    Page Should Contain Element      id:login-button