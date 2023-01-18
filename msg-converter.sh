#!/bin/bash
clear

echo Welcome to the MSG File converter
echo
echo Please enter path of .msg file
read msg_path

# Install Python Dependencies
apt update && \
     apt install software-properties-common -y && \
     apt install python3 -y && apt-get install python3-pip -y && \
     apt install php-fpm -y

# Install Extract Message
pip install extract-msg

# Extract message
python3 -m extract_msg $msg_path --out ./converted-messages/ --prepared-html --use-filename --html 

