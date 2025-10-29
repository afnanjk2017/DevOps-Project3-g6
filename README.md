## Burger Builder – CI/CD and Repo Overview

This repo contains the Burger Builder app and everything to build, provision, and deploy it using GitHub Actions. Inside you'll find the backend and frontend code, Terraform for Azure, Kubernetes manifests for AKS, and workflows to automate the whole pipeline.


### Repository Structure
- `backend/`: Spring Boot API source, tests, and `Dockerfile`.
- `frontend/`: React + Vite app source, tests, and `Dockerfile`.
- `infra/`: Terraform root and modules for Azure resources (AKS, networking, DB).
- `k8s/`: Kubernetes manifests for backend, frontend, and monitoring (Grafana/Prometheus).
- `.github/workflows/`: GitHub Actions workflows for build, infrastructure, and deployment.


## GitHub Actions Workflows
Location: `.github/workflows/`

- `backend.yml` – Build & push backend image to DockerHub.
  - Triggers: Pull requests that change `backend/**`, and manual dispatch.

- `frontend.yml` – Build & push frontend image to DockerHub.
  - Triggers: Pull requests that change `frontend/**`, and manual dispatch (with `environment` input).

- `infra.yml` – Provision/update Azure infrastructure with Terraform, install Ingress + monitoring.
  - Triggers: Pull requests that change `infra/**`, and manual dispatch (with `environment` input).

- `k8s-deploy.yml` – Deploy Kubernetes manifests to AKS, render images with env, verify rollout.
  - Triggers: Pull requests that change `k8s/**`, and manual dispatch (with `environment` input).


## Requirements to Run the Workflows
Configure the following repository secrets (Settings → Security → Secrets and variables → Actions):
- `DOCKERHUB_USERNAME` – DockerHub account name
- `DOCKERHUB_TOKEN` – DockerHub access token with push permissions
- `AZURE_CREDS` – Azure Service Principal credentials JSON for `azure/login`
- `ARM_SUBSCRIPTION_ID` – Azure subscription ID
- `DB_PASSWORD` – Database password used for Terraform and K8s secret
- `STORAGE_RG` – Azure resource group for Terraform state storage
- `STORAGE_AC` – Azure storage account name for Terraform state
- `BLOB_CON` – Azure storage container name for Terraform state
- `keytf` – Terraform state file key (e.g., `project3.tfstate`)

Permissions and tooling assumed by runners:
- Docker available on runner (used by build-and-push workflows)
- Azure CLI available (used in infra/k8s workflows)
- Terraform and Helm installed by the workflows themselves


## How to Run the Workflows

### Run from GitHub UI
1. Push your branch to GitHub.
2. Go to the repository → Actions tab.
3. Select a workflow:
   - Build & Push Backend (`backend.yml`)
   - Build & Push Frontend (`frontend.yml`)
   - build infrastructure (`infra.yml`)
   - deploy to kubernetes (`k8s-deploy.yml`)
4. Click “Run workflow”, choose branch (`main` or your branch). For `frontend.yml`, `infra.yml`, and `k8s-deploy.yml`, set the `environment` input (default `dev`).

### Run using GitHub CLI (gh)
```bash
# Run Backend workflow on main
gh workflow run "Build & Push Backend" -r main

# Run Frontend workflow with environment
gh workflow run "Build & Push Frontend" -r main -f environment=dev

# Provision/Update Infra
gh workflow run "build infrastructure" -r main -f environment=dev

# Deploy Manifests to AKS
gh workflow run "deploy to kubernetes" -r main -f environment=dev
```

Notes:
- Pull request events will also trigger the respective workflows when files under their paths change.
- Ensure all required secrets are configured before running any workflow.
