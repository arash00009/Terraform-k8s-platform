variable "cluster_name" {
  description = "Namn på kind-klustret"
  type        = string
  default     = "devops-portfolio"
}

variable "worker_count" {
  description = "Antal worker-noder"
  type        = number
  default     = 1
}
