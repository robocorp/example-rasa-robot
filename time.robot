*** Settings ***
Library           RPA.Browser.Selenium
Library           RPA.Robocorp.WorkItems

*** Variables ***
${GOOGLE_URL}     https://google.com/?hl=en

*** Keywords ***
Reject Google Cookies
    Click Element If Visible    xpath://button/div[contains(text(), 'Reject all')]

Accept Google Consent
    Click Element If Visible    xpath://button/div[contains(text(), 'I agree')]

Close Google Sign in if shown
    Click Element If Visible    No thanks

*** Keywords ***
Open Google search page
    Open Available Browser    ${GOOGLE_URL}
    Close Google Sign in if shown
    Run Keyword And Ignore Error    Reject Google Cookies
    Run Keyword And Ignore Error    Accept Google Consent

Search for
    [Arguments]    ${city}
    Input Text    name:q    what is the time in ${city}
    Press Keys    name:q    ENTER
    Wait Until Page Contains Element    search

*** Tasks ***
Search Time
    ${payload}=  Get Work Item Payload
    TRY
        Open Google search page
        Search for  ${payload}[city]

        ${time}=  Get Text  //div[@role='heading' and @aria-level]
        ${variables}=  Evaluate  {"user": $payload["user"] ,"body": {"name": "EXTERNAL_time_result", "entities": {"timeresult": $time, "cityresult": $payload["city"]}}}

    EXCEPT
        Log To Console    Exception caught in bot run.
        ${variables}=  Evaluate  {"user": $payload["user"] ,"body": {"name": "EXTERNAL_time_error", "entities": {"errortext": "Bot execution failed for unknown reason.", "cityresult": $payload["city"]}}}

    END

    Create Output Work Item  variables=${variables}    save=True
    Release Input Work Item  DONE
    [Teardown]  Close Browser
