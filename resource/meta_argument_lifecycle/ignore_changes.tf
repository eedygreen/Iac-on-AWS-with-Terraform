# lifecycle ignore_changes

resource "aws_instance" "webserver" {
  ami = "ami-047a51fa27710B16e"
  instance_type = "t2.micro"
  count = 5
  key_name = "terraform-key" # The key must be created before applying it here
  tags = {
    "Name" = "Web-Server-${count.index}"
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}