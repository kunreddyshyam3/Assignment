#!/bin/bash

# Check if deployment file exists
if [ ! -f "$1" ]; then
    echo "❌ Deployment file not found: $1"
    exit 1
fi

echo "Creating deployment from $1..."

# Apply the deployment
kubectl apply -f "$1"
if [ $? -eq 0 ]; then
    echo "✅ Deployment created successfully"
else
    echo "❌ Deployment creation failed"
    exit 1
fi

# Get deployment details
echo "Deployment Details:"
kubectl get deployment -A
echo -e "\nService Details:"
kubectl get service -A
echo -e "\nScaledObject Details:"
kubectl get ScaledObjects
echo -e "\nEndpoint:"
minikube service demo-service --url
