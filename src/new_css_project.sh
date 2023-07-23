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
vim "$program_name.css"

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Congratulations! You have Git, Vim editor, and your project folder set up. You can start writing your program in '$program_name.css'. All done!"
