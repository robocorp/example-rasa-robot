*** Settings ***
Library           RPA.Notifier
Library           RPA.Robocorp.WorkItems
Library           RPA.Robocorp.Vault

*** Tasks ***
Send To Email
    ${payload}=    Get Work Item Payload
    ${mailchimp}=    Get Secret    Mailchimp

    Notify Email
    ...   message=Hi!\n\nTime in ${payload}[body][entities][cityresult] is ${payload}[body][entities][timeresult].\n\nThanks and see you soon again!
    ...   to=${payload}[user]
    ...   username=test@robocorp.com
    ...   password=${mailchimp}[apikey]
    ...   host=smtp.mandrillapp.com
    ...   port=587
    ...   subject=Your time request has been processed
    ...   from=robot1@robocorp.com

    Release Input Work Item    DONE
