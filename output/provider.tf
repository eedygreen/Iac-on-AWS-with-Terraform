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
  region                  = var.aws_region
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
}