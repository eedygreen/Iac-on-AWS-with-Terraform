# Elastic IP
resource "aws_eip" "tf-eip" {
  instance = aws_instance.apache-webserver.id
  vpc      = true
  # add Meta-Argument
  depends_on = [
    aws_internet_gateway.tf-vpc-igw
  ]

}