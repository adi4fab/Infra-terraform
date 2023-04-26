locals {
  environment = var.env
  common_tags = {
    Terraform = "true"
    Name = "${local.environment}-resource-aws"
  }
}