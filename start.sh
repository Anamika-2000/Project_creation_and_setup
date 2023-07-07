#!/bin/bash
echo "Welcome to our project! You can install basic prerequisites for any project setup here."
echo "Enter 1 to set up an existing Java project (JDK-17 )."
echo "Enter 2 to set up a new Java project (JDK-17 )."
echo "Enter 3 to set up an existing Python project."
echo "Enter 4 to set up a new Python project."
echo "Enter 5 to set up an existing C project."
echo "Enter 6 to set up a new C project."
echo "Enter 7 to set up an existing C++ project."
echo "Enter 8 to set up a new C++ project."
echo "Enter 9 to set up an existing HTML project."
echo "Enter 10 to set up a new HTML project."
echo "Enter 11 to set up an existing node JavaScript project."
echo "Enter 12 to set up a new node JavaScript project."
echo "Enter 13 to set up an existing CSS project."
echo "Enter 14 to set up a new CSS project."
echo "Enter 15 to set up an existing react js project."
echo "Enter 16 to set up a new react js project."
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------"

read -p "Enter your choice: " input

if [ "$input" == 1 ]; then
    sh existing_java_git.sh
elif [ "$input" == 2 ]; then
    sh new_java_project.sh
elif [ "$input" == 3 ]; then
   sh existing_python.sh
elif [ "$input" == 4 ]; then
    sh new_python_project.sh
elif [ "$input" == 5 ]; then
    sh existing_c_project.sh
elif [ "$input" == 6 ]; then
    sh new_c_project.sh
elif [ "$input" == 7 ]; then
    sh existing_cpp_project.sh
elif [ "$input" == 8 ]; then
    sh new_cpp_project.sh
elif [ "$input" == 9 ]; then
    sh existing_html_project.sh
elif [ "$input" == 10 ]; then
    sh new_html_project.sh
elif [ "$input" == 11 ]; then
    sh existing_js_project.sh
elif [ "$input" == 12 ]; then
    sh new_js_project.sh
elif [ "$input" == 13 ]; then
    sh existing_css_project.sh
elif [ "$input" == 14 ]; then
    sh new_css_project.sh
elif [ "$input" == 15 ]; then
    sh existing_react.sh
elif [ "$input" == 16 ]; then
    sh new_js_react_project.sh
else
    echo "Invalid input! Please try again."
fi