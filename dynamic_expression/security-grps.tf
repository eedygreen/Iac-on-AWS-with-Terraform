# Elastic LoadBalancer
resource "aws_elb" "web_elb" {
  name = "apache-web"

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
  
  # splat expression
  instances = aws_instance.apache-webserver[*].id 
  # dynamic expression
  count = (var.availability_zones == true ? 1 : 0) 
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400
  availability_zones = var.availability_zones
  tags = local.common_tags
}

# SSH security group

resource "aws_security_group" "vpc-ssh" {
  name        = "ssh-group"
  description = "Dev - Allow SSH Connection"
  vpc_id      = aws_vpc.vpc-conn.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.common_tags
}

# Web Security Group
resource "aws_security_group" "vpc-web" {
  name        = "web-group"
  description = "Dev - Allow HTTP Connection"
  vpc_id      = aws_vpc.vpc-conn.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow all traffic out of the vpc"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.common_tags
}