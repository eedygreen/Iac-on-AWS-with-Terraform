terraform {
  required_version = ">= 0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "debugging_instance" {
  ami           = "ami-0c2ab3b8efb09f272"
  instance_type = var.instance_type

  tags = {
    "Name" = "Debugging Instance"
  }
}