# Created by Mayur Dhangar at 26-11-2024
*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${URL}          https://landmark.taqtics.co
${BROWSER}      Chrome
${EMAIL}        intern@taqtics.co
${PASSWORD}     TestIntern@123
${SCREENSHOTS_DIR}      ./Screenshots

*** Test Cases ***
Validate Login
    [Documentation]     Test valid login scenario
    Input Email and Password     ${EMAIL}     ${PASSWORD}
    Click Login Button
    Verify Successful Login
    Capture Page Screenshot     Valid_Login.png
    Click Logout Button

Invalid Login - Incorrect Password
    [Documentation]     Test login with incorrect password
    Input Email and Password     ${EMAIL}     Password@123
    Click Login Button
    Verify Login Failed
    Capture Page Screenshot     Incorrect_Password_Login.png

Invalid Login - Blank Email
    [Documentation]     Test login with blank email
    Input Email and Password     ""      ${PASSWORD}
    Click Login Button
    Verify Login Failed
    Capture Page Screenshot     Blank_Email_Login.png

Invalid Login - Blank Password
    [Documentation]     Test login with blank password
    Input Email and Password     ${EMAIL}     ""
    Click Login Button
    Verify Login Failed
    Capture Page Screenshot     Blank_Password_Login.png

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//label[@for=("email")]   10s
    Set Screenshot Directory    ${SCREENSHOTS_DIR}

Input Email and Password
    [Arguments]     ${email}    ${password}
    Input Text      xpath=//input[@id=("email")]    ${email}
    Input Text      xpath=//input[@id=("password")]     ${password}

Click Login Button
    Click Button    xpath=//button[@type=("submit")]

Verify Successful Login
    Wait Until Page Contains Element    xpath=//div[contains(@class, "dashboard_container")]    10s

Verify Login Failed
    wait Until page Contains Element    xpath=//span[text()="Invalid Credentials!"]    10s

Click Logout Button
    Click Element    xpath=//span[@class='ant-dropdown-trigger']
    Wait Until Element Is Visible   xpath=//span[normalize-space()='Logout']
    Click Element    xpath=//span[normalize-space()='Logout']
