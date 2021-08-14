# EC2 instance as apache web server

resource "aws_instance" "apache-webserver" {
  ami = var.ec2_ami_id
  #instance_type = var.ec2_instance_type[1]
  instance_type          = var.ec2_instance_type_map["large-apps"]
  key_name               = "terraform-key" # The key must be created before applying it here
  count                  = var.ec2_instance_count
  tags                   = var.ec2_instance_tags
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  # user_data = file("script.sh")
  user_data = <<-EOF
        #! /bin/bash
        sudo yum update -y 
        sudo yum install httpd -y
        sudo systemctl enable httpd
        sudo systemctl start httpd
        echo "<h1> Welcome to Iac ! AWS infrastructure created with Terraform in US-East-1 region" </h1>
    EOF
}