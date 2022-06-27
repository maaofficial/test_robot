*** Settings ***
Documentation       Template robot main suite.

Library             Collections
Library             MyLibrary
Library             RPA.Browser.Selenium
Library             RPA.Excel.Files
Resource            keywords.robot
Variables           MyVariables.py


*** Keywords ***
Read Excel
    Open Workbook       /home/maaofficial/Documents/test_escape_list.xlsx
    ${list}     Read Worksheet      header=true
    Log To Console      ${list}
    Close Workbook
    FOR         ${index}    IN      @{list}
        Search Car      ${index}
    END

Search Car
    [Arguments]         ${index}
    Go To   %{C_URL}
    Maximize Browser Window
    Wait Until Element Is Visible       xpath:/html/body/div[1]/div/main/div[1]/div[1]/div[1]/div/div[1]/form/div[1]/div[1]/div/div/div/div/div[1]/div[2]
    Click Element                       xpath:/html/body/div[1]/div/main/div[1]/div[1]/div[1]/div/div[1]/form/div[1]/div[1]/div/div/div/div/div[1]/div[2]
    Press Keys      NONE    ${index}[make]
    Sleep   333ms
    Press Keys      NONE    TAB
    Click Element                       xpath:/html/body/div[1]/div/main/div[1]/div[1]/div[1]/div/div[1]/form/div[1]/div[2]/div/div
    Sleep   500ms
    Press Keys      NONE    ${index}[model]
    Sleep   333ms
    Press Keys      NONE    TAB
    Click Element                       xpath:/html/body/div[1]/div/main/div[1]/div[1]/div[1]/div/div[1]/form/div[1]/div[3]/div/div/input
    Sleep   500ms
    Press Keys      NONE    ${index}[max_km]
    Sleep   500ms
    # Click Minimize Button
    Click Element                        xpath:/html/body/div[1]/div/main/div[1]/div[1]/div[1]/div/div[1]/form/div[1]/div[3]/div/div/div[1]
    Sleep  333ms
    # Click Button Search
    Click Element                         xpath:/html/body/div[1]/div/main/div[1]/div[1]/div[1]/div/div[1]/form/div[2]/div[1]/button
    # Click Sort by Button
    Wait Until Element Is Visible         xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[1]/div[2]/div[1]/div[2]/div/div    10s
    Sleep   3s
    Click Element                       xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[1]/div[2]/div[1]/div[2]/div/div
    Sleep   3s
    # Click Lowest Price
    Click Element                       xpath:/html/body/div[8]/div/div/div/div[2]/div/div[6]/p
    Sleep   5s

*** Tasks ***
Main
    Open Available Browser
    Read Excel
