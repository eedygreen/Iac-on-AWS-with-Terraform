variable "aws_region" {
  description = "AWS Region for infratructure resources"
  type        = string
  default     = "us-east-1"
}

# validation input variable
variable "ec2_ami_id" {
  description = "Amazon Linux machine identity"
  type        = string
  default     = "ami-047a51fa27710B16e"
  validation {
    condition = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id, 0, 4) == "ami-"
    error_message = "The Amazon Machine Image (ami) Id must be a valid with a starting string 'ami-'"
  }
}


variable "ec2_instance_count" {
  description = "Number of the EC instance"
  type        = number
  default     = 2
}

# promp for input - prompt variables don't have value assigned
variable "ec2_instance_type" {
  description = "EC2 instance Type"
  type        = list(string)
  default = [ "t3.medium", "t3.small", "t2.micro" ]
}

variable "package_name" {
  description = "package to be install"
  type = string
  default = "httpd"
}