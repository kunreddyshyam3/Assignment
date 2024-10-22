# Kubernetes Cluster Automation with KEDA

# Prerequisites:
# - Linux/Unix-based system
# - sudo privileges

# 1. Clone the repository
git clone https://github.com/kunreddyshyam3/k8s-automation.git
cd k8s-automation

# 2. Make scripts executable
chmod +x main.sh scripts/*.sh

# 3. Run the complete automation
./main.sh

# (Optional) Running Individual Scripts:

# Install Dependencies:
./scripts/install-dependencies.sh

# This script installs Docker, kubectl, and Minikube, sets up necessary system configurations, 
# and requires a logout/login afterward for group changes.

# Setup Kubernetes Cluster:
./scripts/setup-cluster.sh

# This script initializes a Minikube cluster, verifies its status, and enables required addons.

# Install KEDA:
./scripts/install-keda.sh

# This script installs Helm, deploys KEDA using Helm, and verifies its installation.

# Create Deployment:
./scripts/create-deployment.sh config/deployment.yaml

# This script creates Kubernetes resources from the provided YAML file, sets up autoscaling with KEDA, and displays deployment details.

# Check Health Status:
./scripts/health-check.sh demo-deployment

# This script monitors deployment health, shows resource usage, and displays potential issues.
