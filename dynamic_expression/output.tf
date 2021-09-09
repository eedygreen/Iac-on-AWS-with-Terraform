output "ec2_instance_publicIP" {
  description = "The apahe webserver instance public ip address"
  value       = aws_instance.apache-webserver[*].public_ip
}

output "ec2_publicDNS" {
  description = "The apache webserver DNS"
  value       = aws_instance.apache-webserver[*].public_dns
}

output "security_groups_ids" {
  description = "The Security groups attached to VPC network"
  value       = concat([aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id])
}

output "tags" {
  description = "The EC2 instances tags"
  value       = aws_instance.apache-webserver[*].tags
}

# Note: splat expression, this is the [*] recent way of doing it