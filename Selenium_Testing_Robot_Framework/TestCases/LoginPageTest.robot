*** Settings ***
Documentation  Login to saucedemo
Library     SeleniumLibrary
Library     Collections
Test Setup  open the browser with url
Test Teardown   close the browser after execution
Resource  ../PageObjects/LoginPageResource.robot
Resource  ../PageObjects/GenericResource.robot
Library  SeleniumLibrary

*** Variables ***
${username_locator}     id:user-name
${password_locator}     id:password
${login_button_id}      id:login-button
${logo_text_locator}    css:.app_logo
${invalid_login_text_locator}  css:[data-test='error']
${list_webelements_locator}     css:.bm-item.menu-item
${element}  Logout

*** Test Cases ***
Valid Login to Saucedemo
    [Tags]  REGRESSION
    input valid credentials     ${valid_username}       ${valid_password}
    click on login
    verify valid login, wait for the page to load and verify title

Order item from SauceDemo
    [Tags]  REGRESSION  SMOKE
    input valid credentials     ${valid_username}       ${valid_password}
    click on login
    verify valid login, wait for the page to load and verify title

Invalid Login to Saucedemo
    [Tags]  REGRESSION  SMOKE
    input invalid credentials     ${invalid_username}     ${valid_password}
    click on login
    verify invalid login, wait for the page to load and verify error message



*** Keywords ***
input valid credentials
    [Arguments]     ${username}     ${password}
    input text  ${username_locator}     ${username}
    input password  ${password_locator}   ${password}

input invalid credentials
    [Arguments]     ${username}     ${password}
    input text  ${username_locator}     ${username}
    input password  ${password_locator}   ${password}

click on login
    click button  ${login_button_id}

verify valid login, wait for the page to load and verify title
    wait until element is visible  ${logo_text_locator}
    ${result}=  get text  ${logo_text_locator}
    should be equal as strings  ${result}   ${title_page_text}
    element text should be  ${logo_text_locator}   ${title_page_text}

verify invalid login, wait for the page to load and verify error message
    wait until element is visible  ${invalid_login_text_locator}
    ${result}=  get text  ${invalid_login_text_locator}
    should be equal as strings  ${result}   ${invalid_login_page_text}
    element text should be  ${invalid_login_text_locator}   ${invalid_login_page_text}





