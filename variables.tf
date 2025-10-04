# variables.terraform 

# ---------------------------------------------------------------
# Variables Generales
# ---------------------------------------------------------------
variable "aws_region" {
  type        = string
  description = "Región que usa el provider AWS"
  default     = "us-east-1"
}

variable "profile" {
  type        = string
  description = "Nombre del perfil configurado en AWS CLI con IAM Identity Center"
  default     = "tf"
}

# ---------------------------------------------------------------
# Variables VPC
# ---------------------------------------------------------------
variable "vpc_cidr" {
  description = "El bloque CIDR de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Una lista de CIDRs para las subredes privadas"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Una lista de CIDRs para las subredes públicas"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# ----------------------------------------------------
# # Variables del Cluster EKS
# ----------------------------------------------------
variable "cluster_name" {
  type    = string
  default = "lab-eks-mvp"
}

variable "kubernetes_version" {
  type    = string
  default = "1.33" # Última versión compatible con AL2023
}

variable "ami_type" {
  type    = string
  default = "AL2023_ARM_64_STANDARD" # Amazon Linux 2023 para arquitectura ARM 64 (Graviton), otra opción: AL2_x86_64
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t4g.small"] # ARM Graviton
}

# ---


