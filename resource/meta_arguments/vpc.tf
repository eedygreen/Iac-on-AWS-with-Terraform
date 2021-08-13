# vpc resources
resource "aws_vpc" "tf-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-dev"
  }
}

# vpc_subnet
resource "aws_subnet" "tf-vpc-public-subnet" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b" # optional and if not provided the default in provider file will be used
  map_public_ip_on_launch = true
  tags = {
    Name = "vpc-subnet-dev"
  }
}

# internet gateway
resource "aws_internet_gateway" "tf-vpc-igw" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    Name = "tf-vpc-igw"
  }
}

# route table
resource "aws_route_table" "tf-vpc-route-table" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    Name = "tf-vpc-route-table"
  }
}

# route
resource "aws_route" "tf-vpc-route" {
  route_table_id = aws_route_table.tf-vpc-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.tf-vpc-igw.id
  depends_on = [ aws_route_table.tf-vpc-route-table ]
}

# route table association
resource "aws_route_table_association" "route-table-associate" {
  #subnet_id      = aws_subnet.tf-vpc-public-subnet.id
  gateway_id     = aws_internet_gateway.tf-vpc-igw.id #optional, either one of the thes subnet_id or gateway_id.
  route_table_id = aws_route_table.tf-vpc-route-table.id
}

# security group
resource "aws_security_group" "tf-vpc-sg" {
  name        = "tf-vpc-security-group"
  description = "Allow traffic to tf-vpc network"
  vpc_id      = aws_vpc.tf-vpc.id

  ingress = [
    {
      description      = "SSH & HTTP Connection"
      from_port        = [22, 80]
      to_port          = [22, 80]
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.tf-vpc.cidr_block]
      ipv6_cidr_blocks = [aws_vpc.tf-vpc.ipv6_cidr_block]
    }
  ]

  egress = [
    {
      description      = "Allow all connection to external resources"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

  tags = {
    Name = "allow_tls"
  }
}