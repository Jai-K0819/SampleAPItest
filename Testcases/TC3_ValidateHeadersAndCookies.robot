*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url} =  http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
    create session  testsession  ${base_url}
    ${response} =  get request  testsession  /photos

    log to console  ${response.headers}

    ${contentTypeValue} =  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json; charset=utf-8

    ${contentEncodeValue} =  get from dictionary  ${response.headers}  Content-Encoding
    should be equal  ${contentEncodeValue}  gzip

TestCookies
    create session  testsession  ${base_url}
    ${response} =  get request  testsession  /photos

    log to console  ${response.cookies}   # Displays all the cookies from response

    ${cookieValue} =  get from dictionary  ${response.cookies}  __cfduid
    log to console  ${cookieValue}   #Display specific cookie value