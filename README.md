# RASA chatbot triggering a robot excecution

Chatbots and RPA robots are a great match creating great business outcomes together. RPA robots extend the capabilities of conversational user interface to be able to perform tasks with legacy systems that lack simple API connectivity.

## What you'll learn with this reference architecture

- Using Control Room API to trigger robots with a work item from chatbot conversations 
- Using Basic Selenium browser automation with Google.com
- Using Work Data Management to create work items between robot steps
- Using `RPA.HTTP` to call a webhook to return data to Rasa conversation

The reference architecture uses Rasa's default chat interfance channel, and takes you through creating chat intents, custom actions and setting up the communications between Rasa and Robocorp.

## Overview

The purpose is to demonstrate how to set up two-way integrations with chatbots. While this repo contains the Robot examples, please have a look at the [sister repo](https://github.com/robocorp/example-rasa-chatbot) for the Rasa configuration. Example consists of two robots: one that gets the current time from Google using browser automation, and one that sends the result back to Rasa chatbot conversation.

[![d2a3a3cec5494782980e5da33fa50630-with-play](https://user-images.githubusercontent.com/40179958/177135673-e96098c4-ee32-4466-853f-c6bfb4ba23c0.gif)](https://www.loom.com/share/d2a3a3cec5494782980e5da33fa50630)

## Configuration

In order to set the demo up, please create a robot with two steps in the [Control Room](https://cloud.robocorp.com/).

<img width="570" alt="Screenshot 2022-07-04 at 12 27 37" src="https://user-images.githubusercontent.com/40179958/177136536-d6a114e5-c50b-4b1d-ac2a-d7e439ea62ce.png">

Also notice that in order for the robot to be able to return results back to Rasa conversations, the robot needs to have access to the Rasa Callback Server. In the example we have set up the robots to run locally in the same environment as the chatbot server using [Robocorp Workforce Agent](https://robocorp.com/docs/control-room/configuring-workforce/overview).

The exact steps required to configure the process:

1. Have or create a Robocorp [Control Room](https://cloud.robocorp.com/) account.
2. Install [Workforce Agent](https://robocorp.com/docs/control-room/configuring-workforce/overview)
3. Connect Workforce Agent with Control Room to create an execution environment.
4. Create a robot from public git repository (this repo). _Note: if you are running the Rasa service somewhere else than `localhost:5005` you'll need to clone/fork the repository and make required changes._
5. Create a new Process under Workforce tab
6. Add Search Time as the first task, and choose the execution environment to be your newly linked local environment.
7. Add Send to RASA as the second task, and choose the execution environment to be your newly linked local environment.
8. Follow [instructions](https://github.com/robocorp/example-rasa-chatbot/blob/master/README.md) on Rasa example repo how to get the Rasa server running.

:heart: Have fun chatting!
