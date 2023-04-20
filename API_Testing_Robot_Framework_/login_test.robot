*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  String

*** Variables ***
${baseurl}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${url}  https://reqres.in


*** Test Cases ***
LoginTest
    Create Session  login   ${baseurl}
    ${response} =   GET On Session  login   ${baseurl}
    Log  ${response.status_code}
    Log  ${response.content}
    Log  ${response.headers}
    ${status_code}=  convert to string  ${response.status_code}
    should be equal as strings   ${status_code}    200
    ${content}=    convert to string  ${response.content}
    should contain   ${content}    OrangeHRM

PostRequest
    Create Session  registration    ${url}
    ${body}=    create dictionary  email=morpheus     job=leader
    #${header}=  create dictionary  content-Type=application/json
    ${response}=    POST On Session     registration    ${url}/api/users    data=${body}
    should be equal as strings  ${response.status_code}     201
    #${header_value}=    get from dictionary  ${response.headers}     content-Type
    #should be equal   ${header_value}   application/json
    ${response_txt}=   convert to string  ${response.content}
    should contain  ${response_txt}     leader
