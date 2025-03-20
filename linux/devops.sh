#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install Git
sudo apt install -y git

# Install Docker
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

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/keys/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian/ stable main > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins

# Prevent Jenkins from starting automatically on boot
sudo systemctl disable jenkins

# Install Ansible
sudo apt install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

# Install Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo apt update
sudo apt install -y terraform

# Install Prometheus
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

# Install Grafana
sudo apt install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update
sudo apt install -y grafana

# Install Splunk (Free version)
cd /tmp
curl -O https://download.splunk.com/products/splunk/releases/8.2.4/linux/splunk-8.2.4-87e8c2d98a56-linux-2.6-x86_64.rpm
sudo rpm -i splunk-8.2.4-87e8c2d98a56-linux-2.6-x86_64.rpm
sudo /opt/splunk/bin/splunk start --accept-license

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

# Prevent SonarQube from starting automatically on boot
sudo systemctl disable sonarqube

# Install OWASP ZAP
sudo apt install -y default-jdk
sudo apt install -y owasp-zap

# Install Nikto (Web scanner)
sudo apt install -y nikto

# Install Nexus Repository
# Install Nexus
sudo useradd -r -m -s /bin/bash nexus
cd /tmp
curl -O https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -xvzf latest-unix.tar.gz
sudo mv nexus-3*/ /opt/nexus
sudo ln -s /opt/nexus/bin/nexus /usr/local/bin/nexus
sudo chown -R nexus:nexus /opt/nexus
sudo /opt/nexus/bin/nexus start

# Install Slack CLI (Optional: if you want the CLI tool for Slack)
curl -sSL https://slack.com/downloads/instructions/cli | bash

# Start Jenkins service when needed
echo "To start Jenkins manually, run: sudo systemctl start jenkins"

# Start SonarQube service when needed
echo "To start SonarQube manually, run: sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start"

# Start Prometheus and Grafana services (using systemd or manually)
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Enable Prometheus service (if needed)
sudo systemctl enable prometheus

# Output Jenkins and SonarQube installation URLs
echo "Jenkins is now installed but not started automatically. Use: sudo systemctl start jenkins"
echo "SonarQube is now installed but not started automatically. Use: sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start"

# Print installation status
echo "Installation of tools complete."
