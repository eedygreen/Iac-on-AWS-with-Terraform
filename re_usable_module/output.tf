output "apache-webserver-ip" {
  description = "Public IP address"
  value       = module.ec2_cluster.*.public_ip # list of ip addresses
}

output "apache-webserver-dns" {
  description = "DNS address"
  value       = module.ec2_cluster.*.public_dns # list of dns addresses
}
