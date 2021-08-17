# EC2 instance as apache web server

resource "aws_instance" "apache-webserver" {
  ami           = data.aws_ami.amazonlnz.id
  instance_type = var.ec2_instance_type[1]
  key_name      = "terraform-key"                          # The key must be created before applying it here
  count         = terraform.workspace == "default" ? 2 : 1 # create two instance in default workspace but 1 for others
  tags = {
    "Name" = "Web-Server-${terraform.workspace}-${count.index}"
  }

  user_data = file("script.sh")

  /*user_data = <<-EOF
        #! /bin/bash
        sudo yum update -y 
        sudo yum install httpd -y
        sudo systemctl enable httpd
        sudo systemctl start httpd
        echo "<h1> Welcome to Iac ! AWS infrastructure created with Terraform in US-East-1 region" </h1>
    EOF
  */
}