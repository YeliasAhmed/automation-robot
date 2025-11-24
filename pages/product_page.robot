*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/locators.robot

*** Keywords ***
Add Product To Cart
    [Arguments]    ${product_name}
    ${xpath}=    Set Variable    xpath://div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button
    Wait Until Element Is Visible    ${xpath}    timeout=10s
    Click Button    ${xpath}

Open Cart
    Click Element    ${CART_ICON}