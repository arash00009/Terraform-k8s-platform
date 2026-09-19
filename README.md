# Terraform Kubernetes Platform

A Kubernetes platform built step by step with Terraform, growing toward a production-like setup: modules, remote state, multiple environments and GitOps.

## Versions

### v0.1: Cluster provisioning
- A local `kind` cluster (control plane + worker) created entirely by Terraform
- Provider: `tehcyx/kind`

### v0.2: Modules and remote state
- Cluster logic refactored into a reusable module, `modules/kind-cluster`
- State stored in HCP Terraform (remote backend) with **local execution mode**, because the `kind` provider needs local Docker access

### v0.3: Multiple environments and GitOps
- Separate `dev` and `prod` environments, each with its own HCP Terraform workspace and isolated state
- `prod` runs two workers and `dev` runs one, to show the environments can differ
- FluxCD is bootstrapped against the dev cluster and syncs from [gitops-dev-repo](https://github.com/arash00009/gitops-dev-repo)
- The full chain works: Terraform (infrastructure) → FluxCD (GitOps) → application

## Repository layout
```
modules/kind-cluster/   reusable cluster module
environments/dev/       dev environment
environments/prod/      prod environment
```

## What was hard
The `kind` provider needs access to the local Docker daemon, so HCP Terraform cannot run the plan remotely. I used remote state with local execution: state lives in HCP Terraform, plans run on my machine.

## Run it yourself
Requires Docker, Terraform and an HCP Terraform account (update the `organization` and workspace names in `environments/*/main.tf`).

```bash
cd environments/dev
terraform init
terraform apply
kubectl get nodes
```

## Status
Local `kind` clusters only. This is a learning project and does not provision cloud infrastructure.
