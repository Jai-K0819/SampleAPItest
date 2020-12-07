*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url} =  http://restapi.demoqa.com

*** Test Cases ***
BasicAuthTest
    ${auth} =  create list  ToolsQA  TestPassword
    create session  basicauth  ${base_url}  auth=${auth}
    ${response} =  get request  basicauth  /authentication/CheckForAuthentication/
    log to console  ${response.content}
    should be equal as strings  ${response.status_code}  200