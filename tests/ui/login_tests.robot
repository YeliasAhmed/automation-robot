*** Settings ***
Documentation     UI tests for SauceDemo login and logout.
Resource          ../../pages/ui_keywords.robot
Library           ../../libraries/environment_manager.py

Suite Setup       Log To Console    Starting UI Login Tests...
Test Setup        Open Browser To Login Page From Env
Test Teardown     Close Browser
Suite Teardown    Log To Console    Completed UI Login Tests.

*** Variables ***
${ENV}    dev

*** Test Cases ***
TC01 Verify Login Page Loads
    [Documentation]    Check that the login page loads correctly and all key elements are visible.
    Title Should Be    Swag Labs
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=${TIMEOUT}

TC02 Verify Successful Login And Logout
    [Documentation]    This test verify the login and logout of the system
    ${config}=    Load Env    ${ENV}
    Login To Application          ${config["ui"]["credentials"]["username"]}    ${config["ui"]["credentials"]["password"]}
    Wait Until Page Contains Element    ${INVENTORY_LIST}    timeout=${TIMEOUT}
    Logout From Application
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=${TIMEOUT}



