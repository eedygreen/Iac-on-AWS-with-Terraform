variable "aws_region" {
  description = "AWS Region for infratructure resources"
  type        = string
  default     = "us-east-1"
}

variable "ec2_instance_count" {
  description = "Number of EC2 instance to provisioned"
  type        = number
  default     = 1
}
# promp for input - prompt variables don't have value assigned
variable "ec2_instance_type" {
  description = "EC2 instance Type"
  type        = list(string)
  default     = ["t3.medium", "t3.small", "t2.micro"]
}
