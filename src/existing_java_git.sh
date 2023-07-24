#!/bin/bash

echo "Setting up the project"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

# Function to check if a package is installed
check_package() {
    if which $1 >/dev/null 2>&1; then
        echo "$1 is already installed"
    else
        echo "Installing $1..."
          yum install -y $1
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
      yum install -y java-17-openjdk-devel
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
      yum install -y gradle
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
      yum install -y ant
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Ant"
        exit 1
    fi
    echo "Ant has been installed"
fiecho "Checking JDK 17..."
if type -p java; then
    echo "Java is installed"
    if [[ $(java -version 2>&1) == *"17"* ]]; then
        echo "Java version 17 is installed"
    else
        echo "Java version 17 is not installed, installing it now"
        yum install -y java-17-amazon-corretto-devel
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install Java version 17"
            exit 1
        fi
    fi
else
    echo "Java is not installed, installing Java version 17"
    yum install -y java-17-amazon-corretto-devel
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Java version 17"
        exit 1
    fi
    echo "Java has been installed successfully"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Do you want to install Ant or Gradle version-8 as a build tool? (Enter 'a' for Ant, 'g' for Gradle, or 'n' for no):"
read -p "Build tool: " build_tool

if [ "$build_tool" = "g" ]; then
    echo "Checking Gradle version 8 installation..."

    if type -p gradle >/dev/null 2>&1; then
        if [[ $(gradle --version | grep "Gradle 8.0") ]]; then
            echo "Gradle version 8.0 is installed"
        else
            echo "Gradle version 8.0 is not installed, installing it now"
            yum remove -y gradle
            yum install -y wget
            wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
            if [ $? -ne 0 ]; then
                echo "Error: Failed to download Gradle"
                exit 1
            fi
            yum install -y unzip
            unzip gradle-8.0-bin.zip -d /opt
            echo "Gradle 8.0 has been installed"
        fi
    else
        echo "Gradle is not installed, installing it now"
        yum install -y wget
        wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
        if [ $? -ne 0 ]; then
            echo "Error: Failed to download Gradle"
            exit 1
        fi
        yum install -y unzip
        unzip gradle-8.0-bin.zip -d /opt
        echo "Gradle 8.0 has been installed"
    fi
elif [ "$build_tool" = "a" ]; then
    echo "Installing Ant..."
    yum install -y ant
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Ant"
        exit 1
    fi
    echo "Ant has been installed"
else
    echo "No build tool will be installed"
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