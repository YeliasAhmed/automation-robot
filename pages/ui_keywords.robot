*** Settings ***
Library     SeleniumLibrary
Library     ../libraries/environment_manager.py
Library    Collections
Library    RequestsLibrary
Resource    ../resources/locators.robot
Resource    ../resources/variables.robot
Resource    ../pages/login_page.robot
Resource    ../pages/product_page.robot
Resource    ../pages/checkout_page.robot

*** Keywords ***
Get Chrome Options
    [Arguments]    ${headless}=True
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    IF    ${headless}
        Call Method    ${options}    add_argument    --headless
    END

    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu

    [Return]    ${options}


Open Browser To Login Page
    [Arguments]    ${url}
    ${options}=    Get Chrome Options    ${HEADLESS}
    Open Browser    ${url}    chrome    options=${options}
    Set Selenium Timeout    ${TIMEOUT}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=${TIMEOUT}

Open Browser To Login Page From Env
    ${config}=    Load Env    ${ENV}
    Open Browser To Login Page    ${config["ui"]["url"]}
