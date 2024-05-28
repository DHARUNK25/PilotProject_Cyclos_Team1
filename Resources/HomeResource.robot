*** Settings ***
Documentation    All the page objects and keywords of Home page
Library    SeleniumLibrary
*** Variables ***
${Banking_Xpath}    xpath://a[@id='menu_banking']
${Banking_page_verify}    xpath://div[text()='Banking']
${Banking_page_keyword}    Banking
${Marketplace_Xpath}    xpath://a[@id='menu_marketplace']
${Marketplace_page_verify}    xpath://div[@class='side-menu-title' and text()=' Marketplace ']
${Marketplace_page_keyword}    Marketplace
*** Keywords ***
Click the Banking Option
     Wait Until Element Is Visible    ${Banking_Xpath}   
     Click Element   ${Banking_Xpath} 
     
Verify the Banking page is displayed
    Element Text Should Be    ${Banking_page_verify}    ${Banking_page_keyword}

Click the Marketplace Option
     Wait Until Element Is Visible    ${Marketplace_Xpath}   
     Click Element   ${Marketplace_Xpath} 
     
Verify the Marketplace page is displayed
    Element Text Should Be    ${Marketplace_page_verify}    ${Marketplace_page_keyword}
