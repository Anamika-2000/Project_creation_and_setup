#!/bin/bash

echo "Setting up the React project"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Function to check if a package is installed
check_package() {
    if which $1 >/dev/null 2>&1; then
        echo "$1 is already installed"
    else
        echo "Installing $1..."
        sudo yum install -y $1
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install $1"
            exit 1
        fi
        echo "$1 has been installed"
    fi
}

# Check and install Git
check_package "git"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Check and install Vim editor
check_package "vim"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Check and install Node.js
if which node >/dev/null 2>&1; then
    echo "Node.js is already installed"
else
    echo "Installing Node.js..."
    sudo yum install -y gcc-c++ make
    curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
    sudo yum install -y nodejs
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Node.js"
        exit 1
    fi
    echo "Node.js has been installed"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Enter the name of your React project folder:"
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
echo "Project set-up successfully for react project !"
echo "You have installed git, vim, Python 3 :)"