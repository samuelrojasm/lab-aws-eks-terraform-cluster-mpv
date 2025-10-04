# global.tfvars

# ----------------------------
# Región y entorno
# ----------------------------
aws_region   = "us-east-1"
cluster_name = "ekslab"
profile      = "tf" # Nombre del perfil configurado en AWS CLI con IAM Identity Center

# ----------------------------
# Tags comunes
# ----------------------------
tags = {
  Project     = "EKS Lab"
  Environment = "dev"
  Owner       = "cloud-team"
}