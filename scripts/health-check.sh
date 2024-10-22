#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <deployment-name>"
    exit 1
fi

DEPLOYMENT_NAME=$1
NAMESPACE="default"

echo "Health Status for Deployment: $DEPLOYMENT_NAME"
echo "============================================="

# Function to run kubectl command and check for errors
kubectl_check() {
    if ! output=$(eval "$1"); then
        echo "❌ Failed to execute: $1"
        return 1
    fi
    echo "$output"
    return 0
}

# Check Deployment Status
echo "Deployment Status:"
kubectl_check "kubectl get deployment $DEPLOYMENT_NAME -n $NAMESPACE -o wide"

# Check Pod Status
echo -e "\nPod Status:"
kubectl_check "kubectl get pods -n $NAMESPACE -l app=$DEPLOYMENT_NAME -o wide"

# Get CPU and Memory Usage
echo -e "\nResource Usage:"
kubectl_check "kubectl top pods -n $NAMESPACE -l app=$DEPLOYMENT_NAME"

# Check for Recent Events
echo -e "\nRecent Events:"
kubectl get events -n $NAMESPACE --sort-by=.lastTimestamp | grep $DEPLOYMENT_NAME | tail -n 5

# Check ScaledObject Status
echo -e "\nScaledObject Status:"
kubectl_check "kubectl get scaledobject -n $NAMESPACE | grep $DEPLOYMENT_NAME"

# Check HPA Status
echo -e "\nHPA Status:"
kubectl_check "kubectl get hpa -n $NAMESPACE | grep $DEPLOYMENT_NAME"

# Get Detailed Description
echo -e "\nDetailed Deployment Description:"
kubectl_check "kubectl describe deployment $DEPLOYMENT_NAME -n $NAMESPACE"
