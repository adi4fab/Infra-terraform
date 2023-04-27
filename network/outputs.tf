output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "private_subnet_id" {
  value = module.vpc.private_subnets
}

output "private_subnet" {
  value = module.vpc.public_subnets
}

output "nat_gateway_id" {
  value = module.vpc.nat_public_ips
}


output "nat_gateway" {
  value = module.vpc.azs
}





