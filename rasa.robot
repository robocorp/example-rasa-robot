*** Settings ***
Library           RPA.HTTP
Library           RPA.Robocorp.WorkItems

*** Tasks ***
Send To RASA
    ${payload}=    Get Work Item Payload

    POST  url=http://localhost:5005/conversations/${payload}[user]/trigger_intent?output_channel=latest
    ...  json=${payload}[body]

    Release Input Work Item    DONE
