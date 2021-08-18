module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 5

  ami                    = data.aws_ami.amazonlnz.id
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"] # replace the security group id or use function to get it
  subnet_id              = "subnet-eddcdzz4" # get the public subnet id
  user_data = file("scrip.sh")

  tags = {
    Name = ec2-cluster
    Terraform   = "true"
    Environment = "dev"
  }
}