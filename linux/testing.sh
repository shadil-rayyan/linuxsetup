#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install Git
sudo apt install -y git

# Install Java (needed for many testing tools like SonarQube, Burp Suite, ZAP, etc.)
sudo apt install -y openjdk-11-jdk

# Install Docker (for some tools that run inside Docker containers)
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Install Docker Compose (needed for some tools to manage containers)
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install OWASP ZAP (Dynamic Application Security Testing)
sudo apt install -y owasp-zap

# Install Burp Suite (Community version)
wget https://portswigger.net/burp/releases/download?product=community&version=2022.8.2&type=Linux -O burpsuite_community_installer.sh
chmod +x burpsuite_community_installer.sh
./burpsuite_community_installer.sh

# Install Nikto (Web server scanner)
sudo apt install -y nikto

# Install SonarQube (for code quality and static analysis)
sudo useradd sonar -m
sudo mkdir /opt/sonarqube
cd /opt/sonarqube
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.0.1.46107.zip
sudo unzip sonarqube-9.0.1.46107.zip
sudo mv sonarqube-9.0.1.46107/* /opt/sonarqube
sudo chmod -R 777 /opt/sonarqube
sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start

# Install OWASP Dependency-Check (dependency vulnerability scanner)
sudo apt install -y default-jdk
wget https://github.com/jeremylong/DependencyCheck/releases/download/v6.2.2/dependency-check-6.2.2-release.zip
sudo unzip dependency-check-6.2.2-release.zip -d /opt/dependency-check
sudo ln -s /opt/dependency-check/dependency-check.sh /usr/local/bin/dependency-check

# Install Apache JMeter (for load/performance testing)
sudo apt install -y jmeter

# Install Wireshark (network packet analyzer)
sudo apt install -y wireshark

# Install Selenium (for automated browser testing)
sudo apt install -y python3-pip
pip3 install selenium

# Install Postman (API Testing)
# Download Postman tar.gz
cd /tmp
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xvzf postman.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman

# Install Gobuster (for directory and DNS busting)
sudo apt install -y gobuster

# Print completion message
echo "Installation of testing tools is complete."

echo "OWASP ZAP, Burp Suite, Nikto, SonarQube, Dependency-Check, JMeter, Wireshark, Selenium, Postman, and Gobuster have been installed."
echo "Some tools may require additional configuration or setup before use."

echo "To start SonarQube manually, use: sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start"
echo "To use Postman, run: postman"
echo "To use Burp Suite, run: burpsuite_community_installer.sh"
