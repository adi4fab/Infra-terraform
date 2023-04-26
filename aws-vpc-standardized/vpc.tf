module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"


  name = "vpc-dev"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]


  # database subnet config
  database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnet_tags = {
    Terraform = "true"
    Name      = "db-subnet-${var.env}"
  }

  # nat for private subnet and single nat since it costs - for prod comment it
  enable_nat_gateway = true
  single_nat_gateway = true

  # vpc dns parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Terraform = "true"
    Name      = "public-subnet-${var.env}"
  }

  private_subnet_tags = {
    Terraform = "true"
    Name      = "private-subnet-${var.env}"
  }

  tags = local.common_tags
}