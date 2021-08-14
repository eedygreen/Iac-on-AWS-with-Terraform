variable "aws_region" {
  description = "AWS Region for infratructure resources"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami_id" {
  description = "Amazon Linux machine identity"
  type        = string
  default     = "ami-047a51fa27710B16e"
}

variable "ec2_instance_count" {
  description = "Number of the EC instance"
  type        = number
  default     = 2
}
/*
# list variables
variable "ec2_instance_type" {
  description = "EC2 instance Type"
  type        = list(string)
  default = [ "t3.medium", "t3.small", "t2.micro" ]
}
*/
variable "ec2_instance_type_map" {
  description = "EC2 instance type map"
  type        = map(string)
  default = {
    "small-apps"  = "t3.small"
    "medium-apps" = "t3.medium"
    "large-apps"  = "t3.xlarge"
  }

}

# variables tag
variable "ec2_instance_tags" {
  description = "EC2 Instance tages"
  type        = map(string)
  default = {
    "Name" = "web-tier"
    "Tier" = "web"
  }
}