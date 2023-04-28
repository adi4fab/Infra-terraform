module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"


  name = var.vpc_name
  cidr = var.cidr_block

  azs             = var.azs
  private_subnets = var.private_sub
  public_subnets  = var.public_sub


  # database subnet config
  database_subnets                   = var.db_sub
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