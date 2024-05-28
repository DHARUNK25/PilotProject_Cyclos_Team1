*** Settings ***
Documentation    To validate Banking - payment to user Functionality
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Resource    C:\\Cyclos_project\\PilotProject_Cyclos_Team1-2\\Resources\\GenericResource.robot
Resource    C:\\Cyclos_project\\PilotProject_Cyclos_Team1-2\\Resources\\LoginResource.robot
Resource    C:\\Cyclos_project\\PilotProject_Cyclos_Team1-2\\Resources\\HomeResource.robot
Resource    C:\\Cyclos_project\\PilotProject_Cyclos_Team1-2\\Resources\\PaymentUser.robot
Library    DataDriver    file=../TestData/payment_to_user_testdata.xlsx    sheet_name=Sheet2

Test Template    To validate payment to user functionality with invalid amount

 

*** Test Cases ***
To validate payment    ${user_name}    ${exceeded_amount_data} 
    
*** Keywords ***

To validate payment to user functionality with invalid amount
    [Tags]    Smoke
    [Arguments]    ${user_name}    ${exceeded_amount_data}
    LoginResource.click the login button
    LoginResource.Fill the Login page
    HomeResource.Click on the Banking button
    PaymentUser.verify the Banking page open
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the username in the to user field    ${user_name}
    PaymentUser.Select the user
    PaymentUser.Enter the valid amount in the amount field    ${exceeded_amount_data}
    PaymentUser.Click the scheduling dropdown button
    PaymentUser.Click the pay now option
    PaymentUser.Click the next Button in payment page
    PaymentUser.verify exceeded amount is entered
