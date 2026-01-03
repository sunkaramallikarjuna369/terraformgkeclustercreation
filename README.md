# GKE Cluster Creation with Terraform

This Terraform configuration creates a complete Google Kubernetes Engine (GKE) cluster on Google Cloud Platform (GCP) with best practices for networking, security, and cost optimization.

## Overview

This repository contains Terraform code to provision:

- **GKE Cluster**: Kubernetes cluster with workload identity enabled
- **Node Pool**: Managed node pool with autoscaling capabilities
- **VPC Network**: Custom VPC network with subnets
- **Service Account**: IAM service account for GKE nodes
- **IAM Roles**: Proper role assignments for logging and monitoring

## Prerequisites

Before using this Terraform configuration, ensure you have:

1. **Terraform**: Version 1.0 or higher
2. **Google Cloud SDK**: Installed and configured with your GCP credentials
3. **GCP Project**: Active GCP project with billing enabled
4. **Permissions**: Sufficient IAM permissions to create GKE clusters, networks, and service accounts

## Files

- `main.tf`: Main Terraform configuration with GKE cluster and resource definitions
- `variables.tf`: Variable declarations with descriptions and default values
- `terraform.tfvars`: Variable assignments (example values)

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/sunkaramallikarjuna369/terraformgkeclustercreation.git
cd terraformgkeclustercreation
```

### 2. Set Your GCP Project ID

Edit `terraform.tfvars` and replace `YOUR_PROJECT_ID` with your actual GCP project ID:

```hcl
project_id = "your-actual-project-id"
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review the Plan

```bash
terraform plan
```

### 5. Apply the Configuration

```bash
terraform apply
```

### 6. Verify the Cluster

```bash
gcloud container clusters get-credentials gke-terraform-cluster --region us-central1 --project your-project-id
kubectl get nodes
```

## Configuration Variables

### Required Variables

- `project_id`: Your GCP project ID

### Optional Variables (with defaults)

- `region`: GCP region (default: us-central1)
- `cluster_name`: GKE cluster name (default: gke-terraform-cluster)
- `network_name`: VPC network name (default: terraform-vpc)
- `subnet_name`: Subnet name (default: terraform-subnet)
- `subnet_cidr`: Subnet CIDR block (default: 10.0.0.0/24)
- `node_pool_name`: Node pool name (default: terraform-node-pool)
- `initial_node_count`: Initial number of nodes (default: 3)
- `min_node_count`: Minimum nodes for autoscaling (default: 1)
- `max_node_count`: Maximum nodes for autoscaling (default: 5)
- `machine_type`: Machine type for nodes (default: e2-medium)
- `disk_size_gb`: Disk size in GB (default: 50)
- `preemptible`: Use preemptible VMs (default: true)
- `enable_autoscaling`: Enable cluster autoscaling (default: true)

## Features

### Cost Optimization

- **Preemptible VMs**: Reduces costs by 70% with temporary, interruptible compute instances
- **Autoscaling**: Automatically adjusts cluster size based on demand (1-5 nodes)
- **Cost-effective machine type**: Uses e2-medium instances for balanced performance and cost

### Security

- **Workload Identity**: Enables secure service-to-service authentication
- **Custom Service Account**: Dedicated service account for GKE nodes
- **IAM Roles**: Proper role assignments for principle of least privilege
- **Custom VPC**: Isolated network for cluster resources

### Monitoring & Logging

- **Cloud Logging**: Integrated with Google Cloud Logging
- **Cloud Monitoring**: Integrated with Google Cloud Monitoring
- **Service Account Permissions**: Configured for logging and metrics publication

## Cleanup

To destroy all resources created by this Terraform configuration:

```bash
terraform destroy
```

Confirm by typing `yes` when prompted.

## Troubleshooting

### Issue: Authentication Error

**Solution**: Ensure Google Cloud SDK is properly configured:
```bash
gcloud auth application-default login
gcloud config set project your-project-id
```

### Issue: Cluster Creation Timeout

**Solution**: GKE cluster creation typically takes 5-15 minutes. Monitor progress:
```bash
gcloud container operations list --project your-project-id
```

### Issue: Node Pool Creation Error

**Solution**: Verify your GCP quotas for compute resources:
```bash
gcloud compute resource-quotas list
```

## Resources Created

This Terraform configuration creates:

1. GKE Cluster with workload identity
2. Managed Node Pool with autoscaling
3. VPC Network
4. Subnet (10.0.0.0/24)
5. Service Account for GKE nodes
6. IAM Role Bindings for logging and monitoring

## Cost Estimation

Estimated monthly cost with default configuration:
- **GKE Cluster Management**: Free (Google Cloud free tier)
- **3 x e2-medium Preemptible VMs**: ~$15-20/month
- **Total Estimated Cost**: ~$15-20/month for basic setup

Prices vary by region. For accurate pricing, use the [GCP Pricing Calculator](https://cloud.google.com/products/calculator).

## Support & Contribution

For issues, questions, or contributions, please create an issue or pull request in the repository.

## License

This Terraform configuration is provided as-is. Use at your own risk and ensure compliance with your organization's policies.

## References

- [Terraform GCP Provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Google Kubernetes Engine Documentation](https://cloud.google.com/kubernetes-engine/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices.html)
