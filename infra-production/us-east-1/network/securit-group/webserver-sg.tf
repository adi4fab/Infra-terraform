module "prod-private-webserver-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name                = "prod-private-webserver-sg"
  description         = "Security group for web-server with HTTP and SSH ports open within VPC"
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id_prod
  ingress_cidr_blocks = ["${data.terraform_remote_state.vpc.outputs.vpc_cidr_prod}"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]

  tags = local.common_tags
}