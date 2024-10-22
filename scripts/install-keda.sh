#!/bin/bash

echo "Installing Helm and KEDA..."

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
if [ $? -eq 0 ]; then
    echo "✅ Helm installed successfully"
else
    echo "❌ Helm installation failed"
    exit 1
fi

# Install KEDA
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
kubectl create namespace keda
helm install keda kedacore/keda --namespace keda

# Verify KEDA installation
echo "Verifying KEDA installation..."
kubectl get pods -n keda
kubectl get deployment -n keda
