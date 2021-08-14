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

# promp for input - prompt variables don't have value assigned
variable "ec2_instance_type" {
  description = "EC2 instance Type"
  type        = list(string)
  default = [ "t3.medium", "t3.small", "t2.micro" ]
}

/* 
OVERIDE VARIABLES during terraform plan and or terraform apply
# For the planning stage, change the variables for instance and count

terraform plan -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3" 

# For the apply stage, change the variables for the instance and count
terraform apply -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3" 

# Generate output plan 

terraform plan -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3"  -out change.plan

# apply the plan with changed variables

terraform apply change.plan

*/