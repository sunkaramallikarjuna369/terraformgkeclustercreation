# GKE Cluster Configuration Values
project_id              = "YOUR_PROJECT_ID"  # Replace with your GCP Project ID
region                  = "us-central1"
cluster_name            = "gke-terraform-cluster"
network_name            = "terraform-vpc"
subnet_name             = "terraform-subnet"
subnet_cidr             = "10.0.0.0/24"
node_pool_name          = "terraform-node-pool"
initial_node_count      = 3
min_node_count          = 1
max_node_count          = 5
machine_type            = "e2-medium"
disk_size_gb            = 50
preemptible             = true
enable_autoscaling      = true
environment             = "terraform"
service_account_name    = "gke-terraform-sa"

# Additional configuration notes:
# - preemptible = true enables preemptible VMs for cost optimization
# - enable_autoscaling = true enables horizontal pod autoscaling
# - Initial cluster is created with 3 nodes, autoscales between 1-5 nodes
# - Machine type e2-medium provides a good balance of cost and performance
