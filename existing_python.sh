#!/bin/bash
echo "setting the project from your repository"
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

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "lets clone your repo ............................."
echo "Enter the url for repository"
read -p url
echo "Enter the branch to clone"
read -p NAME
if [ "$NAME" = "main" -o "$NAME" = "MAIN" ]; then
    echo "Cloning the main branch.."
    git clone $url
else
    echo "Cloning the branch :  $NAME "
    git clone -b $NAME --single-branch $url
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"