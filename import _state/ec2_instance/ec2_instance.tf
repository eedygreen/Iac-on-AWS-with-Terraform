# the local resource name is an existing name of provisioned resources
resource "aws_instance" "eedy_instance" {

}

/*
on cli, run the command below to create terraform.state file
terraform import aws_instance.eedy_instance EC2_instance_id
terraform import aws_instance.eedy_instance i-0427ff01364ae21

for the configuration file, visit the aws_instance reference file

search the terraform.state file to retrieve the value

use terraform plan to find the missing value in configuration file.
The expected outcome from terraform plan is No change, Infrastructure is up-to-date
*/