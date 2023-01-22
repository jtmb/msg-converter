#!/bin/bash
clear

echo Welcome to the MSG File converter
echo
echo Please enter path of .msg file or drag and drop .msg file into this window.
read msg_path

# Create OS type VAR (linux or mac)
ostype=`uname -a | cut -f2`

# Install Python Dependencies Linux
if [[ $ostype == *"Linux"* ]]; then
   sudo apt update && \
     sudo apt install python3 -y && sudo apt-get install python3-pip -y
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

# Open file Linux WSL
if [[ $ostype == *"Linux"* ]]; then
    wslview ./converted-messages/$msg_name/message.html
fi

# Open file MAC
if [[ $ostype == *"Darwin"* ]]; then
    open ./converted-messages/$msg_name/message.html
fi

# Cleanup
rm ./get-pip.py

# Set Echo message
RED='\033[0;31m'
NC='\033[0m' # No Color

echo
echo
echo -e "/////////////////////////////////////////////////////////////////////////////"
echo -e "// Your file is located here: $RED./converted-messages/$msg_name/message.html $NC     //" 
echo -e "///////////////////////////////////////////////////////////////////////////"
echo
echo
echo "Script Complete."
