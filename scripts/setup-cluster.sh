#!/bin/bash

echo "Setting up Kubernetes cluster..."

# Start Minikube
minikube start --driver=docker
if [ $? -eq 0 ]; then
    echo "✅ Minikube started successfully"
else
    echo "❌ Minikube start failed"
    exit 1
fi

# Verify cluster status
echo "Verifying cluster status..."
minikube status
kubectl get nodes

# Enable necessary addons
echo "Enabling metrics-server..."
minikube addons enable metrics-server
