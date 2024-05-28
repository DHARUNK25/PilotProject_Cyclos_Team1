*** Settings ***
Documentation    All the page object and keyword of Payment to user Page
Library    SeleniumLibrary

*** Variables ***
${select_payment_to_user}    xpath://div[text()="Payment to user"]
${payment_user_title}    xpath://div[@class="content-title d-flex"]//div
${to_User}    xpath://input[@placeholder="Type to search"]
${user_select}    xpath://div[@role='listbox']/a[text()=' Demo one ']
${amount}    xpath://div[@class="input-group"]//input
${to_user_error_msg}    xpath:(//field-errors)[1]//div
${amount_error_msg}    xpath:(//field-errors)[2]//div
${Scheduling}    xpath://button[@class='form-control text-left custom-select w-100']
${monthly_inst_option}    xpath://div[@role='listbox']//a[text()=' Monthly installments ']
${no_of_installments}    xpath://div[@class='d-flex label-value-value']//input[@type='number']
${first_instal}    xpath://label[@class='custom-control-label' and text()=' Future date ']
${future_date}    xpath://div[@class='d-flex label-value-value']//input[@type='date']
${descrip_xpath}    xpath://div[@class='d-flex label-value-value']//textarea
${next}    xpath://span[text()='Next']
${pay_confirm_title}    xpath://div[text()=' Payment confirmation ']
${confirm_button}    xpath://span[text()='Confirm']
${successfull_payment_msg}    xpath://div[@class="notification-message"]//div
${user_name}    demo  
${amount_data}    10  
${inst_no}    5  
${fut_date}    30-05-2024     
${description}    Monthly Installments

*** Keywords ***

Select the option payment to user
    Wait Until Element Is Visible    ${select_payment_to_user}
    Click Element    ${select_payment_to_user}

verify the payment to user page open
    Element Text Should Be    ${payment_user_title}      Payment to user  

Enter the username in the to user field
    [Arguments]    ${user_name}
    Input Text    ${to_User}    ${user_name}

Select the user
    Click Element    ${user_select}

verify the error message for user to field is given blank
    Element Text Should Be    ${to_user_error_msg}     This field is required

verify the error message for amount field is given blank
    Element Text Should Be    ${amount_error_msg}     This field is required

Enter the valid amount in the amount field
    [Arguments]    ${amount_data}
    Input Text    ${amount}    ${amount_data}

Click the scheduling dropdown button
    Click Element    ${Scheduling}

Click the monthly installment option
    Click Element    ${monthly_inst_option}

Fill the no of installments
    [Arguments]    ${no_of_installments_data}
    Input Text    ${no_of_installments}    ${no_of_installments_data}

Click the first installment
    Click Element    ${first_instal}

Fill the future date
    [Arguments]    ${fut_date}
    Input Text    ${future_date}    ${fut_date}

Fill the description
    [Arguments]    ${description}
    Input Text    ${descrip_xpath}    ${description}

Click the next Button in payment page
    Wait Until Element Is Visible    ${next}
    Click Element    ${next}

Verify the confirmation page is displayed
    Element Should Be Visible    ${pay_confirm_title}

Click the confirm button in the payment page
    Wait Until Element Is Visible    ${confirm_button}
    Click Element    ${confirm_button}

verify the succesfull payment notification
    Wait Until Element Is Visible    ${successfull_payment_msg}
    Element Text Should Be    ${successfull_payment_msg}    The payment was successfully processed
