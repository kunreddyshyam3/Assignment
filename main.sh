#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Function to display status
display_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ $1 completed successfully${NC}"
    else
        echo -e "${RED}❌ $1 failed${NC}"
        exit 1
    fi
}

# Execute each step
echo "Starting Kubernetes cluster automation..."

# Step 1: Install dependencies
./scripts/install-dependencies.sh
display_status "Dependencies installation"

# Step 2: Setup cluster
./scripts/setup-cluster.sh
display_status "Cluster setup"

# Step 3: Install KEDA
./scripts/install-keda.sh
display_status "KEDA installation"

# Step 4: Create deployment
./scripts/create-deployment.sh config/deployment.yaml
display_status "Deployment creation"

# Step 5: Check health status
./scripts/health-check.sh demo-deployment
display_status "Health check"

echo -e "${GREEN}All operations completed successfully!${NC}"
