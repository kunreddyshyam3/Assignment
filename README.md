# Kubernetes Cluster Automation with KEDA
## Prerequisites:
- Linux/Unix-based system
- sudo privileges
## Installation
### 1. Clone the repository:
git clone https://github.com/kunreddyshyam3/k8s-automation.git
cd k8s-automation
### 2. Make scripts executable:
chmod +x main.sh scripts/*.sh
## Usage
### Run the complete automation:
./main.sh
This script will run all the individual scripts sequentially to set up the environment, install KEDA, deploy a sample application, and verify its health.
### Running Individual Scripts
#### Install Dependencies:
./scripts/install-dependencies.sh
This script installs Docker, kubectl, and Minikube, sets up necessary system configurations, and requires a logout/login afterward for group changes.
#### Setup Kubernetes Cluster:
./scripts/setup-cluster.sh
This script initializes a Minikube cluster, verifies its status, and enables required addons.
#### Install KEDA:
./scripts/install-keda.sh
This script installs the Helm package manager, deploys KEDA using Helm, and verifies its installation.
#### Create Deployment:
./scripts/create-deployment.sh config/deployment.yaml
This script creates Kubernetes resources from the provided YAML file, sets up autoscaling with KEDA, and displays deployment details.
#### Check Health Status:
./scripts/health-check.sh demo-deployment
This script monitors deployment health, shows resource usage, and displays potential issues.
## Scripts Overview
- install-dependencies.sh: Performs system updates, installs Docker and kubectl, sets up Minikube, and configures group permissions.
- setup-cluster.sh: Initializes the Minikube cluster, verifies its status, sets up the metrics server, and performs basic cluster configuration.
- install-keda.sh: Installs Helm, sets up the KEDA chart repository, deploys KEDA, and verifies its installation.
- create-deployment.sh: Applies the YAML configuration, verifies resource creation, displays the service endpoint, and sets up scaling configuration.
- health-check.sh: Monitors deployment status, pod health, resource usage, events, and autoscaling status.
