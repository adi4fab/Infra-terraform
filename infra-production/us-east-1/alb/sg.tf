module "prod-alb-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name                = "prod-alb-sg"
  description         = "Security group for public lb"
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id_prod
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = [ "http-80-tcp", "https-443-tcp"]
  egress_rules        = ["all-all"]

  tags = local.common_tags
}
