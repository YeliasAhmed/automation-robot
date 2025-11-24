*** Settings ***
Library    RequestsLibrary
Library    ../libraries/environment_manager.py
Resource   ../resources/api_session.robot

*** Keywords ***
# STORE APIs
Place Order
    [Arguments]    ${order_body}
    ${response}=    POST On Session    petstore    /store/order    json=${order_body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Get Order By ID
    [Arguments]    ${order_id}
    ${response}=    GET On Session    petstore    /store/order/${order_id}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Delete Order
    [Arguments]    ${order_id}
    ${response}=    DELETE On Session    petstore    /store/order/${order_id}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Get Inventory
    ${response}=    GET On Session    petstore    /store/inventory
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${response}    ${json}