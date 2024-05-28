*** Settings ***
Documentation    Test to Register Page
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/login_data.xlsx    sheet_name=alreadyEmail
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/HomeResource.robot
Resource    ../Resources/RegisterResource.robot
Test Template    Valid register with already existing email

*** Test Cases ***
valid register Test case
    ${name}    ${login}    ${email}

*** Keywords ***

Valid register with already existing email
    [Tags]    Regression
    [Arguments]    ${name}    ${login}    ${email} 
    HomeResource.Go to Register Page
    RegisterResource.Verify Register Page opens
    RegisterResource.Fill the Required feilds    ${name}    ${login}    ${email}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    RegisterResource.clicking next button for mandatory field
    RegisterResource.verification for email already exists