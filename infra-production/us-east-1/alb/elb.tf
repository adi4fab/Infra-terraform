module "elb_http" {
  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.1"

  name = "prod-elb"

  subnets = ["${data.terraform_remote_state.vpc.outputs.public_subnet_id_prod[0]}",
  "${data.terraform_remote_state.vpc.outputs.public_subnet_id_prod[1]}"]
  security_groups = ["${module.prod-alb-sg.security_group_id}"]
  internal        = false

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 81
      lb_protocol       = "http"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  // ELB attachments
  number_of_instances = data.terraform_remote_state.ec2.outputs.private_instance_count
  instances           = data.terraform_remote_state.ec2.outputs.webserver_instance_id

  tags = local.common_tags
}