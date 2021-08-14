/*
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.app-name}-${var.env-name}-bucket"
  acl = "private"
  tags = {
    "Name" = "${var.app-name}-${var.env-name}-bucket"
    Environment = var.env-name
  }
} 
*/

resource "aws_s3_bucket" "s3-buket" {
  bucket = local.bucket-name
  acl = "private"
  tags = {
    "Name" = local.bucket-name
    Environment = var.env-name
  }
}

locals {
  bucket-name = "${var.app-name}-${var.env-name}-bucket"
}