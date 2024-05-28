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

Test Template    To validate payment to user functionality with blank fields
 


*** Test Cases ***
To validate payment    ${user_name}    ${amount_data} 


*** Keywords ***

To validate payment to user functionality with blank fields
    [Tags]    Smoke
    LoginResource.click the login button
    LoginResource.Fill the Login page
    HomeResource.Click on the Banking button
    PaymentUser.verify the Banking page open
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Click the next Button in payment page
    PaymentUser.verify the error message for user to field is given blank
    PaymentUser.verify the error message for amount field is given blank

