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
# provider us-east-1
provider "aws" {
    region                  = "us-east-1"
    shared_credentials_file = "$HOME/.aws/credentials"
    profile                 = "default"
}

# provider us-west-1
provider "aws" {
    region                  = "us-west-1"
    shared_credentials_file = "$HOME/.aws/credentials"
    profile                 = "default"
    alias                   = "us-west-1"
}

# resource: vpc resource definition
resource "aws_vpc" "private_vpc" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        "Name" = "private_vpc"
    }
    provider = aws.us-west-1

}