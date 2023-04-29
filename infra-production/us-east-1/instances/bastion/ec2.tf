module "ami" {
  source = "../../../../module/ami/"
}

module "bation" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name = "bation-prod"
  ami  = module.ami.amazon_linux_image_id

  instance_type          = var.instance_type
  key_name               = var.instance_key
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.public_bastion_sg_id_prod}"]
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnet_id_prod[0]

  tags = local.common_tags
}

