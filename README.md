# Example to robot that works with RASA chatbot

This example consists of two robots: one that gets the current time from Google using browser automation, and one that sends the result back to Rasa chatbot conversation.

The purpose is to demonstrate how to set up two-way integrations with chatbots. While this repo contains the Robot examples, please have a look at the [sister repo](https://github.com/robocorp/example-rasa-chatbot) for the Rasa configuration.

## Quick demo video

[![d2a3a3cec5494782980e5da33fa50630-with-play](https://user-images.githubusercontent.com/40179958/177135673-e96098c4-ee32-4466-853f-c6bfb4ba23c0.gif)](https://www.loom.com/share/d2a3a3cec5494782980e5da33fa50630)

## Configuration

In order to set the demo up, please create a robot with two steps in the [Control Room](https://cloud.robocorp.com/).

<img width="570" alt="Screenshot 2022-07-04 at 12 27 37" src="https://user-images.githubusercontent.com/40179958/177136536-d6a114e5-c50b-4b1d-ac2a-d7e439ea62ce.png">

Also notice that in order for the robot to be able to return results back to Rasa conversations, the robot needs to have access to the Rasa Callback Server. In the example we have set up the robots to run locally in the same environment as the chatbot server using [Robocorp Workforce Agent](https://robocorp.com/docs/control-room/configuring-workforce/overview).

The steps required to configure the robot up:

1. Have or create a Robocorp [Control Room](https://cloud.robocorp.com/) account.
2. Install [Workforce Agent](https://robocorp.com/docs/control-room/configuring-workforce/overview)
3. Connect Workforce Agent with Control Room to create an execution environment.
4. Create a robot from public git repository (this repo). Note: if you are running the Rasa service somewhere else than localhost
5. 
