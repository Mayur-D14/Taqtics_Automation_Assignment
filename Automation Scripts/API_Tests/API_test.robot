*** Settings ***
Library     RequestsLibrary
Suite Setup     Create Session  APISession  ${BASE_URL}  verify=true

*** Variables ***
${BASE_URL}             https://landmark.taqtics.co
${API_ENDPOINT}         /v1/external/generateAuthToken
&{HEADERS}              Content-Type=application/json   accept=application/json
&{USER_CREDENTIALS}     email=intern@taqtics.co   password=TestIntern@123

*** Test Cases ***
Generate Auth Token - Admin User
    [Documentation]     Verify the token generation endpoint with non-admin user.
    ${response}=  POST On Session   APISession   ${API_ENDPOINT}    json=${USER_CREDENTIALS}   headers=${HEADERS}   expected_status=anything
    Should Be Equal As Strings      200     ${response.status_code}
    Should Contain      ${response.text}    "token"

Generate Auth Token - Invalid Password
    [Documentation]     Verify the token generation endpoint with invalid credentials.
    ${invalid_credentials}    Create Dictionary    email=intern@taqtics.co    password=WrongPassword123
    ${response}=  POST On Session   APISession   ${API_ENDPOINT}    json=${invalid_credentials}    headers=${HEADERS}   expected_status=anything
    Should Be Equal As Strings      401     ${response.status_code}
    Should Contain      ${response.text}    "Invalid Credentials!"

Generate Auth Token - Empty Fields
    [Documentation]     Verify the token generation endpoint with empty fields
    ${empty_credentials}        Create Dictionary   username=   password=
    ${response}=  POST On Session   APISession   ${API_ENDPOINT}    json=${empty_credentials}    headers=${HEADERS}   expected_status=anything
    Should Be Equal As Strings     400     ${response.status_code}
    Should Contain      ${response.text}    "\\"Email\\" is required"
