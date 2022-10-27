output "vpc" {
  value = aws_vpc.my_vpc
}

output "subnet" {
  value = aws_subnet.public_subnet
}

output "security_group" {
  value = aws_security_group.web_sg
}
  