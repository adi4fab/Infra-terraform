module "prod-public-bastion-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name                = "prod-public-bastion-sg"
  description         = "Security group for public bation host"
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id_prod
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = local.common_tags
}
