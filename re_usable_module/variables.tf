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

