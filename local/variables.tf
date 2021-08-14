variable "aws_region" {
  description = "resources regions"
  type = string
  default = "us-east-1"
}

variable "app-name" {
  description = "application name"
  type = string
}

variable "env-name" {
  description = "Environment name"
  type = string
}