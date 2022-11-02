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

resource "aws_s3_bucket" "just_backend" {
    bucket = var.backend_bucket
}

resource "aws_s3_bucket_acl" "s3_acl" {
    bucket = aws_s3_bucket.just_backend.id
    acl = "private"
}

