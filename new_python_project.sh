#!/bin/bash

echo "Starting a new project"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installing Git..."
yum install -y git
echo "Git has been installed"

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Checking Python 3.x installation..."
if python3 --version >/dev/null 2>&1; then
    echo "Python 3.x is installed"
    python3 --version
else
    echo "Python 3.x is not installed"
    yum install -y python3
    echo "Python 3.x has been installed"
    python3 --version
fi

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installing Vim editor..."
yum install -y vim
echo "Vim editor has been installed"

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Enter the name of your folder:"
read -p "Folder name: " folder_name
mkdir "$folder_name"
echo "Folder '$folder_name' has been created"

echo "Enter the name of the program:"
read -p "Program name: " program_name
echo "Please start writing your program"
cd "$folder_name"
vim "$program_name".py
