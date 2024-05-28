*** Settings ***
Documentation    Test to Register Page
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/login_data.xlsx    sheet_name=mandatoryField
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/HomeResource.robot
Resource    ../Resources/RegisterResource.robot
Test Template    Valid register with mandatory fields

*** Test Cases ***
valid register Test case
    ${name}    ${login}    ${email}    ${password}    ${confirm_password}

*** Keywords ***

Valid register with mandatory fields
    [Tags]    Smoke
    [Arguments]    ${name}    ${login}    ${email}    ${password}    ${confirm_password}
    HomeResource.Go to Register Page
    RegisterResource.Verify Register Page opens
    RegisterResource.Fill the Required feilds    ${name}    ${login}    ${email}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    RegisterResource.clicking next button for mandatory field
    RegisterResource.Fill password fields    ${password}    ${confirm_password}
    RegisterResource.Click Registration confirmation checkbox
    RegisterResource.Click submit button
    RegisterResource.Verify the registration is successful

