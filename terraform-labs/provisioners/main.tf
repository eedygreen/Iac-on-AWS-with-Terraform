terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c4e4b4eb2e11d1d4"
  instance_type = "t2.micro"
  tags = {
    "Name" = "skillmix-lab-instance"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.web_server.public_ip} > ip.txt"
  }

}
