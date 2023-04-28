output "public_bastion_sg_id_prod" {
  value = module.prod-public-bastion-sg.security_group_id
}

output "public_bastion_sg_name_prod" {
  value = module.prod-public-bastion-sg.security_group_name
}

output "private_webserver_sg_id_prod" {
  value = module.prod-private-webserver-sg.security_group_id
}

output "private_webserver_sg_name_prod" {
  value = module.prod-private-webserver-sg.security_group_name
}