*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  OperatingSystem

*** Variables ***
${base_url}     https://certtransaction.elementexpress.com
${bearerToken}   "Bearer A4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
BearerAuthTest
    create session  mysession  ${base_url}

    ${headers}=  create dictionary  Authorization=${bearerToken}  Content-Type=text/xml
    ${data}=  get file  C:/Users/Smart/Documents/Jayant/GIT/SampleAPItest/Testcases/Data.xml

    ${response}=  post request  mysession  /  data=  headers=${headers}
    log to console  ${response.status_code}