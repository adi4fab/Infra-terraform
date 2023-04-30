output "webserver_instance_id" {
  value = module.webserver.*.id
}

output "webserver_private_ip" {
  value = module.webserver.*.private_ip
}


