#!/bin/bash

echo "Starting a new node project"
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

echo "Installing Node.js..."
yum install -y nodejs
if [ $? -ne 0 ]; then
    echo "Error: Failed to install Node.js"
    exit 1
fi
echo "Node.js has been installed"
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
npx create-react-app "$program_name"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create React app"
    exit 1
fi

cd "$program_name"
npm start
if [ $? -ne 0 ]; then
    echo "Error: Failed to start the development server"
    exit 1
fi

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Congratulations! You have Git, Vim editor, Node.js, and your React project set up. You can start writing your program in the '$folder_name/$program_name' directory. Happy coding!"
