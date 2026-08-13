# Terraform Kubernetes Platform

Infrastructure-as-Code-projekt som provisionerar ett Kubernetes-kluster via Terraform.
Byggs stegvis mot en produktionsliknande arkitektur (moduler, remote state, flera miljöer, GitOps).

## v0.1 – Grundläggande klusterprovisionering
- Lokalt kind-kluster (control-plane + worker) provisionerat helt via Terraform
- Provider: `tehcyx/kind`

### Kör det själv
\`\`\`bash
terraform init
terraform apply
kubectl get nodes
\`\`\`

## Roadmap
- [ ] v0.2: Modulariserad kod + remote state
- [ ] v0.3: Flera miljöer (dev/prod) + FluxCD-integration

## v0.2 – Moduler & Remote State
- Klusterlogik refaktorerad till återanvändbar modul (`modules/kind-cluster`)
- State hanteras via HCP Terraform (remote backend) med local execution mode
  (nödvändigt eftersom `kind`-providern kräver lokal Docker-åtkomst)

## v0.2 – Moduler & Remote State
- Klusterlogik refaktorerad till återanvändbar modul (`modules/kind-cluster`)
- State hanteras via HCP Terraform (remote backend) med local execution mode
  (nödvändigt eftersom `kind`-providern kräver lokal Docker-åtkomst)

## v0.3 – Multi-Environment + GitOps
- Separata dev/prod-miljöer med isolerat state (egna HCP Terraform workspaces)
- Prod skalad med fler workers för att visa miljöskillnader
- FluxCD bootstrappat mot dev-klustret, synkar automatiskt från [gitops-dev-repo](https://github.com/arash00009/gitops-dev-repo)
- Fullständig kedja: Terraform (infrastruktur) → FluxCD (GitOps) → applikation
