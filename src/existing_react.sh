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

echo "${sky}Enter the name of your project folder:${reset}"
read -p "Folder name: " folder_name
mkdir "$folder_name"
if [ $? -ne 0 ]; then
    echo "${red}Error: Failed to create folder '$folder_name'${reset}"
    exit 1
fi
echo "${yellow}Folder '$folder_name' has been created${reset}"
echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"

cd $folder_name

echo "${green}Let's clone your repository...${reset}"
read -p "Enter the URL for the repository: " url
read -p "Enter the branch to clone: " name

if [ "$name" = "main" -o "$name" = "MAIN" ]; then
  echo "${green}Cloning the main branch...${reset}"
    git clone "$url"
    if [ $? -ne 0 ]; then
          echo "${red}Error: Failed to clone the main branch${reset}"
        exit 1
    fi
else
    echo "${green}Cloning the branch: $name${reset}"
    git clone -b "$name" --single-branch "$url"
    if [ $? -ne 0 ]; then
         echo "${red}Error: Failed to clone the branch '$name'${reset}"
        exit 1
    fi
fi
 echo "${colour}--------------------------------------------------------------------------------------------------------------------------------------------${reset}"
echo "Project set-up successfully for react project !${reset}"
echo "${green}You have installed git, vim, react  :)${reset}"