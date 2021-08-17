#! /bin/bash
sudo yum update -y 
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
echo "<h1> Welcome to Iac ! AWS infrastructure created with Terraform in US-East-1 region" </h1>
