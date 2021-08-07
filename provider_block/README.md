# terraform_block.tf

## Terraform Block

The provider block is the main configuration of terraform.

```bash
provider "aws" {
  region  = "us-east-2"
  profile =  "default"

}
```

"aws" is a local variable and must match the require_provider in provider's block

```bash
terraform {
   required_version = 
   required_providers {
    aws = { #the local variable 'aws' could be anything such as 'my_aws'. Best practices it should be the name of provider
      source  = "hashicorp/aws"
      version =  "~< 3.3, < 3.52.1" 
    }
 }
}
```

The provider block can also be defined as follows

```bash
provider "aws" {
    region  = "us-east-1"
    share_credentials = "$HOME/.aws/credentials"
    profile = "default"
   
}
```

Note:  The parameters must be exported to environment variable(s)

The terraform file [terraform.tf](http://terraform.tf) should have the code blocks as below

```bash
# terraform block
terraform {
   required_version = 
   required_providers {
    aws = { #the local variable 'aws' could be anything such as 'my_aws'. Best practices it should be the name of provider
      source  = "hashicorp/aws"
      version =  "~< 3.3, < 3.52.1" 
    }
 }
}
# provider block
# This configuration assumes the aws credential is already configured

provider "aws" {
    region  = "us-east-1"
    share_credentials = "$HOME/.aws/credentials"
    profile = "default"
   
}
```

Initialize the terrform.tf

```bash
terraform init
```

### output

```bash
:~/Documents/terraform/provider_block$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v3.52.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Validate the terraform configuration 

```bash
terraform validate
```

### Output

```bash
:~/Documents/terraform/provider_block$ terraform validate
Success! The configuration is valid.
```