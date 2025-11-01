*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/locators.robot
Resource   ../resources/variables.robot
Library    ../libraries/environment_manager.py

*** Keywords ***
Open Browser To Login Page
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    10s
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=10s

Open Browser To Login Page From Env
    ${config}=    Load Env    ${ENV}
    Open Browser To Login Page    ${config["ui_url"]}

Login To Application
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${LOGIN_USERNAME}    timeout=10s
    Input Text    ${LOGIN_USERNAME}    ${username}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button  ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${INVENTORY_LIST}    timeout=10s

Verify Login Successful
    Wait Until Page Contains Element    ${INVENTORY_LIST}    timeout=10s

Logout From Application
    Wait Until Element Is Visible    id:react-burger-menu-btn    timeout=10s
    Click Button    id:react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link    timeout=10s
    Click Element   id:logout_sidebar_link
    Wait Until Page Contains Element    id:login-button    timeout=10s