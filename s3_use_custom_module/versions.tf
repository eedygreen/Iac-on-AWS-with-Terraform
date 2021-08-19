#terraform provider

terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.39, < 3.52.1"
    }
  }
  /*
  # for Remote Workspace uncomment backend 
  
  backend "s3" {
    bucket = "iac-bucket"
    key    = "dev/terraform.tfstate" # /dev is the directory create on the bucket before now. terraform.tfstate could be any name. e.g mystatefile.tfstate
    region = "us-east-1"
    # for state lock, prevent race condition. The dynamodb table must be created before this configuration.
    dynamodb_table = "iac-dynamodb-lock"
  }
  */
}

# terraform block
provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
}