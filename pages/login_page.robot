*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/locators.robot
Resource   ../resources/variables.robot

*** Keywords ***
Login To Application
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${LOGIN_USERNAME}    timeout=${TIMEOUT}
    Input Text    ${LOGIN_USERNAME}    ${username}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button  ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${INVENTORY_LIST}    timeout=${TIMEOUT}

Logout From Application
    Wait Until Element Is Visible    ${BURGER_MENU_BUTTON}    timeout=${TIMEOUT}
    Click Button    ${BURGER_MENU_BUTTON}
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=${TIMEOUT}
    Click Element   ${LOGOUT_BUTTON}