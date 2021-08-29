# bucket name

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "static-webpages-345"
}

# tags
variable "bucket_tags" {
  description = "S3 bucket tags"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "Dev"
  }
}

variable "aws_region" {
  description = "the region for the s3 bucket"
  type        = string
  default     = "us-east-2"
}