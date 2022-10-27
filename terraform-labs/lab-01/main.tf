terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.42"
    }
  }
  required_version = ">= 0.15.3"
}

provider "aws" {
  region = var.region
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

# resource "aws_vpc" "lab_01_vpc" {
#   cidr_block = "10.0.0.0/16"

# }
# resource "aws_subnet" "lab_01_subnet" {
#   vpc_id     = aws_vpc.lab_01_vpc.id
#   cidr_block = "10.0.1.0/24"
# }

resource "aws_security_group" "eedy_security_group" {
  name        = "eedy-security-group"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = data.aws_vpc.lab_vpc.id

  tags = {
    "Name" = "web-server-security-group"
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.lab_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "eedy_launch_template" {
  name                   = "eedy-launch-template"
  image_id               = "ami-098e42ae54c764c35"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.eedy_security_group.id]

  tags = {
    "Name" = "eedy-launch-template"
  }

}

resource "aws_autoscaling_group" "eedy_asg" {
  name = "eedy-asg"
  launch_template {
    id      = aws_launch_template.eedy_launch_template.id
    version = "$Latest"
  }
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = [data.aws_subnet.lab_subnet.id]
  tags = [
    {
      key                 = "Name"
      value               = "eedy-asg"
      propagate_at_launch = true
    }
  ]
}