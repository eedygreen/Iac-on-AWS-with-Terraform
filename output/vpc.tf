resource "aws_vpc" "vpc-conn" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-conn"
  }
}

resource "aws_subnet" "public-conn" {
  vpc_id     = aws_vpc.vpc-conn.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-conn"
  }
}