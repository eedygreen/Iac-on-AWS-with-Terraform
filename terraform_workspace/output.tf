output "apache-webserver-ip" {
  description = "Public IP address"
  value = aws_instance.apache-webserver.public_ip
}

output "apache-webserver-dns" {
  description = "DNS address"
  value = aws_instance.apache-webserver.public_dns
}
