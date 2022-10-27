variable "region" {
  description = "The AWS region to use"
  type        = list(string)
  default     = ["us-west-2", "us-east-2"]
}

variable "iam_user_names" {
  description = "The IAM user to use"
  type        = list(string)
  default     = ["Hai", "Oladipo", "Cindy"]
}