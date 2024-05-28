*** Settings ***
Documentation    Test to Register Page
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/login_data.xlsx    sheet_name=validatingBlank
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/HomeResource.robot
Resource    ../Resources/RegisterResource.robot
Test Template    Valid register with blank fields

*** Test Cases ***
valid register Test case
    ${website}    ${gender}    ${mobile}    ${land_line}    ${address}    ${zip}    ${city}    ${region}

*** Keywords ***

Valid register with blank fields

    [Tags]    Regression
    [Arguments]    ${website}    ${gender}    ${mobile}    ${land_line}    ${address}    ${zip}    ${city}    ${region}
    HomeResource.Go to Register Page
    RegisterResource.Verify Register Page opens
    RegisterResource.Fill the Remaining profile feilds    ${website}    ${gender}    ${mobile}    ${land_line}
    RegisterResource.Enable address fields
    RegisterResource.Fill the address fields    ${address}    ${zip}    ${city}    ${region}
    RegisterResource.Click next button
    RegisterResource.verfication for necessary fields