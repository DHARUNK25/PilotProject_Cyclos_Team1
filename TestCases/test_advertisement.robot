*** Settings ***
Documentation    To validate Advertisement Functionality
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Resource   ../Resources/AdvertisementResource.robot


*** Test Cases ***

verify that the valid keyword is entered in the keyword field
    [Tags]    Smoke
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the MarketPlace button
    AdvertisementResource.verify that the markerplace is open
    AdvertisementResource.Click on the advertisement page button
    Sleep    5
    AdvertisementResource.Enter the valid Keyword in the keyword box
    AdvertisementResource.verify the keyword based items displayed

verify that the Invalid keyword is entered in the keyword field
    [Tags]    Retest    invalid
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the MarketPlace button
    AdvertisementResource.verify that the markerplace is open
    AdvertisementResource.Click on the advertisement page button
    Sleep    3
    AdvertisementResource.Enter the invalid Keyword in the keyword box
    AdvertisementResource.verify the invalid keyword error message is displayed



Verify the advertisements functionality with dropdownlist order by Relevance
    [Tags]    Smoke
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the MarketPlace button
    AdvertisementResource.verify that the markerplace is open
    AdvertisementResource.Click on the advertisement page button
    AdvertisementResource.Click the show advertisement button
    AdvertisementResource.Click on the dropdown button Order by
    AdvertisementResource.Select the option relevance
    AdvertisementResource.verify relevance option


Verify the advertisements functionality with dropdownlist order by last published
    [Tags]     Smoke
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the MarketPlace button
    AdvertisementResource.verify that the markerplace is open
    AdvertisementResource.Click on the advertisement page button
    AdvertisementResource.Click the show advertisement button
    AdvertisementResource.Click on the dropdown button Order by
    AdvertisementResource.Select the option last published
    AdvertisementResource.verify relevance option



Verify the advertisements functionality with dropdownlist order by lowest
    [Tags]    Smoke
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the MarketPlace button
    AdvertisementResource.verify that the markerplace is open
    AdvertisementResource.Click on the advertisement page button
    AdvertisementResource.Click the show advertisement button
    AdvertisementResource.Click on the dropdown button Order by
    AdvertisementResource.Select the option lowest price
    AdvertisementResource.verify the lowest price



Verify the advertisements functionality with dropdownlist order by Highest
    [Tags]    Smoke
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click on the MarketPlace button
    AdvertisementResource.verify that the markerplace is open
    AdvertisementResource.Click on the advertisement page button
    AdvertisementResource.Click the show advertisement button
    AdvertisementResource.Click on the dropdown button Order by
    AdvertisementResource.Select the option highest price
    AdvertisementResource.verify the highest price



verify the wishlist functionality
    [Tags]    Regression
    LoginResource.click the login button
    LoginResource.Fill the Login page
    HomeResource.Click on the MarketPlace button
    AdvertisementResource.Click on the advertisement page button
    AdvertisementResource.Select the favourite only checkbox
    AdvertisementResource.verify the favourite list contains favorite item


    