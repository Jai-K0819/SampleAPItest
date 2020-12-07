*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url} =  https://ourtechsampleapi.herokuapp.com

*** Test Cases ***
TC_001 Create Login Token
    create session  mysession   ${base_url}
    ${body} =  create dictionary    password=Qwerty@123   username=test0810
    ${header} =  create dictionary  Content-Type=application/json
    ${response} =  post request     mysession   /auth/token/login/  data=${body}    headers=${header}

    log to console  ${body}
    log to console  ${response.status_code}
    log to console  ${response.content}

    #Validations
    ${status_code} =  convert to string  ${response.status_code}
    should contain  ${status_code}  200
    ${response_body}=  convert to string  ${response.content}
    should contain  ${response_body}  auth_token
    log to console  ${response_body}