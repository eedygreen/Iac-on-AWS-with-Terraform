terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.42"
        }
    }
}

provider "aws" {
    region = "us-west-2"
}

# create the variables
variable "project" {
  type = string
  default = "apollo"
}

variable "env" {
  type = string
  default = "dev"
}

variable "high_avail" {
  type = bool
  default = true
}

variable "iam_user_names" {
  description = "List containing IAM users names"
  type        = list(string)
  default     = ["Anne", "Bob", "Carl"]
}

# get the AMI ID
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

# get the VPC subnet and security group
# data "aws_vpc" "lab_vpc" {
#   filter {
#     name = "tag:Name"
#     values = ["Skillmix Lab"]
#   }
# }

# # 
# data "aws_subnet" "lab_subnet" {
#   filter {
#     name = "tag:Name"
#     values = ["Skillmix Lab Public Subnet (AZ1)"]
#   }
# }

resource "aws_vpc" "lab_vpc" {
  cidr_block = "10.0.0.0/16"
  
}

resource "aws_subnet" "lab_subnet" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = "10.0.1.0/24"
  
}
resource "aws_iam_user" "users" {
    count = length(var.iam_user_names)
    name = var.iam_user_names[count.index]
}

resource "aws_security_group" "web_instance_sg" {
  name        = "web-server-security-group"
  description = "Allowing requests to the web servers"
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name = "web-server-security-group"
  }
}

resource "aws_instance" "server" {
    count = var.high_avail ? 2: 1
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.web_instance_sg.id] 
    subnet_id = aws_subnet.lab_subnet.id

    tags = {
        Name = join("-", [var.project, var.env])
    }
}

output "Anne_arn" {
    value = aws_iam_user.users[0].arn
    description = "The ARN of the first user, Anne"
}

output "all_users_arns" {
    value = aws_iam_user.users[*].arn
    description = "The ARNs of all users"
}

output "instance_ip" {
    value = {
        for instance in aws_instance.server: instance.id => instance.private_ip
    }
  
}