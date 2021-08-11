#terraform provider

terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.39, < 3.52.1"
    }
  }
}

# terraform block

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
}

# resources

resource "aws_vpc" "public_vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "public_vpc"
  }
}