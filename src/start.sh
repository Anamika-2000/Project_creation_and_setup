#!/bin/bash
yum -y update
# Color codes for formatting
bold=$(tput bold)
underline=$(tput smul)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
purple=$(tput setaf 5)
reset=$(tput sgr0)
sky=$(tput setaf 6)


# Header
echo "${bold} ${yellow}Welcome to our project :)${reset}"
echo "You can install basic prerequisites for any project setup here."

# Options
echo "${underline} ${sky}Choose a project type to set up:${reset}"
echo "1. ${purple}Existing Java project (JDK-17)${reset}"
echo "2. ${green}New Java project (JDK-17)${reset}"
echo "3. ${purple}Existing Python project${reset}"
echo "4. ${green}New Python project${reset}"
echo "5. ${purple}Existing C project${reset}"
echo "6. ${green}New C project${reset}"
echo "7. ${purple}Existing C++ project${reset}"
echo "8. ${green}New C++ project${reset}"
echo "9. ${purple}Existing HTML project${reset}"
echo "10. ${green}New HTML project${reset}"
echo "11. ${purple}Existing Node.js project${reset}"
echo "12. ${green}New Node.js project${reset}"
echo "13. ${purple}Existing CSS+HTML project${reset}"
echo "14. ${green}New CSS+HTML project${reset}"
echo "15. ${purple}Existing React.js project${reset}"
echo "16. ${green}New React.js project${reset}"

# Separator
echo "${yellow}-----------------------------------------------------------------------${reset}"

# Read user input
read -p "Enter your choice: " input

# Execute the corresponding script based on user input
case $input in
    1)
        sh existing_java_git.sh
        ;;
    2)
        sh new_java_project.sh
        ;;
    3)
        sh existing_python.sh
        ;;
    4)
        sh new_python_project.sh
        ;;
    5)
        sh existing_c_project.sh
        ;;
    6)
        sh new_c_project.sh
        ;;
    7)
        sh existing_cpp_project.sh
        ;;
    8)
        sh new_cpp_project.sh
        ;;
    9)
        sh existing_html_project.sh
        ;;
    10)
        sh new_html_project.sh
        ;;
    11)
        sh existing_node_project.sh
        ;;
    12)
        sh new_node_project.sh
        ;;
    13)
        sh existing_css_project.sh
        ;;
    14)
        sh new_css_project.sh
        ;;
    15)
        sh existing_react.sh
        ;;
    16)
        sh new_js_react_project.sh
        ;;
    *)
        echo "${red}Invalid input!${reset} Please try again."
        exit 1
        ;;
esac
