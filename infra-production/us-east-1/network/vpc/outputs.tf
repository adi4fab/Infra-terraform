output "vpc_id_prod" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_prod" {
  value = module.vpc.vpc_cidr_block
}

output "private_subnet_id_prod" {
  value = module.vpc.private_subnets
}

output "public_subnet_id_prod" {
  value = module.vpc.public_subnets
}

output "nat_gateway_id_prod" {
  value = module.vpc.nat_public_ips
}


output "azs_prod" {
  value = module.vpc.azs
}





