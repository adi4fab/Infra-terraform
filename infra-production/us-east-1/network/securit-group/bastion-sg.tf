module "public-bastion-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name                = "production-public-bastion-sg"
  description         = "Security group for web-server with HTTP and SSH ports open within VPC"
  vpc_id              = "adawdaw"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = local.common_tags
}