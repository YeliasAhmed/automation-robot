*** Settings ***
Documentation     Store API Tests
Resource          ../../pages/store_api_keywords.robot
Library           ../../libraries/environment_manager.py

Suite Setup       Create PetStore API Session    ${ENV}

*** Variables ***
${ENV}    qa

*** Test Cases ***

TC01 Place Order Successfully
    ${order}=    Create Dictionary
    ...    id=800
    ...    petId=501
    ...    quantity=2
    ...    shipDate=2025-02-01T10:00:00.000Z
    ...    status=placed
    ...    complete=True

    ${response}=    Place Order    ${order}
    Should Be Equal As Integers    ${response["id"]}    800

TC02 Get Order Successfully
    ${response}=    Get Order By ID    800
    Should Be Equal As Integers    ${response["quantity"]}    2

TC03 Delete Order Successfully
    ${response}=    Delete Order    800
    Should Be Equal As Integers    ${response["code"]}    200

TC04 Get Inventory
    ${response}    ${json}=    Get Inventory
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Inventory fetched.