#!/bin/bash

echo "Setting up an existing the project"
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

# Ask user for Java version to install
echo "Which Java version would you like to install? (Enter '8', '11', '17', or 'n' for no Java installation):"
read -p "Java version: " java_version

# Check and install java
if [ "$java_version" = "n" ]; then
    echo "Java will not be installed"
else
    echo "Checking JDK $java_version..."
    if type -p java; then
        echo "Java is installed"
        if [[ $(java -version 2>&1) == *"$java_version"* ]]; then
            echo "Java version $java_version is installed"
        else
            echo "Java version $java_version is not installed, installing it now"
            yum install -y java-$java_version-amazon-corretto-devel
            if [ $? -ne 0 ]; then
                echo "Error: Failed to install Java version $java_version"
                exit 1
            fi
        fi
    else
        echo "Java is not installed, installing Java version $java_version"
        yum install -y java-$java_version-amazon-corretto-devel
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install Java version $java_version"
            exit 1
        fi
        echo "Java has been installed successfully"
    fi
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
fi
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