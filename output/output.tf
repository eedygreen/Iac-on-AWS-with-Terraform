# Attribute reference public ip
output "aws_instance_public_ip" {
  description = "The public ip of EC2 instance"
  value = aws_instance.apache-webserver.public_ip
}

output "aws_instance_private_ip" {
  description = "The privae ip of EC2 instance"
  value = aws_instance.apache-webserver.private_ip
}

output "aws_security_groups" {
    description = "list of security groups"
    value = aws_instance.apache-webserver.security_groups
}

output "aws_public_dns" {
  description = "Public DNS URL of EC2 instance"
  value = "http://${aws_instance.apache-webserver.public_dns}"
  sensitive = true # surpress sensitive variable
}