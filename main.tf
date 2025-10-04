# main.tf

# ----------------------------------------------------
# EKS Cluster con IRSA y Add-ons
# ----------------------------------------------------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.3.1"

  name                   = var.cluster_name
  kubernetes_version     = var.kubernetes_version
  vpc_id                 = module.vpc.vpc_id
  subnet_ids             = module.vpc.private_subnets
  endpoint_public_access = true
  # endpoint_private_access = true
  # Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  # EKS Addons
  addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
    }
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = var.ami_type
      instance_types = var.node_instance_types
      capacity_type  = "SPOT"
      key_name       = null # No SSH key

      min_size     = 1
      max_size     = 2
      desired_size = 1

      iam_role_additional_policies = {
        ssm = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
    }
  }
}

# ---