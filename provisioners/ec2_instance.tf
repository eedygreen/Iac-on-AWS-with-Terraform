# EC2 instance as apache web server

resource "aws_instance" "apache-webserver" {
  ami           = data.aws_ami.amazonlnz.id
  instance_type = var.ec2_instance_type[1]
  key_name      = "terraform-key"                          # The key must be created before applying it here
  count         = terraform.workspace == "default" ? 2 : 1 # create two instance in default workspace but 1 for others
  tags = {
    "Name" = "Web-Server-${terraform.workspace}-${count.index}"
  }

  user_data = file("script.sh")

  /*user_data = <<-EOF
        #! /bin/bash
        sudo yum update -y 
        sudo yum install httpd -y
        sudo systemctl enable httpd
        sudo systemctl start httpd
        echo "<h1> Welcome to Iac ! AWS infrastructure created with Terraform in US-East-1 region" </h1>
    EOF
  */
# provisioners
/* 
Note: Provisioners should only be used as a last resort. For most common situations there are better alternatives.

https://www.terraform.io/docs/language/resources/provisioners/syntax.html
*/

# connection block to connect to ec2 instance with ssh
connection {
    type = "ssh"
    host = self.public_ip
    user = ec2-user
    password = ""
    private_key =  file("eed/Document/terraform.pem")
}

# provisioner block to copy file from local directory to ec2 tmp directory 
provisioner "file" {
    source = "app/html.index"
    destination = "/tmp/html.index"
}
provisioner "file" {
    source = "ami use: ${self.ami}"
    destination = "/tmp/file.log"
}
provisioner "file" {
    source = "apps/app1"
    destination = "/tmp/"
}
provisioner "file" {
    source = "apps/app2/"
    destination = "tmp"
}
}