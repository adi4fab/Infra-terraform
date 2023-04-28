module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name                = "production-web-server-sg"
  description         = "Security group for web-server with HTTP and SSH ports open within VPC"
  vpc_id              = "adawdaw"
  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]

  tags = local.common_tags

}