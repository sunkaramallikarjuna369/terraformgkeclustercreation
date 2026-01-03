variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
  default     = "gke-terraform-cluster"
}

variable "network_name" {
  description = "VPC Network Name"
  type        = string
  default     = "terraform-vpc"
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = "terraform-subnet"
}

variable "subnet_cidr" {
  description = "Subnet CIDR Range"
  type        = string
  default     = "10.0.0.0/24"
}

variable "node_pool_name" {
  description = "GKE Node Pool Name"
  type        = string
  default     = "terraform-node-pool"
}

variable "initial_node_count" {
  description = "Initial number of nodes in the GKE cluster"
  type        = number
  default     = 3
}

variable "min_node_count" {
  description = "Minimum number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes in the node pool"
  type        = number
  default     = 5
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "Disk size in GB for GKE nodes"
  type        = number
  default     = 50
}

variable "preemptible" {
  description = "Use preemptible nodes to save costs"
  type        = bool
  default     = true
}

variable "enable_autoscaling" {
  description = "Enable cluster autoscaling"
  type        = bool
  default     = true
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "terraform"
}

variable "service_account_name" {
  description = "Service Account Name for GKE nodes"
  type        = string
  default     = "gke-terraform-sa"
}
