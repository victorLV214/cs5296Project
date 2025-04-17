#!/bin/bash
set -e

echo "==== Initializing Jenkins Agent Node ===="

# Install essential packages
install_basic_tools() {
    echo "Installing basic utilities..."
    sudo apt update
    sudo apt install -y wget curl vim git unzip net-tools htop \
        ca-certificates gnupg lsb-release openssh-server
}

# Install OpenJDK 17
install_java() {
    echo "Installing OpenJDK 17..."
    sudo apt install -y openjdk-17-jdk
    JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
    echo "export JAVA_HOME=$JAVA_HOME" | sudo tee /etc/profile.d/java.sh
    echo 'export PATH=$PATH:$JAVA_HOME/bin' | sudo tee -a /etc/profile.d/java.sh
    source /etc/profile.d/java.sh
}

# Install Docker Engine
install_docker() {
    echo "Installing Docker..."
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker $USER
}

# Install Node Exporter (Prometheus monitoring agent)
install_node_exporter() {
    echo "Installing Prometheus Node Exporter..."
    sudo apt install -y prometheus-node-exporter
    sudo systemctl enable prometheus-node-exporter
    sudo systemctl start prometheus-node-exporter
}

# Create Jenkins user for SSH connection from master
create_jenkins_user() {
    echo "Creating 'jenkins' user..."
    sudo adduser jenkins --gecos "Jenkins Agent,,," --disabled-password
    sudo usermod -aG docker jenkins
    sudo mkdir -p /home/jenkins/jenkins_agent
    sudo chown -R jenkins:jenkins /home/jenkins
}

# Main
main() {
    install_basic_tools
    install_java
    install_docker
    install_node_exporter
    create_jenkins_user

    echo "==== Jenkins Agent Node Initialization Complete ===="
}

main
