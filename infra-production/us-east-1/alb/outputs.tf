output "elb_http_id" {
  description = "The name of the elb_http"
  value       = module.elb_http.elb_id
}

output "elb_http_name" {
  description = "The name of the elb_http"
  value       = module.elb_http.elb_name
}

output "elb_dns_name" {
  description = "The DNS name of the elb_http"
  value       = module.elb_http.elb_dns_name
}

output "elb_http_instances" {
  description = "The list of instances in the elb_http (if may be outdated, because instances are attached using elb_http_attachment resource)"
  value       = module.elb_http.elb_instances
}

output "elb_http_source_security_group_id" {
  description = "The ID of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances"
  value       = module.elb_http.elb_source_security_group_id
}

output "elb_zone_id" {
  description = "The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record)"
  value       = module.elb_http.elb_zone_id
}