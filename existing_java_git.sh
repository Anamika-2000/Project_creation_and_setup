#!/bin/bash
echo "setting the project from your repository"
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "checking git ............................."
yum install -y git
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "checking jdk 17 ............................."
if type -p java; then
    echo "Java is installed"
    if [[ $(java -version 2>&1) == *"17"* ]]; then
        echo "Java version 17 is installed"
    else
        echo "Java version 17 is not installed"
         yum install -y java-17-amazon-corretto-devel
    fi
else
    echo "Java is not installed"
     yum install -y java-17-amazon-corretto-devel

    echo "java is installed Successfully"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "checking gradle version 8 ............................."
if type -p gradle >/dev/null 2>&1; then
    if [[ $(gradle --version | grep "Gradle 8.0") ]]; then
        echo "Gradle version 8.0 is installed"
    else
        echo "Gradle version 8.0 is not installed, installing it now"
        yum remove gradle
        yum install -y wget
        wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
        yum install -y unzip
        unzip gradle-8.0-bin.zip -d /tmp
        echo gradle file unziped 
    fi
else
    echo "Gradle is not installed, installing it now"
    yum install -y wget
    wget https://services.gradle.org/distributions/gradle-8.0-bin.zip
    yum install -y unzip
    unzip gradle-8.0-bin.zip -d /tmp
    echo gradle file unziped
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "lets clone your repo ............................."
echo "Enter the url for repository"
read -p url
echo "Enter the branch to clone"
read -p NAME
if [ "$NAME" = "main" -o "$NAME" = "MAIN" ]; then
    echo "Cloning the main branch.."
    git clone $url
else
    echo "Cloning the branch :  $NAME "
    git clone -b $NAME --single-branch $url
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------------"
echo "setting path ............................."
 export PATH=$PATH:/tmp/gradle-8.0/bin
 export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
echo "Congratulations now you have git, jdk-17 ,gradle-8 and your repository cloned all done !"