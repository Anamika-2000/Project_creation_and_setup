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

# Check and install Node.js
if which node >/dev/null 2>&1; then
    echo "${yellow}Node.js is already installed${reset}"
else
    echo "${sky}Installing Node.js...${reset}"
      yum install -y gcc-c++ make
    curl -sL https://rpm.nodesource.com/setup_14.x |   bash -
      yum install -y nodejs
    if [ $? -ne 0 ]; then
        echo "${red}Error: Failed to installNode.js${reset}"
        exit 1
    fi
     echo "${green}Node.js has been installed${reset}"
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
echo "Your program is at location"
pwd
npx create-react-app "$program_name"
if [ $? -ne 0 ]; then
    echo "${red}Error: Failed to create React app${reset}"
    exit 1
fi

cd "$program_name"
npm start
if [ $? -ne 0 ]; then
    echo "${red}Error: Failed to start the development server${reset}"
    exit 1
fi

echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"
echo "${green}Congratulations! You have Git, Vim editor, Node.js, and your React project set up. Happy coding!${reset}"