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
    "Name" = "key-name"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("~/.ssh/key.pem")
  }

}

# file provisioner block

provisioner "file" {
  content     = "file.txt"
  destination = "/home/ubuntu/file.txt"
}

output "ip" {
  value = aws_instance.web_server.public_ip
}