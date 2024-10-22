#!/bin/bash

echo "Installing dependencies..."

# Function to check command status
check_status() {
    if [ $? -eq 0 ]; then
        echo "✅ $1 successful"
    else
        echo "❌ $1 failed"
        exit 1
    fi
}

# Update system and install basic dependencies
sudo yum update -y
check_status "System update"

sudo yum install -y curl wget yum-utils
check_status "Basic dependencies installation"

# Install Docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
check_status "Docker installation"

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
check_status "Docker service setup"

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
check_status "kubectl installation"

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
check_status "Minikube installation"

echo "Dependencies installation complete! Please log out and log back in for group changes to take effect."
