module "ami" {
  source = "../../../../module/ami/"
}

module "webserver" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name = "webserver-prod"

  count                  = var.private_instance_count
  ami                    = module.ami.amazon_linux_image_id
  instance_type          = var.instance_type
  key_name               = var.instance_key
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.private_webserver_sg_id_prod}"]
  subnet_id              = data.terraform_remote_state.vpc.outputs.private_subnet_id_prod[count.index]
  user_data              = file("${path.module}/app1.sh")

  tags = local.common_tags
}

