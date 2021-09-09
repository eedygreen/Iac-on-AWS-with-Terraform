# README.md

```
.
├── cli_driven_workflow
│   ├── output.tf
│   ├── README.md
│   ├── s3_bucket.tf
│   ├── variables.tf
│   └── versions.tf
├── data_source
│   ├── data_source.tf
│   ├── ec2-instance.tf
│   ├── provider.tf
│   ├── script.sh
│   └── variables.tf
├── dependency_lock_file
│   ├── provider.tf
│   ├── README.md
│   └── s3_bucket.tf
├── dynamic_block
│   ├── dynamic-block-for-security-grp.tf
│   ├── provider.tf
│   └── security-grps.tf
├── dynamic_expression
│   ├── ec2-instance.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── security-grps.tf
│   ├── terraform.tfvars
│   ├── user_data.tmpl
│   ├── variables.tf
│   └── vpc.tf
├── Iac-policy-wtih-sentinel
│   ├── check-versions.sentinel
│   ├── LICENSE
│   ├── output.tf
│   ├── README.md
│   ├── restrict-s3-bucket.sentinel
│   ├── s3_bucket.tf
│   ├── sentinel.hcl
│   ├── variables.tf
│   └── versions.tf
├── import _state
│   ├── ec2_instance
│   │   ├── ec2_instance.tf
│   │   └── versions.tf
│   └── s3_bucket
│       ├── s3_bucket.tf
│       └── versions.tf
├── LICENSE
├── local
│   ├── provider.tf
│   ├── s3-bucket.tf
│   └── variables.tf
├── modules
│   ├── data_source.tf
│   ├── ec2-instance-modules.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── script.sh
│   └── variables.tf
├── multiple_provider
│   └── multiple_providers.tf
├── output
│   ├── ec2-instance.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── security-grps.tf
│   ├── variables.tf
│   └── vpc.tf
├── provider_block
│   ├── provider_block.tf
│   └── README.md
├── provisioners
│   └── ec2_instance.tf
├── README.md
├── resource
│   ├── ec2-instance
│   │   ├── ec2_east-1.tf
│   │   ├── provider.tf
│   │   └── vpc_resource.tf
│   ├── meta_argument_count
│   │   ├── ec2-instance.tf
│   │   └── provider.tf
│   ├── meta_argument_for_each
│   │   ├── for_each_maps
│   │   │   ├── multiple-s3-bucket.tf
│   │   │   └── provider.tf
│   │   └── for_each_sets
│   │       ├── iam-users.tf
│   │       └── provider.tf
│   ├── meta_argument_lifecycle
│   │   ├── create_before_destroy.tf
│   │   ├── ignore_changes.tf
│   │   ├── prevent_destroy.tf
│   │   └── provider.tf
│   └── meta_arguments
│       ├── ec2-instance.tf
│       ├── eip.tf
│       ├── provider.tf
│       ├── script.sh
│       └── vpc.tf
├── s3_bucket
│   ├── index.html
│   ├── main.tf
│   ├── output.tf
│   ├── terraform.tfvars
│   ├── variables.tf
│   └── versions.tf
├── s3_use_custom_module
│   ├── module
│   │   └── s3_custom_module
│   │       ├── LICENSE
│   │       ├── main.tf
│   │       ├── output.tf
│   │       ├── README.md
│   │       └── variables.tf
│   ├── output.tf
│   ├── s3_bucket.tf
│   ├── variables.tf
│   └── versions.tf
├── templatefile
│   ├── ec2-instance.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── security-grps.tf
│   ├── terraform.tfvars
│   ├── user_data.tmpl
│   ├── variables.tf
│   └── vpc.tf
├── terraform-cloud-vcs
│   ├── ami_data_source.tf
│   ├── ec2-instance.tf
│   ├── install_server.sh
│   ├── LICENSE
│   ├── output.tf
│   ├── provider.tf
│   ├── README.md
│   ├── security-grps.tf
│   ├── variables.tf
│   └── vpc.tf
├── terraform-module-website
│   ├── LICENSE.md
│   ├── module
│   │   ├── LICENSE
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── README.md
│   │   └── variables.tf
│   ├── output.tf
│   ├── README.md
│   ├── s3_bucket.tf
│   ├── variables.tf
│   └── versions.tf
├── terraform_providers
│   ├── provider.tf
│   └── README.md
├── terraform_state
│   ├── data_source.tf
│   ├── ec2-instance.tf
│   ├── provider.tf
│   ├── script.sh
│   └── variables.tf
├── terraform_workspace
│   ├── data_source.tf
│   ├── ec2-instance.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── script.sh
│   ├── terraform.tfstate.d
│   └── variables.tf
└── variables
    ├── db_instance
    │   ├── db_instance.tf
    │   ├── provider.tf
    │   ├── secrets.tfvars
    │   ├── variables.tf
    │   └── vpc.tf
    ├── list_variables
    │   ├── ec2-instance.tf
    │   ├── provider.tf
    │   ├── security-grps.tf
    │   ├── terraform.tfvars
    │   ├── variables.tf
    │   └── vpc.tf
    ├── map_variables
    │   ├── ec2-instance.tf
    │   ├── provider.tf
    │   ├── security-grps.tf
    │   ├── terraform.tfvars
    │   ├── variables.tf
    │   └── vpc.tf
    ├── validation_rule
    │   ├── ec2-instance.tf
    │   ├── provider.tf
    │   ├── security-grps.tf
    │   ├── terraform.tfvars
    │   ├── variables.tf
    │   └── vpc.tf
    └── variable_declaration
        ├── ec2-instance.tf
        ├── provider.tf
        ├── README.md
        ├── security-grps.tf
        ├── terraform.tfvars
        ├── variables.tf
        └── vpc.tf

41 directories, 163 files

```