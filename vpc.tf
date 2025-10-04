# vpc.tf

# ----------------------------------------------------
# Obtener información de las Availability Zones
# ----------------------------------------------------
# Algunas zonas de disponibilidad más nuevas requieren
# que explícitamente suscripción a ellas antes de poder usarlas.
# Este filtro asegura que solo obtengas las zonas que están disponibles automáticamente para la cuenta.
data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# ----------------------------------------------------
# VPC Module
# ----------------------------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.4.0"

  name = "lab-eks-vpc"

  cidr = var.vpc_cidr
  # Selecciona tantas AZs como CIDRs declares
  azs = slice(data.aws_availability_zones.available.names, 0, length(var.private_subnet_cidrs))

  private_subnets = var.private_subnet_cidrs
  public_subnets  = var.public_subnet_cidrs

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  # ----------------------------------------------------
  # Tags requeridos por EKS
  # ----------------------------------------------------
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}