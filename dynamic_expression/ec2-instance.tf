resource "random_id" "id" {
  byte_length = 8
}

locals {
  name = (var.name != "" ? var.name : random_id.id.hex)
  owner = var.team
  common_tags =  {
    Owner = local.owner
    DefaultUser = local.name
  }
}


# EC2 instance as apache web server

resource "aws_instance" "apache-webserver" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type[1]
  key_name      = "terraform-key" # The key must be created before applying it here
  count         = (var.high_availability == true ? 2 : 1)
  tags = local.common_tags
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  # user_data = file("script.sh")
  user_data = templatefile("user_data.tmpl", { package_name = var.package_name })
  # the count.index will provide values from 0 to specified values which in this case 2 or 1
  # count.index = [0] for first instance maping to us-east-1 
  # count.index = [1] for the second instance maping to us-east-2
  # count.index = [2] for the third instance maping to us-west-1
  availability_zone = var.availability_zones[count.index]
}

