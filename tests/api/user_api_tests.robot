*** Settings ***
Documentation     PetStore User API Tests
Resource          ../../pages/user_api_keywords.robot
Library           ../../libraries/environment_manager.py

Suite Setup       Create PetStore API Session    ${ENV}

*** Variables ***
${ENV}    qa

*** Test Cases ***

TC01 Login User Successfully
    ${config}=    Load Env    ${ENV}
    ${username}=    Set Variable    ${config["api"]["credentials"]["username"]}
    ${password}=    Set Variable    ${config["api"]["credentials"]["password"]}

    ${response}=    Login User    ${username}    ${password}
    Should Contain    ${response["message"]}    logged
    Log To Console    User login successful.

TC02 Login With Invalid Credentials Should Still Return 200
    [Documentation]    PetStore API always returns 200 OK even for invalid login. This verifies the expected 200.
    ${config}=    Load Env    ${ENV}
    ${username}=    Set Variable    ${config["api"]["credentials"]["invalid_username"]}
    ${password}=    Set Variable    ${config["api"]["credentials"]["invalid_password"]}

    ${response}=    GET On Session    petstore    /user/login    params=username=${username}&password=${password}

    Should Be Equal As Integers    ${response.status_code}    200
    Should Contain    ${response.text}    logged in user session
    Log To Console    PetStore does not validate credentials; 200 is expected.

TC03 Create User
    ${user}=    Create Dictionary
    ...    id=101
    ...    username=test_user_101
    ...    firstName=Test
    ...    lastName=User
    ...    email=test101@example.com
    ...    password=pass123
    ...    phone=123456
    ...    userStatus=1

    ${response}=    Create User    ${user}
    Should Be Equal As Integers    ${response["code"]}    200

TC04 Get Created User
    ${response}=    Get User By Username    test_user_101
    Should Be Equal    ${response["username"]}    test_user_101

TC05 Update User Information
    ${updated}=    Create Dictionary
    ...    id=101
    ...    username=test_user_101
    ...    firstName=Updated
    ...    lastName=User
    ...    email=updated@example.com
    ...    password=pass123
    ...    phone=777777
    ...    userStatus=1

    ${response}=    Update User    test_user_101    ${updated}
    Should Be Equal As Integers    ${response["code"]}    200

TC06 Delete User
    ${response}=    Delete User    test_user_101
    Should Be Equal As Integers    ${response["code"]}    200