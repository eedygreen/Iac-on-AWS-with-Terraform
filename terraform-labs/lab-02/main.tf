terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.42"
    }
  }
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.region[0]
}

provider "aws" {
  region = var.region[0]
  alias  = "infrastructure"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "lab_vpc" {
  filter {
    name   = "tag:Name"
    values = ["Skillmix Lab"]
  }
}

data "aws_subnet" "lab_subnet" {
  filter {
    name   = "tag:Name"
    values = ["Skillmix Lab Public Subnet (AZ1)"]
  }
}

resource "aws_iam_user" "eedy_user" {
  for_each = toset(var.iam_user_names)
  name     = each.key
}

resource "aws_security_group" "web_instance_sg" {
  name        = "web-instance-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = data.aws_vpc.lab_vpc.id

  tags = {
    "Name" = "web-server-security-group"
  }
}
# instance per person

resource "aws_instance" "people_server" {
  for_each               = toset(var.iam_user_names)
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.lab_subnet.id
  vpc_security_group_ids = [aws_security_group.web_instance_sg.id]
  user_data              = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    echo "Hello, ${each.key}!" | sudo tee /var/www/html/index.html
    EOF

  tags = {
    Name = "web-server-${each.key}"
  }

  depends_on = [aws_iam_user.eedy_user]
}

resource "aws_s3_bucket_acl" "eedy_bucket_acl" {
  bucket   = aws_s3_bucket.eedy_bucket.id
  acl      = "private"
}

resource "aws_s3_bucket" "eedy_bucket" {
  bucket   = "eedy-bucket"
}