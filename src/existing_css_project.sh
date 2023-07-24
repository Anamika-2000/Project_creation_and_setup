#!/bin/bash
# existing css project
echo "Starting an existing project"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Checking git

if ! which git >/dev/null 2>&1; then
    echo "Git is not installed. Installing Git..."
    sudo yum install -y git
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Git"
        exit 1
    fi
    echo "Git has been installed"
else
    echo "Git is already installed"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Checking vim

if ! which vim >/dev/null 2>&1; then
    echo "Vim editor is not installed. Installing Vim..."
    sudo yum install -y vim
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Vim editor"
        exit 1
    fi
    echo "Vim editor has been installed"
else
    echo "Vim editor is already installed"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Creating folder

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
echo "Project set-up for HTML+CSS project successfully!"
echo "You have installed git, vim :)"