output "webserver_instance_id" {
  value = module.webserver.*.id
}

output "webserver_public_ip" {
  value = module.webserver.*.public_ip
}


