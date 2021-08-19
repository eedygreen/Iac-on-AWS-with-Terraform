# Variables definition

variable "bucket_name" {
  description = "S3 Bucket name"
  type        = string
}

variable "bucket_tags" {
  description = "S3 bucket tags"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "The region for provisioning the bucket"
  type        = string
  default     = "us-east-1"
}