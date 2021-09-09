# SSH security group


locals {
  name  = (var.name != "" ? var.name : "name_required")
  owner = var.team
  common_tags = {
    Owner       = local.owner
    DefaultUser = local.name
  }
}

resource "aws_security_group" "vpc-ssh" {
  name        = "ssh-group"
  description = "Dev - Allow SSH Connection"
  vpc_id      = aws_vpc.vpc-conn.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.common_tags
}
# check dynamic-block-for-security-group
/*
# Web Security Group
resource "aws_security_group" "vpc-web" {
  name        = "web-group"
  description = "Dev - Allow HTTP Connection"
  vpc_id      = aws_vpc.vpc-conn.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 8080
    to_port     = 8008
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP connections "
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "other connections"
    from_port   = 47080
    to_port     = 47080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
*/