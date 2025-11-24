*** Settings ***
Library    RequestsLibrary
Library    ../libraries/environment_manager.py
Resource    ../resources/api_session.robot

*** Keywords ***

# PET APIs

Add Pet
    [Arguments]    ${pet_body}
    ${response}=    POST On Session    petstore    /pet    json=${pet_body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Get Pet By ID
    [Arguments]    ${pet_id}
    ${response}=    GET On Session    petstore    /pet/${pet_id}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Update Pet
    [Arguments]    ${pet_body}
    ${response}=    PUT On Session    petstore    /pet    json=${pet_body}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Delete Pet
    [Arguments]    ${pet_id}
    ${response}=    DELETE On Session    petstore    /pet/${pet_id}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}