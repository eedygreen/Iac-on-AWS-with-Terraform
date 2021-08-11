
# Terraform Provider

terraform {
    required_version = "~> 1.0.0"
    required_providers {
        aws = {
           source  = "hashicorp/aws"
           version =  ">= 1.8.0"
    }
    # Random Provider
        random = {
           source = "hashicorp/random"
           version = "3.1.0"
    }
}
}

#Provider Block
provider "aws" {
    region = "us-east-1"
    profile = "default"
    shared_credentials_file = "$HOME/.aws/credentials"
}
