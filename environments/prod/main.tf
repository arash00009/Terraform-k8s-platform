terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.6.0"
    }
  }

  cloud {
    organization = "arash-devops-portfolio"

    workspaces {
      name = "terraform-k8s-platform-prod"
    }
  }
}

provider "kind" {}

module "cluster" {
  source       = "../../modules/kind-cluster"
  cluster_name = "devops-portfolio-prod"
  worker_count = 2
}
