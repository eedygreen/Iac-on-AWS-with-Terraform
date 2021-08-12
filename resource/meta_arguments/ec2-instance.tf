# EC2 instance as apache web server

resource "aws_instance" "apache-webserver" {
  ami           = "ami-047a51fa27710B16e"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf-vpc-public-subnet.id
  key_name      = "terraform-key" # The key must be created before applying it here
  tags = {
    "Name" = "Web-Server"
  }
  vpc_security_group_ids = [aws_security_group.tf-vpc-sg.id]
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