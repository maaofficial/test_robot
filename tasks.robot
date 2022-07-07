*** Settings ***
Documentation       Template robot main suite.

Library             Collections
Library             MyLibrary
Library             RPA.Browser.Selenium
Library             RPA.Excel.Files
Resource            keywords.robot
Variables           MyVariables.py

*** Keywords ***
Create Excel Report
    Create Workbook     /home/maaofficial/Documents/test_report_2.xlsx
    Save Workbook

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
    Wait Until Element Is Visible         xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[1]/div[2]/div[1]/div[2]/div/div    20s
    Sleep   3s
    Click Element                       xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[1]/div[2]/div[1]/div[2]/div/div
    Sleep   3s
    # Click Lowest Price
    Click Element                       xpath:/html/body/div[8]/div/div/div/div[2]/div/div[6]/p
    Sleep   3s

    # Get Text Element
    ${name}                 Get Text                xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[2]/div[1]/div/a/div/div[2]/h6
    Sleep   2s
    ${total_km}             Get Text                xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[2]/div[1]/div/a/div/div[2]/div[1]/div[1]/span[2]
    Sleep   2s
    ${seller}               Get Text                xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[2]/div[1]/div/a/div/div[2]/div[3]/div[1]/div/div[1]/div/div/span[2]
    Sleep   2s
    ${country}              Get Text                xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[2]/div[1]/div/a/div/div[2]/div[3]/div[1]/div/div[2]/span
    Sleep   2s
    ${fuel}                 Get Text                xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[2]/div[1]/div/a/div/div[2]/div[1]/div[5]/span[2]
    Sleep   2s
    ${transmission}         Get Text                xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[2]/div[1]/div/a/div/div[2]/div[1]/div[4]/span[2]
    Sleep   2s
    ${price}                Get Text                xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[2]/div[1]/div/a/div/div[2]/div[3]/div[2]/div/div[2]/div[2]/div/div[1]
    Sleep   2s
    
    ${car_dict}     Create Dictionary
    ...         name=${name}
    ...         total_km=${total_km}
    ...         seller=${seller}
    ...         country=${country}
    ...         fuel=${fuel}
    ...         transmission=${transmission}
    ...         price=${price}
    Log To Console      ${car_dict}

    Append To Excel  ${car_dict}


Append To Excel
    [Arguments]                 ${car_dict}
    Open Workbook               /home/maaofficial/Documents/test_report_2.xlsx
    Append Rows To Worksheet    ${car_dict}     header=True
    Save Workbook


*** Tasks ***
Main
    Create Excel Report
    Open Available Browser
    Read Excel
    Close Browser
