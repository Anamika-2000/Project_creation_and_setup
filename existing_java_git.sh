#!/bin/bash

echo "Setting up the project from your repository"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Checking Git..."
yum install -y git
if [ $? -ne 0 ]; then
    echo "Error: Failed to install Git"
    exit 1
fi
echo "Git has been installed"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

echo "Checking JDK 17..."
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

echo "Checking Gradle version 8..."
if type -p gradle >/dev/null 2>&1; then
    if [[ $(gradle --version | grep "Gradle 8.0") ]]; then
        echo "Gradle version 8.0 is installed"
    else
        echo "Gradle version 8.0 is not installed, installing it now"
        yum remove -y gradle
        yum install -y wget
        wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
        yum install -y unzip
        unzip gradle-8.0-bin.zip -d /opt
        echo "Gradle has been installed successfully"
    fi
else
    echo "Gradle is not installed, installing Gradle version 8.0"
    yum install -y wget
    wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
    yum install -y unzip
    unzip gradle-8.0-bin.zip -d /opt
    echo "Gradle has been installed successfully"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"

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

echo "Setting up environment variables..."
export PATH=$PATH:/opt/gradle-8.0/bin
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
echo "Environment variables have been set"
echo "----------------------------------------------------------------------------------------------------------------------------------------------"

echo "Congratulations! You now have Git, JDK 17, Gradle 8, and your repository cloned. All done!"
