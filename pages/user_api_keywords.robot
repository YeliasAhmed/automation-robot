*** Settings ***
Library    RequestsLibrary
Library    ../libraries/environment_manager.py
Resource   ../resources/api_session.robot

*** Keywords ***
Login User
    [Arguments]    ${username}    ${password}
    ${response}=    GET On Session    petstore    /user/login    params=username=${username}&password=${password}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Logout User
    ${response}=    GET On Session    petstore    /user/logout
    Should Be Equal As Integers    ${response.status_code}    200
    RETURN    ${response}

Get User By Username
    [Arguments]    ${username}
    ${response}=    GET On Session    petstore    /user/${username}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Create User
    [Arguments]    ${user_body}
    ${response}=    POST On Session    petstore    /user    json=${user_body}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Update User
    [Arguments]    ${username}    ${user_body}
    ${response}=    PUT On Session    petstore    /user/${username}    json=${user_body}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Delete User
    [Arguments]    ${username}
    ${response}=    DELETE On Session    petstore    /user/${username}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}