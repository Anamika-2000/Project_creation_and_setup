#!/bin/bash
red=$(tput setaf 1)
green=$(tput setaf 2)
sky=$(tput setaf 6)
yellow=$(tput setaf 3)
colour=$(tput setaf 8)
reset=$(tput sgr0)
echo "${green}Setting up an existing project${reset}"
echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"

check_package() {
    if which $1 >/dev/null 2>&1; then
        echo "${yellow}$1 is already installed${reset}"
    else
        echo "${sky}Installing $1...${reset}"
        yum install -y $1
        if [ $? -ne 0 ]; then
            echo "${red}Error: Failed to install $1${reset}"
            exit 1
        fi
        echo "${green}$1 has been installed${reset}"
    fi
}

# Check and install Git
check_package "git"
echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"

# Check and install Vim editor
check_package "vim"
echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"

# Ask user for Java version to install
echo "${sky}Which Java version would you like to install? (Enter '8', '11', '17', or 'n' for no Java installation):${reset}"
read -p "Java version: " java_version

# Check and install java
if [ "$java_version${reset}" = "n" ]; then
    echo "${red}Java will not be installed${reset}"
else
    echo "${green}Checking JDK $java_version...${reset}"
    if type -p java; then
        echo "${green}Java is installed${reset}"
        if [[ $(java -version 2>&1) == *"$java_version${reset}"* ]]; then
            echo "${green}Java version $java_version is installed${reset}"
        else
            echo "${red}Java version $java_version is not installed, installing it now${reset}"
            yum install -y java-$java_version-amazon-corretto-devel
            if [ $? -ne 0 ]; then
                echo "${red}Error: Failed to installJava version $java_version${reset}"
                exit 1
            fi
        fi
    else
        echo "${red}Java is not installed, installing Java version $java_version${reset}"
        yum install -y java-$java_version-amazon-corretto-devel
        if [ $? -ne 0 ]; then
            echo "${red}Error: Failed to installJava version $java_version${reset}"
            exit 1
        fi
        echo "${green}Java has been installed successfully${reset}"
    fi
fi

echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"

echo "${red}Do you want to install Ant or Gradle version-8 as a build tool? (Enter 'a' for Ant, 'g' for Gradle, or 'n' for no):${reset}"
read -p "Build tool: " build_tool

if [ "$build_tool" = "g" ]; then
    echo "${yellow}Checking Gradle version 8 installation...${reset}"

    if type -p gradle >/dev/null 2>&1; then
        if [[ $(gradle --version | grep "Gradle 8.0") ]]; then
            echo "${green}Gradle version 8.0  is installed${reset}"
        else
            echo "${red}Gradle version 8.0 is not installed, installing it now${reset}"
            yum remove -y gradle
            yum install -y wget
            wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
            if [ $? -ne 0 ]; then
                echo "${red}Error: Failed to download Gradle${reset}"
                exit 1
            fi
            yum install -y unzip
            unzip gradle-8.0-bin.zip -d /opt
            echo "${green}Gradle 8.0 has been installed${reset}"
        fi
    else
        echo "$(red)Gradle is not installed, installing it now${reset}"
        yum install -y wget
        wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
        if [ $? -ne 0 ]; then
            echo "${red}Error: Failed to download Gradle${reset}"
            exit 1
        fi
        yum install -y unzip
        unzip gradle-8.0-bin.zip -d /opt
        echo "${green}Gradle 8.0 has been installed${reset}"
    fi
elif [ "$build_tool" = "a" ]; then
    echo "${green}Installing Ant...${reset}"
    if which ant >/dev/null 2>&1; then
    echo "${yellow}Ant is already installed${reset}"
else
    echo "${green}Installing Ant...${reset}"
      yum install -y ant
    if [ $? -ne 0 ]; then
        echo "${red}Error: Failed to installAnt${reset}"
        exit 1
    fi
    echo "${green}Ant has been installed${reset}"
fi
else
    echo "${yellow}No build tool will be installed${reset}"
fi
echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"
echo "${sky}Enter the name of your folder:${reset}"
read -p "Folder name: " folder_name

mkdir "$folder_name"
if [ $? -ne 0 ]; then
    echo "${red}Error: Failed to create folder '$folder_name'${reset}"
    exit 1
fi
echo "${yellow}Folder '$folder_name' has been created${reset}"
echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"

echo "${yellow}Enter the name of the Java program:${reset}"
read -p "Program name: " program_name

echo "${sky}Please start writing your Java program${reset}"
cd "$folder_name"
echo "${red}Your program is located at${reset}"
pwd
vim "$program_name.java"
if [ $? -ne 0 ]; then
    echo "${red}Error: Failed to open Vim editor${reset}"
    exit 1
fi

 echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"
 echo "${green}Congratulations! You have Git, JDK , Vim editor, Gradle and ant (if you opted)  and your project folder set up. All done!${reset}"