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

# Check if C++ (GCC) is installed
if ! which g++ >/dev/null 2>&1; then
    echo "${sky}C++ compiler (GCC) is not installed. Installing gcc-c++... ${reset}"
      yum install -y gcc-c++
    if [ $? -ne 0 ]; then
        echo "${red}Error: Failed to installgcc-c++${reset}"
        exit 1
    fi
   echo "${green}C++ compiler (GCC) has been installed${reset}"
else
   echo "${green}C++ compiler (GCC) is already installed${reset}"
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
echo "${sky}Your Program location is ${reset}"
pwd 
vim "$program_name.cpp"
if [ $? -ne 0 ]; then
    echo "${red}Error: Failed to open Vim editor${reset}"
    exit 1
fi

 echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"
 echo "${green}Congratulations! You have Git, gcc, Vim editor, and your project folder set up. All done!${reset}"
