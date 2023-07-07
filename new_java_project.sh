#!/bin/bash
echo "starting a new project"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "installing git ............................."
yum install -y git

echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "Checking JDK 17 installation..."
if type -p java >/dev/null 2>&1; then
    echo "Java is installed"

    if [[ $(java -version 2>&1) == *"17"* ]]; then
        echo "Java version 17 is installed"
    else
        echo "Java version 17 is not installed"
        yum install -y java-17-amazon-corretto-devel
        echo "Java 17 has been installed"
    fi
else
    echo "Java is not installed"
    yum install -y java-17-amazon-corretto-devel
    echo "Java has been installed"
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
            yum install -y unzip
            unzip gradle-8.0-bin.zip -d /opt
            echo "Gradle 8.0 has been installed"

        fi
    else
        echo "Gradle is not installed, installing it now"
        yum install -y wget
        wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
        yum install -y unzip
        unzip gradle-8.0-bin.zip -d /opt
        echo "Gradle 8.0 has been installed"
    fi
elif [ "$build_tool" = "a" ]; then
    echo "Installing Ant..."
    yum install -y ant
    echo "Ant has been installed"
else
    echo "No build tool will be installed"
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
echo "Enter the name of the Java program:"
read -p "Program name: " program_name
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
cd "$folder_name"
echo "setting path ............................."
 export PATH=$PATH:/tmp/gradle-8.0/bin
 export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
 echo "--------------------------------------------------------------------------------------------------------------------------------------------"
gradle init
echo "Please start writing your Java program"
vim "$program_name.java"