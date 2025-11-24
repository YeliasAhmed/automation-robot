*** Settings ***
Documentation     Pet API Tests
Resource          ../../pages/pet_api_keywords.robot
Library           ../../libraries/environment_manager.py

Suite Setup       Create PetStore API Session    ${ENV}

*** Variables ***
${ENV}    qa

*** Test Cases ***

TC01 Add Pet Successfully
    ${pet}=    Create Dictionary
    ...    id=501
    ...    name=robot_dog
    ...    status=available

    ${response}=    Add Pet    ${pet}
    Should Be Equal As Integers    ${response["id"]}    501

TC02 Get Pet Successfully
    ${response}=    Get Pet By ID    501
    Should Be Equal    ${response["name"]}    robot_dog

TC03 Update Pet Info
    ${pet}=    Create Dictionary
    ...    id=501
    ...    name=updated_robot_dog
    ...    status=sold

    ${response}=    Update Pet    ${pet}

    Should Be Equal As Integers    ${response["id"]}    501
    Should Be Equal                ${response["name"]}    updated_robot_dog
    Should Be Equal                ${response["status"]}    sold

TC04 Delete Pet Successfully
    ${response}=    Delete Pet    501
    Should Be Equal As Integers    ${response["code"]}    200