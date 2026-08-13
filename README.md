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
