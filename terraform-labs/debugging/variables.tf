variable "region" {
  type    = string
  default = "us-east-2"
}

variable "instance_type" {
    type    = string
    default = "t2.micro"
    validation {
        condition     = can(regex("t2.micro|t3.micro", var.instance_type))
        #condition = can(regex("^[Tt][2].(nano/micro).", var.instance_type))
        error_message = "Instance type must be t2.micro or t3.micro"
    }
  
}