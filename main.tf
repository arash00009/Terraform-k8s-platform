terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.6.0"
    }
  }
}

provider "kind" {}

module "cluster" {
  source       = "./modules/kind-cluster"
  cluster_name = var.cluster_name
  worker_count = var.worker_count
}
