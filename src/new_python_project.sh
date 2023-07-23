#!/bin/bash

echo "Starting a new project"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Installing Git..."
yum install -y git
if [ $? -ne 0 ]; then
    echo "Error: Failed to install Git"
    exit 1
fi
echo "Git has been installed"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Checking Python 3.x installation..."
if python3 --version >/dev/null 2>&1; then
    echo "Python 3.x is installed"
    python3 --version
else
    echo "Python 3.x is not installed"
    yum install -y python3
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Python 3.x"
        exit 1
    fi
    echo "Python 3.x has been installed"
    python3 --version
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Installing Vim editor..."
yum install -y vim
if [ $? -ne 0 ]; then
    echo "Error: Failed to install Vim editor"
    exit 1
fi
echo "Vim editor has been installed"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Enter the name of your folder:"
read -p "Folder name: " folder_name

mkdir "$folder_name"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create folder '$folder_name'"
    exit 1
fi
echo "Folder '$folder_name' has been created"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Enter the name of the program:"
read -p "Program name: " program_name

echo "Please start writing your program"
cd "$folder_name"
vim "$program_name.py"
if [ $? -ne 0 ]; then
    echo "Error: Failed to open Vim editor"
    exit 1
fi

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Congratulations! You have Git, Python 3.x, Vim editor, and your project folder set up. You can start writing your program in '$program_name.py'. All done!"
