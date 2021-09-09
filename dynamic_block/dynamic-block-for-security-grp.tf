# Define ports as list in local block

locals {
  ports = [80, 443, 8080, 8081, 7080, 7081, 47080]
}


# Create Security groups using terraform dynamic block

resource "aws_security_group" "sg-dynamic" {
  name        = "dynamic-security-group"
  description = "Security group with dynamic blcok"

  dynamic "ingress" {
    for_each = local.ports
    content {
      description = "desciption position ${ingress.key}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}