# outputs.tf

# --------------
# Generales
# --------------
output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_version" {
  description = "The Kubernetes version for the cluster"
  value       = module.eks.cluster_version
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_status" {
  description = "Status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED"
  value       = module.eks.cluster_status
}

output "eks_cluster_oidc_arn" {
  description = "Cluster OIDC"
  value = module.eks.oidc_provider_arn
}

# --------------
# Nodos
# --------------
output "eks_managed_node_groups" {
  description = "Map of attribute maps for all EKS managed node groups created"
  value       = module.eks.eks_managed_node_groups
}

# --------------
# Red y Seguridad
# --------------
output "cluster_service_cidr" {
  description = "The CIDR block where Kubernetes pod and service IP addresses are assigned from"
  value       = module.eks.cluster_service_cidr
}

output "cluster_primary_security_group_id" {
  description = "Security group for control-plane-to-data-plane communication"
  value       = module.eks.cluster_primary_security_group_id
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

# ---

