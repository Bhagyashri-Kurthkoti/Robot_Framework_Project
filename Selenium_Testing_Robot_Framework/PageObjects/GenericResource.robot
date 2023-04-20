*** Settings ***
Documentation  This file contains all the configurations required for tests
Library  SeleniumLibrary


*** Keywords ***
open the browser with url
    open browser    https://www.saucedemo.com/     chrome  executable_path=C:/Users/xxpallep/Desktop/chromedriver.exe

close the browser after execution
    close browser

