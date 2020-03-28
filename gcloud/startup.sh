#!/bin/bash

# Get deps
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y default-jdk build-essential libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev zlib1g zlib1g-dev git reptyr

# Install Stackdriver Logging Agent
curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
sudo bash install-logging-agent.sh

# Get, build, and install Python 3.7
curl https://pyenv.run | bash
$HOME/.pyenv/bin/pyenv install 3.7.7
sudo rm -rf /usr/bin/python3.7
sudo ln -s $HOME/.pyenv/versions/3.7.7/bin/python3 /usr/bin/python3.7

# Get Minecraft Python code
git clone https://github.com/martinkilonzo/transient-minecraft.git
cd transient-minecraft

# Get Python deps
python3.7 -m pip install poetry --user
python3.7 -m poetry install

# Run server in screen
screen -dm python3.7 -m poetry run server --cloud gcloud
