*** Settings ***
Documentation    To validate Banking - payment to user Functionality
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Resource    C:\\Cyclos_project\\PilotProject_Cyclos_Team1-2\\Resources\\GenericResource.robot
Resource    C:\\Cyclos_project\\PilotProject_Cyclos_Team1-2\\Resources\\LoginResource.robot
Resource    C:\\Cyclos_project\\PilotProject_Cyclos_Team1-2\\Resources\\HomeResource.robot
Resource    C:\\Cyclos_project\\PilotProject_Cyclos_Team1-2\\Resources\\PaymentUser.robot
Library    DataDriver    file=../TestData/payment_to_user_testdata.xlsx    sheet_name=Sheet1

Test Template    To validate the payment to user functionality with Recurring payment


*** Test Cases ***
To validate payment    ${user_name}    ${amount_data} 


*** Keywords ***

To validate the payment to user functionality with Recurring payment
    [Tags]    Smoke
    [Arguments]    ${user_name}    ${amount_data}
    LoginResource.click the login button
    LoginResource.Fill the Login page
    HomeResource.Click on the Banking button
    PaymentUser.verify the Banking page open
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the username in the to user field    ${user_name}
    PaymentUser.Select the user
    PaymentUser.Enter the valid amount in the amount field    ${amount_data}
    PaymentUser.Click the scheduling dropdown button
    PaymentUser.Select the Recurring payment option
    PaymentUser.Click the process every dropdown list
    PaymentUser.Select the week in process every dropdown list
    PaymentUser.Click the next Button in payment page
    PaymentUser.Click the confirm button in the payment page
    PaymentUser.Click Cancel the recurring payment
    PaymentUser.verify the cancellation status
