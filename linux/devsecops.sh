#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install Git
sudo apt install -y git

# Install Docker (needed for Aqua Security, etc.)
# Install dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Kubernetes (kubectl)
sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install SonarQube
sudo apt install -y openjdk-11-jdk
sudo useradd sonar -m
sudo mkdir /opt/sonarqube
cd /opt/sonarqube
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.0.1.46107.zip
sudo unzip sonarqube-9.0.1.46107.zip
sudo mv sonarqube-9.0.1.46107/* /opt/sonarqube
sudo chmod -R 777 /opt/sonarqube
sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start

# Install OWASP ZAP
sudo apt install -y default-jdk
sudo apt install -y owasp-zap

# Install Acunetix (Free trial version)
# Acunetix requires signing up for the free trial on their website, hence we'll just download and install it after you sign up:
echo "To install Acunetix, please visit https://www.acunetix.com/ and download the free trial version for Linux."

# Install Burp Suite (Free version)
# Burp Suite Free version can be downloaded from the website.
# Download the Burp Suite installer using the below command:
wget https://portswigger.net/burp/releases/download?product=community&version=2022.8.2&type=Linux -O burpsuite_community_installer.sh
chmod +x burpsuite_community_installer.sh
./burpsuite_community_installer.sh

# Install OWASP Dependency-Check
sudo apt install -y default-jdk
wget https://github.com/jeremylong/DependencyCheck/releases/download/v6.2.2/dependency-check-6.2.2-release.zip
sudo unzip dependency-check-6.2.2-release.zip -d /opt/dependency-check
sudo ln -s /opt/dependency-check/dependency-check.sh /usr/local/bin/dependency-check

# Install Aqua Security (for container security)
# Install Aqua Security from Docker Hub
sudo docker pull aquasec/trivy

# Install Contrast Security (Free version)
# Contrast Security can be installed using Docker as well. First, pull the Docker image:
sudo docker pull contrastsecurity/contrast-agent

# Install AppDynamics (Free trial version)
# You can download AppDynamics by visiting their website.
echo "To install AppDynamics, please visit https://www.appdynamics.com/ and download the free trial version."

# Install Imperva RASP (Free trial version)
# Imperva provides a free trial for RASP, which needs to be downloaded from their website:
echo "To install Imperva RASP, please visit https://www.imperva.com/products/rasp/ and download the free trial version."

# Install Nessus (Free version)
# Download Nessus for Linux from their official website:
echo "To install Nessus, please visit https://www.tenable.com/products/nessus/nessus-free and download the free version."

# Install Splunk (Free version)
cd /tmp
curl -O https://download.splunk.com/products/splunk/releases/8.2.4/linux/splunk-8.2.4-87e8c2d98a56-linux-2.6-x86_64.rpm
sudo rpm -i splunk-8.2.4-87e8c2d98a56-linux-2.6-x86_64.rpm
sudo /opt/splunk/bin/splunk start --accept-license

# Install ELK Stack (Elasticsearch, Logstash, Kibana)
# Install dependencies
sudo apt install -y openjdk-11-jdk apt-transport-https curl

# Install Elasticsearch
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
sudo apt update
sudo apt install -y elasticsearch

# Enable Elasticsearch to start automatically
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

# Install Logstash
sudo apt install -y logstash

# Enable Logstash to start automatically
sudo systemctl enable logstash
sudo systemctl start logstash

# Install Kibana
sudo apt install -y kibana

# Enable Kibana to start automatically
sudo systemctl enable kibana
sudo systemctl start kibana

# Install Datadog (for cloud security monitoring)
# To install Datadog, you need to sign up for a free trial account.
echo "To install Datadog, please visit https://www.datadoghq.com/ and sign up for the free trial version."

# Install Prometheus (monitoring)
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

# Download Prometheus binary and configure
cd /tmp
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.30.3/prometheus-2.30.3.linux-amd64.tar.gz
tar xvf prometheus-2.30.3.linux-amd64.tar.gz
sudo mv prometheus-2.30.3.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-2.30.3.linux-amd64/promtool /usr/local/bin/
sudo mkdir /etc/prometheus
sudo mv prometheus-2.30.3.linux-amd64/consoles /etc/prometheus
sudo mv prometheus-2.30.3.linux-amd64/console_libraries /etc/prometheus
rm -rf prometheus-2.30.3.linux-amd64*

# Install Grafana (for visualization)
sudo apt install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update
sudo apt install -y grafana

# Install Wireshark (network analyzer)
sudo apt install -y wireshark

# Print completion message
echo "Installation complete. You need to manually configure some tools (e.g., Acunetix, AppDynamics, Datadog)."

echo "Jenkins and SonarQube are installed but not started automatically. Use the following commands to start them:"
echo "Jenkins: sudo systemctl start jenkins"
echo "SonarQube: sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start"

echo "Other tools like Aqua Security, Contrast Security, AppDynamics, Imperva RASP, Nessus, and Datadog require you to follow the respective setup steps provided in their official documentation."

echo "All tools have been installed successfully."
