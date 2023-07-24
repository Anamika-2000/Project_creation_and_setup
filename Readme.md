# Project_creation_and_setup 

<p align="center">
This project provides a convenient script for setting up various types of projects by installing the necessary prerequisites. It provide the option to either start a new project or set-up an existing project by cloning it from  Git-Hub.

<p align="center">
    <a href="https://github.com/Anamika-2000/Project_creation_and_setup/blob/master/Readme.md"><strong>Explore the docs »</strong></a>
<br>
<br>
    <a href="https://github.com/Anamika-2000/Project_creation_and_setup">View Demo</a>
    ·
    <a href="https://github.com/Anamika-2000/Project_creation_and_setup/issues/new">Report Bug</a>
    ·
    <a href="https://github.com/Anamika-2000/Project_creation_and_setup/issues/new">Request Feature</a>

## Table of content
- [Usage](#usage)
- [Description ](#description)
- [Pre-Requisites](#pre-requisites)
- [Authorization](#authorization)
- [Setup](#setup)

<p align="right">
 <a href="#project_creation_and_setup ">Back to top</a>
</p>


## Usage

 The Project_creation_and_setup application can be used in a large organization to facilitate the creation and set-up of new or existing projects.
 
<p align="right">
<a href="#project_creation_and_setup ">Back to top</a>
</p>

## Description
The project consists of the following scripts that help to start a new or set-up an existing project.
<ol>
<li>start.sh: This is the main script that user has to run.
<li>existing_java_git.sh: Sets up an existing Java project with Git integration.
<li>new_java_project.sh: Sets up a new Java project with Git integration. It also provide option that weather the user want to make the project as ` Gradle ` or ` Ant ` project. 
<li>existing_python.sh: Sets up an existing Python project.
<li>new_python_project.sh: Sets up a new Python project.
<li>existing_c_project.sh: Sets up an existing C project.
<li>new_c_project.sh: Sets up a new C project.
<li>existing_cpp_project.sh: Sets up an existing C++ project.
<li>new_cpp_project.sh: Sets up a new C++ project.
<li>existing_html_project.sh: Sets up an existing HTML project.
<li>new_html_project.sh: Sets up a new HTML project.
<li>existing_js_project.sh: Sets up an existing Node.js JavaScript project.
<li>new_js_project.sh: Sets up a new Node.js JavaScript project.
<li>existing_css_project.sh: Sets up an existing CSS project.
<li>new_css_project.sh: Sets up a new CSS project.
<li>existing_react.sh: Sets up an existing React.js project.
<li>new_js_react_project.sh: Sets up a new React.js project.
</ol>
The user can select the required option after running `start.sh` script. The scripts for the selected option will automatically install the required depencies for the project and you are good to go.

### Programing Languages supported
* Java
* C
* C++
* Python
* HTML
* CSS
* React
* Node JS

<p align="right">
 <a href="#project_creation_and_setup ">Back to top</a>
</p>

## Pre-Requisites
Depending upon the project these are the script may requires the following prerequisites to be installed on your machine:

* VimEditor
* Git
* Gradle
* Ant
* Jdk 17
* Python 3.x
* Node.js
* React
* C
* C++

<p align="right">
 <a href="#project_creation_and_setup ">Back to top</a>
</p>

## Authorization

There is no specific authorization for now, but if it is used by an organization then the authorization for the  application will depend on the specific requirements and policies of the company or organization implementing it. Generally, the authorization can be granted to all the employess as this will make their work easy.

<p align="right">
 <a href="#project_creation_and_setup ">Back to top</a>
</p>

## Setup
   
### Local Deployment

1. Firstly clone the repository
```
git clone https://github.com/Anamika-2000/Project_creation_and_setup.git
```

2. Import on Amazonlinux system.
3. If you are using docker for running the project use command:
<ul><li>docker pull amazonlinux:2</li>
<li>docker run -ti amazonlinux:2</li>

### Getting Started
The individual project setup scripts are as follows:
1. You need to run the `start.sh` script on amazonlinux:2 system. The command for running the script is:  
`sh start.sh`   

2. Choose the type of project you want to set up by entering the corresponding number.

3. Follow the prompts and instructions provided by the script to complete the project setup.
<p align="right">
 <a href="#project_creation_and_setup ">Back to top</a>
</p>

## Running the program

### Java code
1. Go to directory containing main method.
2. Compile using the command `javac file_name.java`.
3. To run the code use command `java file_name`.

### Python code
1. Go to the directory containing the code.
2. To run the code use command `python3 file_name.py`.

### C Program
1. Go to the directory containing the code.
2. To compile the code use command `gcc -o file_name file_name.c` .
3. To run the code use command `./file_name`.

### C++ Program
1. Go to the directory containing the code.
2. To compile the code use command `g++ -o file_name file_name.c` .
3. To run the code use command `./file_name`.

### HTML
1. 

### React Project
1. Go to backend directory and use the command `npm i` for installing npm package.
2. Create a `.env` file in the backend directory.
3. Use command `npm start` to start the backend.
4. Go to frontend directory and use the command `npm i` for installing npm package.
5. Use command `npm start` to start the frontend.