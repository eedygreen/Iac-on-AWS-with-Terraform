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
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket_acl" "eedy_aws_s3_bucket_acl" {
  bucket = aws_s3_bucket.eedy-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket" "eedy-bucket" {
  bucket = "eedy-bucket"
}

resource "aws_iam_group" "admins" {
  name = "admins@241"

}

resource "aws_iam_user" "boss" {
  name = "eedy-iam-user"
}

resource "aws_iam_user_group_membership" "add-boss-to-admins" {
  user = aws_iam_user.boss.name
  groups = [aws_iam_group.admins.name,]
}

resource "aws_vpc" "eedy" {
  cidr_block = "10.0.0.0/16"
  
}

resource "aws_subnet" "green" {
  vpc_id     = aws_vpc.eedy.id
  cidr_block = "10.0.1.0/24"
  
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "green-instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.green.id
  availability_zone = "us-west-2d"
  
}



# resource "aws_instance" "web_server" {
#   ami           = "ami-0cf6f5c8a62fa5da6"
#   instance_type = "t2.micro"


#   tags = {
#     Name = "eedy-lab-instance"
#   }
# }

