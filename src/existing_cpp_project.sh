#!/bin/bash
# for c++ project
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

echo "Installing gcc..."
yum install -y gcc-c++
if [ $? -ne 0 ]; then
    echo "Error: Failed to install gcc"
    exit 1
fi
echo "gcc has been installed"
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
cd $folder_name
echo "Let's clone your repository..."
read -p "Enter the URL for the repository: " url
read -p "Enter the branch to clone: " name

if [ "$name" = "main" -o "$name" = "MAIN" ]; then
    echo "Cloning the main branch..."
    git clone "$url"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to clone the main branch"
        exit 1
    fi
else
    echo "Cloning the branch: $name"
    git clone -b "$name" --single-branch "$url"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to clone the branch '$name'"
        exit 1
    fi
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Project set-up sucessfully!"
