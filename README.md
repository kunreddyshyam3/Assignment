# Kubernetes Cluster Automation with KEDA

This project provides a set of bash scripts to automate the setup and management of a Kubernetes cluster with KEDA.

## Prerequisites
- Linux/Unix-based system
- sudo privileges

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/kunreddyshyam3/k8s-automation.git
   cd k8s-automation/scripts
2. Make scripts executable
Absolutely! Here's the complete file combining the installation steps, scripts overview, and essential information for a single, ready-to-use file:

Bash
# Kubernetes Cluster Automation with KEDA

This project provides a set of bash scripts to automate the setup and management of a Kubernetes cluster with KEDA.

## Prerequisites

- Linux/Unix-based system
- sudo privileges

## Installation

**1. Clone the repository:**

```bash
git clone [https://github.com/kunreddyshyam3/k8s-automation.git](https://github.com/kunreddyshyam3/k8s-automation.git)
cd k8s-automation
Use code with caution.

2. Make scripts executable:

Bash
chmod +x main.sh scripts/*.sh
Use code with caution.

Usage
Run the complete automation:

Bash
./main.sh
Use code with caution.

This script will run all the individual scripts sequentially to set up the environment, install KEDA, deploy a sample application, and verify its health.

Running Individual Scripts

You can run each component of the automation independently:

Install Dependencies:

Bash
./scripts/install-dependencies.sh
Use code with caution.

This script installs Docker, kubectl, and Minikube, sets up necessary system configurations, and requires a logout/login afterward for group changes.

Setup Kubernetes Cluster:

Bash
./scripts/setup-cluster.sh
Use code with caution.

This script initializes a Minikube cluster, verifies its status, and enables required addons.

Install KEDA:

Bash
./scripts/install-keda.sh
Use code with caution.

This script installs Helm package manager, deploys KEDA using Helm, and verifies its installation.

Create Deployment:

Bash
./scripts/create-deployment.sh config/deployment.yaml
Use code with caution.

This script creates Kubernetes resources from the provided YAML file, sets up autoscaling with KEDA, and displays deployment details.

Check Health Status:

Bash
./scripts/health-check.sh demo-deployment
Use code with caution.

This script monitors deployment health, shows resource usage, and displays potential issues.

Scripts Overview
install-dependencies.sh: Performs system updates, installs Docker and kubectl, sets up Minikube, and configures group permissions.
setup-cluster.sh: Initializes the Minikube cluster, verifies its status, sets up the metrics server, and performs basic cluster configuration.
install-keda.sh: Installs Helm, sets up the KEDA chart repository, deploys KEDA, and verifies its installation.
create-deployment.sh: Applies the YAML configuration, verifies resource creation, displays the service endpoint, and sets up scaling configuration.
health-check.sh: Monitors deployment status, pod health, resource usage, events, and autoscaling status.
