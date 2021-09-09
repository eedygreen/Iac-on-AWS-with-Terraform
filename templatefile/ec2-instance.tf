# EC2 instance as apache web server

resource "aws_instance" "apache-webserver" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type[1]
  key_name      = "terraform-key" # The key must be created before applying it here
  count         = var.ec2_instance_count
  tags = {
    "Name" = "Web-Server"
  }
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  # user_data = file("script.sh")
  user_data = templatefile("user_data.tmpl", {package_name = var.package_name})
}