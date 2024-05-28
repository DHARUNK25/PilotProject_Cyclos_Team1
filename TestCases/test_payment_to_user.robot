*** Settings ***
Documentation    To validate Banking - payment to user Functionality
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Resource    ../Resources/GenericResource.robot
Resource   ../Resources/LoginResource.robot
Resource   ../Resources/HomeResource.robot
Resource    ../Resources/PaymentUser.robot
Library    DataDriver    file=../TestData/payment_to_user_testdata.xlsx    sheet_name=Sheet1

Test Template    To validate payment to user functionality with valid amount
 

*** Variables ***
${amount_data}


*** Test Cases ***
To validate payment    ${user_name}    ${amount_data} 
    

*** Keywords ***
To validate payment to user functionality with valid amount 
    
    [Tags]    Smoke
    [Arguments]    ${user_name}    ${amount_data}
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the Banking button
    PaymentUser.verify the Banking page open
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the username in the to user field   ${user_name}
    PaymentUser.Select the user
    PaymentUser.Enter the valid amount in the amount field     ${amount_data}
    PaymentUser.Click the scheduling dropdown button
    PaymentUser.Click the pay now option
    PaymentUser.Click the next Button in payment page
    PaymentUser.Click the confirm button in the payment page
    PaymentUser.verify the succesfull payment notification
    sleep   5

To validate payment to user functionality with invalid amount
    [Tags]    exceed_max_amount_message
    [Arguments]    ${user_name}    ${amount_data}
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the Banking button
    PaymentUser.verify the Banking page open
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the username in the to user field    ${user_name}
    PaymentUser.Select the user
    PaymentUser.Enter the valid amount in the amount field    ${amount_data}
    PaymentUser.Click the scheduling dropdown button
    PaymentUser.Click the pay now option
    PaymentUser.Click the next Button in payment page
    PaymentUser.Click the confirm button in the payment page
    PaymentUser.verify the exceed maximun payment error message is dispalyed



To validate payment to user functionality with user to field is given blank 
    [Tags]    Blank_user_fields
    [Arguments]    ${amount_data}
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the Banking button
    PaymentUser.verify the Banking page open
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the valid amount in the amount field   ${amount_data}
    PaymentUser.Click the next Button in payment page
    PaymentUser.verify the error message for user to field is given blank




To validate payment to user functionality with amount field is given blank 
    [Tags]    Blank_amount_fields
    [Arguments]    ${user_name}
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the Banking button
    PaymentUser.verify the Banking page open
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the username in the to user field    ${user_name}
    PaymentUser.Select the user
    PaymentUser.Click the next Button in payment page
    PaymentUser.verify the error message for amount field is given blank


To validate payment to user functionality with blank fields
    [Tags]    Blank_fields
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the Banking button
    PaymentUser.verify the Banking page open
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Click the next Button in payment page
    PaymentUser.verify the error message for user to field is given blank
    PaymentUser.verify the error message for amount field is given blank




To validate the payment to user functionality with Recurring payment
    [Tags]    Recurring_payment
    [Arguments]    ${user_name}    ${amount_data}
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
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
