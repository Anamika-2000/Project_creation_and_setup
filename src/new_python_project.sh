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

echo "Checking Python 3.x installation..."
if python3 --version >/dev/null 2>&1; then
    echo "${green}Python 3.x  is installed${reset}"
    python3 --version
else
    echo "${red}Python 3.x is not installed${reset}"
    yum install -y python3
    if [ $? -ne 0 ]; then
        echo "${red}Error: Failed to installPython 3.x${reset}"
        exit 1
    fi
    echo "${green}Python 3.x has been installed${reset}"
    python3 --version
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

echo "${yellow}Enter the name of the program:${reset}"
read -p "Program name: " program_name

echo "${colour}Please start writing your program${reset}"
cd "$folder_name"
echo "${sky} Your program is at location${reset}"
pwd 
vim "$program_name.py"
if [ $? -ne 0 ]; then
    echo "${red}Error: Failed to open Vim editor${reset}"
    exit 1
fi

 echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"
 echo "${green}Congratulations! You have Git, Python 3.x, Vim editor, and your project folder set up. All done!${reset}"