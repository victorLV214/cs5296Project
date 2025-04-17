#!/bin/bash
set -e

echo "======= Starting Jenkins Master Node Initialization ======="

# Variables
MIRROR_SOURCE="https://mirrors.tuna.tsinghua.edu.cn/ubuntu"
JENKINS_USER="jenkins"

### Install base tools
function install_basic_tools() {
    echo "Installing base tools..."
    sudo apt update
    sudo apt install -y wget curl vim git unzip net-tools htop ca-certificates gnupg lsb-release openssh-server
}

### Install Java 17
function install_java() {
    echo "Installing OpenJDK 17..."
    sudo apt install -y openjdk-17-jdk
    JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
    echo "export JAVA_HOME=$JAVA_HOME" | sudo tee /etc/profile.d/java.sh
    echo 'export PATH=$PATH:$JAVA_HOME/bin' | sudo tee -a /etc/profile.d/java.sh
    source /etc/profile.d/java.sh
}

### Install Docker
function install_docker() {
    echo "Installing Docker..."
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker $USER
}

### Install Jenkins
function install_jenkins() {
    echo "Installing Jenkins..."
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | \
      sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt update
    sudo apt install -y jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
}

### Install Prometheus + Node Exporter
function install_prometheus() {
    echo "Installing Prometheus and Node Exporter..."
    sudo apt install -y prometheus prometheus-node-exporter
    sudo systemctl enable prometheus
    sudo systemctl start prometheus
    sudo systemctl enable prometheus-node-exporter
    sudo systemctl start prometheus-node-exporter
}

### Install Grafana
function install_grafana() {
    echo "Installing Grafana..."
    curl -fsSL https://packages.grafana.com/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/grafana.gpg
    echo "deb https://packages.grafana.com/oss/deb stable main" | \
      sudo tee /etc/apt/sources.list.d/grafana.list
    sudo apt update
    sudo apt install -y grafana
    sudo systemctl enable grafana-server
    sudo systemctl start grafana-server
}

### Optional: SSH key setup for agent communication
function setup_ssh_key() {
    AGENT_IP=$1
    echo "Setting up SSH key for Jenkins agent -> $AGENT_IP"

    sudo useradd -m -s /bin/bash $JENKINS_USER || true

    if [ ! -f "/home/$JENKINS_USER/.ssh/id_rsa" ]; then
        sudo -u $JENKINS_USER ssh-keygen -t rsa -N "" -f /home/$JENKINS_USER/.ssh/id_rsa
    fi

    ssh-copy-id -i /home/$JENKINS_USER/.ssh/id_rsa.pub $JENKINS_USER@$AGENT_IP
}

### Main execution
function main() {
    install_basic_tools
    install_java
    install_docker
    install_jenkins
    install_prometheus
    install_grafana

    echo "======= ✅ Environment Initialization Completed ======="
    echo "🔗 Access URLs:"
    echo "➡ Jenkins:     http://<PublicIP>:8080"
    echo "➡ Grafana:     http://<PublicIP>:3000  (admin / admin)"
    echo "➡ Prometheus:  http://<PublicIP>:9090"
    echo "➡ Node Exporter: http://<PublicIP>:9100/metrics"
    echo ""
    echo "👉 Run './master_setup.sh setup_ssh_key <agent-ip>' to enable agent SSH access."
}

# Run script
if [ "$1" = "setup_ssh_key" ]; then
    setup_ssh_key "$2"
else
    main
fi
