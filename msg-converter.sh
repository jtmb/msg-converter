#!/bin/bash
clear

echo Welcome to the MSG File converter
echo
echo Please enter path of .msg file
read msg_path

ostype=`uname -a | cut -f2`

# Install Python Dependencies Linux
if [[ $ostype == *"Linux"* ]]; then
apt update && \
     apt install software-properties-common -y && \
     apt install python3 -y && apt-get install python3-pip -y && \
     apt install php-fpm -y
fi
# Install Python Dependencies MAC
if [[ $ostype == *"Darwin"* ]]; then
    brew install python3
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
fi

# Install Extract Message
pip install extract-msg

# Extract message
python3 -m extract_msg $msg_path --out ./converted-messages/ --prepared-html --use-filename --html 

# Create Var based off file name 
msg_name=`echo $msg_path | rev | cut -d '/' -f1 | rev | cut -d '.' -f1`

# Open file
open ./converted-messages/$msg_name/message.html