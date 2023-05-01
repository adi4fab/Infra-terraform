module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.6.0"

  name = "prod-alb"

  load_balancer_type = "application"

  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id_prod
  subnets         = data.terraform_remote_state.vpc.outputs.public_subnet_id_prod
  security_groups = [module.prod-alb-sg.security_group_id]



  target_groups = [
    {
      name_prefix                       = "app1-"
      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 5
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 2
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        app1 = {
          target_id = "${data.terraform_remote_state.ec2.outputs.webserver_instance_id[0]}"
          port      = 80
        },
        app2 = {
          target_id = "${data.terraform_remote_state.ec2.outputs.webserver_instance_id[1]}"
          port      = 80
        }
      }
      tags = local.common_tags
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = local.common_tags
}