#!/bin/bash

echo "Starting a new node project"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installing Git..."
yum install -y git
echo "Git has been installed"

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installing Vim editor..."
yum install -y vim
echo "Vim editor has been installed"

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "installing nodejs"
yum install -y nodejs
echo "Nodejs has been installed"

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Enter the name of your folder:"
read -p "Folder name: " folder_name
mkdir "$folder_name"
echo "Folder '$folder_name' has been created"
echo "Enter the name of the program:"
read -p "Program name: " program_name
echo "Please start writing your program"
cd "$folder_name"
npx create-react-app "$program_name"
cd "$program_name"
npm start
