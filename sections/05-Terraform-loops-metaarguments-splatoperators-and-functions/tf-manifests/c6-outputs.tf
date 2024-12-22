output "for_output_list" {
  description = "For loop with list"
  value       = [for instance in aws_instance.myec2vm : instance.public_dns]
}

output "for_output_map1" {
  description = "For output with map"
  value       = {for instance in aws_instance.myec2vm : instance.id => instance.public_dns}
}

output "for_output_map2" {
  description = "For output with map"
  value       = {for c, instance in aws_instance.myec2vm : c => instance.public_dns}
}

# output "legacy_splat_instance_publicdns" {
#   description = "Legacy splat operator"
# value = aws_instance.myec2vm.*.public_dns
# }

# output "latest_splat_instance_publicdns" {
# description = "Generalized latest splat operator"
# value = aws_instance.myec2vm[*].public_dns
# }

output "instance_publicips" {
  description = "Public IP addresses of EC2 instances"
  value       = [for instance in aws_instance.myec2vm : instance.public_ip]
}

output "instance_publicdns" {
  description = "Public DNS of EC2 instances"
  value       = [for instance in aws_instance.myec2vm : instance.public_dns]
}

output "instance_publicdns2" {
  description = "Public DNS of EC2 instances"
  value       = {for az, instance in aws_instance.myec2vm : az => instance.public_dns}
}
