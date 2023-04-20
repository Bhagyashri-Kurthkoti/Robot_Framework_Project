*** Settings ***
Documentation  This file contains all the configurations required for tests
Library  SeleniumLibrary

*** Variables ***
${valid_username}     standard_user
${valid_password}     secret_sauce
${invalid_username}     locked_out_user
${title_page_text}   Swag Labs
${invalid_login_page_text}  Epic sadface: Sorry, this user has been locked out.


