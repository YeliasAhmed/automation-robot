*** Settings ***
Library    RequestsLibrary
Library    ../libraries/environment_manager.py

*** Keywords ***
Create PetStore API Session
    [Arguments]    ${env}
    ${config}=    Load Env    ${env}
    ${base}=      Set Variable    ${config["api"]["base_url"]}
    Create Session    petstore    ${base}