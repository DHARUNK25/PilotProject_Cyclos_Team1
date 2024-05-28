*** Settings ***
Documentation    This checks the Receive payment fubctionality
Library    SeleniumLibrary
Resource    ../Resources/ReceivePaymentResouce.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Library    DataDriver    file=../TestData/receivePay_data.xlsx   sheet_name=blank
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    Validate the Receive payment functionality with empty data

*** Variables ***
${blank_user}
${blank_amount}
${blank_description}

*** Test Cases ***
Validate Receive payment with data    ${blank_amount}
    [Tags]  smoke
*** Keywords ***
Validate the Receive payment functionality with empty data
    [Documentation]    This checks the Receive payment functionality with empty data
<<<<<<< HEAD
    [Arguments]       ${blank_amount}
    LoginResource.Fill the Login page    demo    1234
=======
    [Tags]  invalid_Receive_payment
    [Arguments]    ${blank_user}    ${blank_amount}    ${blank_description}
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    dharun    1234
    LoginResource.click the login button
>>>>>>> 01b69c07ea1caf163703629db64d50ab3defbb9c
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceivePaymentResouce.Verify the Receive payment page
    ReceivePaymentResouce.Fill the receive payment form with data    ${blank_user}    ${blank_amount} 
    ReceivePaymentResouce.Click the next button
    ReceivePaymentResouce.verify user error message is displayed
    ReceivePaymentResouce.verify amount error message is displayed