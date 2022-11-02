terraform {
  
    required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
        }
    }
}

provider "aws" {
    region = var.region
}

locals {
  vpc_name = "${terraform.workspace}-vpc"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = local.vpc_name
  }
  
}

terraform {
  backend "s3" {
    bucket = var.bucket
    key    = "value"
    region = var.region
  }
}