*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/locators.robot

*** Keywords ***
Proceed To Checkout
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}    timeout=10s
    Click Button    ${CHECKOUT_BUTTON}

Enter Checkout Details
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}
    Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}
    Click Button    ${CONTINUE_BUTTON}

Finish Checkout
    Wait Until Element Is Visible    ${FINISH_BUTTON}    timeout=10s
    Click Button    ${FINISH_BUTTON}
    Wait Until Page Contains Element    ${SUCCESS_MESSAGE}    timeout=10s