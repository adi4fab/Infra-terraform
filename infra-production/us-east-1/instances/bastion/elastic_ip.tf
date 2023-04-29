resource "aws_eip" "bastion" {
  depends_on = [module.bation]
  instance   = module.bation.id
  vpc        = true

  tags = local.common_tags
}