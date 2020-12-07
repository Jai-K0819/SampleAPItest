*** Settings ***
Library  JSONLibrary
Library  os
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_url} =  https://restcountries.eu

*** Test Cases ***
Get_countryInfo
    create session  getCountrySession  ${base_url}
    ${response} =    get request  getCountrySession  /rest/v2/alpha/IN

    ${json_Obj} =    to json  ${response.content}

    #single Data Validation
    ${country_Name}=    get value from json  ${json_Obj}  $.name
    log to console  ${country_Name[0]}
    should be equal  ${country_Name[0]}  India

    #Single Data validation in array
    ${border} =  get value from json  ${json_Obj}  $.borders[0]
    log to console  ${border[0]}
    should be equal  ${border[0]}  AFG

    #Multiple data validation in array
    ${borders} =    get value from json  ${json_obj}  $.borders
    log to console  ${borders[0]}
    # contain any of the mentioned data
    should contain any  ${borders[0]}  AFG  BGD BTN MMR CHN
    should not contain any  ${borders[0]}  AFG  BGD  BTN  MMR  CHN


    #http://jsonpath.com
         #
         #http://jsonpathfinder.com/
