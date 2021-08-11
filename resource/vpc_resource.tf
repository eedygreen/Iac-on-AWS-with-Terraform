# resources

resource "aws_vpc" "public_vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "public_vpc"
  }
}