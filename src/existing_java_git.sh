#!/bin/bash

echo "Setting up the project"
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

# Check and install JDK 17
if java -version 2>&1 | grep -q "17\."; then
    echo "JDK 17 is already installed"
else
    echo "Installing JDK 17..."
    sudo yum install -y java-17-openjdk-devel
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install JDK 17"
        exit 1
    fi
    echo "JDK 17 has been installed"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Check and install Gradle
if which gradle >/dev/null 2>&1; then
    echo "Gradle is already installed"
else
    echo "Installing Gradle..."
    sudo yum install -y gradle
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Gradle"
        exit 1
    fi
    echo "Gradle has been installed"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Check and install Ant
if which ant >/dev/null 2>&1; then
    echo "Ant is already installed"
else
    echo "Installing Ant..."
    sudo yum install -y ant
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Ant"
        exit 1
    fi
    echo "Ant has been installed"
fi
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

# cloning

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
echo "Project set-up for java project successfully!"
echo "You have installed git, vim, jdk :)"