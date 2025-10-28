 # DevOps-Project3-g6
 
 A compact, cloud‑ready Burger Builder app used to demonstrate DevOps on Azure:
 React + TypeScript frontend, Spring Boot backend, Docker, Kubernetes (AKS), and Terraform IaC.
 
 ---
 
 ## Architecture
 
 ![System Architecture](docs/architecture.jpg)
 
 - App Gateway → AKS Ingress → Frontend/Backend
 - Backend → Azure SQL via Private Endpoint
 - Secrets in Azure Key Vault; metrics and alerts in Azure Monitor
 
 ---
 
 ## Repo Layout
 
 ```
 backend/   Spring Boot API
 frontend/  React + Vite UI
 infra/     Terraform for Azure (AKS, VNet, AppGW, Key Vault, SQL)
 k8s/       Kubernetes manifests (deploy, svc, hpa, ingress)
 ```
 
 ---
 
 ## Quick Start (Local)
 
 - Backend: `mvn -f backend/pom.xml spring-boot:run`
 - Frontend: in `frontend/` run `npm ci && npm run dev`
 - Set API URL for the UI: `VITE_API_BASE_URL=http://localhost:8080`
 
 Docker (optional):
 
 ```
 docker build -t burgerbuilder-backend:local ./backend
 docker build -t burgerbuilder-frontend:local ./frontend
 ```
 
 ---
 
 ## Deploy
 
 - Terraform (Azure):
   ```
   cd infra && terraform init && terraform apply
   ```
 - Kubernetes (AKS):
   ```
   kubectl apply -f k8s/backend/
   kubectl apply -f k8s/frontend/
   ```
 
 ---
 
 ## License
 
 MIT
