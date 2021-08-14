.
|-- Iac-on-AWS-with-Terraform
|   |-- LICENSE
|   |-- README.md
|   |-- dependency_lock_file
|   |   |-- README.md
|   |   |-- provider.tf
|   |   `-- s3_bucket.tf
|   |-- multiple_provider
|   |   `-- multiple_providers.tf
|   |-- provider_block
|   |   |-- README.md
|   |   `-- provider_block.tf
|   |-- resource
|   |   |-- ec2-instance
|   |   |   |-- ec2_east-1.tf
|   |   |   |-- provider.tf
|   |   |   `-- vpc_resource.tf
|   |   |-- meta_argument_count
|   |   |   |-- ec2-instance.tf
|   |   |   `-- provider.tf
|   |   |-- meta_argument_for_each
|   |   |   |-- for_each_maps
|   |   |   |   |-- multiple-s3-bucket.tf
|   |   |   |   `-- provider.tf
|   |   |   `-- for_each_sets
|   |   |       |-- iam-users.tf
|   |   |       `-- provider.tf
|   |   |-- meta_argument_lifecycle
|   |   |   |-- create_before_destroy.tf
|   |   |   |-- ignore_changes.tf
|   |   |   |-- prevent_destroy.tf
|   |   |   `-- provider.tf
|   |   `-- meta_arguments
|   |       |-- ec2-instance.tf
|   |       |-- eip.tf
|   |       |-- provider.tf
|   |       |-- script.sh
|   |       `-- vpc.tf
|   |-- terraform_providers
|   |   |-- README.md
|   |   `-- provider.tf
|   `-- variables
|       |-- list_variables
|       |   |-- ec2-instance.tf
|       |   |-- provider.tf
|       |   |-- security-grps.tf
|       |   |-- terraform.tfvars
|       |   |-- variables.tf
|       |   `-- vpc.tf
|       |-- map_variables
|       |   |-- ec2-instance.tf
|       |   |-- provider.tf
|       |   |-- security-grps.tf
|       |   |-- terraform.tfstate
|       |   |-- terraform.tfvars
|       |   |-- variables.tf
|       |   `-- vpc.tf
|       `-- variable_declaration
|           |-- README.md
|           |-- ec2-instance.tf
|           |-- provider.tf
|           |-- security-grps.tf
|           |-- terraform.tfvars
|           |-- variables.tf
|           `-- vpc.tf
`-- README.md

17 directories, 49 files
