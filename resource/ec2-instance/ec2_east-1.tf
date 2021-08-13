# new_ec2_instance resource

resource "aws_instance" "new_ec2_instance" {
  ami               = "ami-047a51fa27710B16e" # ami is region specific
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "Ec2_backend"
  }
}