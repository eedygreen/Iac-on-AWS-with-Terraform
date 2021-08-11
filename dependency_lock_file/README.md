# Dependency Lock File

### Use Dependency Lock File to Lock your Configuration

Dependency Lock file is useful when certain version of provider is required and update is prevented

Create a dependency lock file with specific providers' version or copy an existing dependency lock file from the directory. The dependency lock file is .terraform.lock.hcl.

To generate .terraform.lock.hcl

```bash
# Terraform Provider

terraform {
    required_version = "~> 1.0.0"
    required_providers {
        aws = {
           source  = "hashicorp/aws"
           version =  ">= 2.0.0"
    }
    # Random Provider
        random = {
           source = "hashicorp/random"
           version = "3.1.0"
    }
}
}
```

```bash
terraform init
```

```bash
:~/Iac-on-AWS-with-Terraform$ ls -a terraform_providers/
.  ..  provider.tf  README.md  .terraform  .terraform.lock.hcl
```

The dependency lock file with version and corresponding hashes 

```bash
:~/Iac-on-AWS-with-Terraform$ cat terraform_providers/.terraform.lock.hcl 
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/aws" {
  version     = "3.53.0"
  constraints = ">= 2.0.0"
  hashes = [
    "h1:oRCCzfwGCDNyuhIJ8kCg0N7h4W2WESm37o2GIt0ETpQ=",
    "zh:35a77c79170b0cf3fb7eb835f3ce0b715aeeceda0a259e96e49fed5a30cf6646",
    "zh:519d5470a932b1ec9a0fe08876c5e0f0f84f8e506b652c051e4ab708be081e89",
    "zh:58cfa5b454602d57c47acd15c2ad166a012574742cdbcf950787ce79b6510218",
    "zh:5fc3c0162335a730701c0175809250233f45f1021da8fa52c73635e4c08372d8",
    "zh:6790f9d6261eb4bd5cdd7cd9125f103befce2ba127f9ba46eef83585b86e1d11",
    "zh:76e1776c3bf9568d520f78419ec143c081f653b8df4fb22577a8c4a35d3315f9",
    "zh:ca8ed88d0385e45c35223ace59b1bf77d81cd2154d5416e63a3dddaf0def30e6",
    "zh:d002562c4a89a9f1f6cd8d854fad3c66839626fc260e5dde5267f6d34dbd97a4",
    "zh:da5e47fb769e90a2f16c90fd0ba95d62da3d76eb006823664a5c6e96188731b0",
    "zh:dfe7f33ec252ea550e090975a5f10940c27302bebb5559957957937b069646ea",
    "zh:fa91574605ddce726e8a4e421297009a9dabe023106e139ac46da49c8285f2fe",
  ]
}

provider "registry.terraform.io/hashicorp/random" {
  version     = "3.1.0"
  constraints = "3.1.0"
  hashes = [
    "h1:BZMEPucF+pbu9gsPk0G0BHx7YP04+tKdq2MrRDF1EDM=",
    "zh:2bbb3339f0643b5daa07480ef4397bd23a79963cc364cdfbb4e86354cb7725bc",
    "zh:3cd456047805bf639fbf2c761b1848880ea703a054f76db51852008b11008626",
    "zh:4f251b0eda5bb5e3dc26ea4400dba200018213654b69b4a5f96abee815b4f5ff",
    "zh:7011332745ea061e517fe1319bd6c75054a314155cb2c1199a5b01fe1889a7e2",
    "zh:738ed82858317ccc246691c8b85995bc125ac3b4143043219bd0437adc56c992",
    "zh:7dbe52fac7bb21227acd7529b487511c91f4107db9cc4414f50d04ffc3cab427",
    "zh:a3a9251fb15f93e4cfc1789800fc2d7414bbc18944ad4c5c98f466e6477c42bc",
    "zh:a543ec1a3a8c20635cf374110bd2f87c07374cf2c50617eee2c669b3ceeeaa9f",
    "zh:d9ab41d556a48bd7059f0810cf020500635bfc696c9fc3adab5ea8915c1d886b",
    "zh:d9e13427a7d011dbd654e591b0337e6074eef8c3b9bb11b2e39eaaf257044fd7",
    "zh:f7605bd1437752114baf601bdf6931debe6dc6bfe3006eb7e9bb9080931dca8a",
  ]
}
```

With this dependency lock, downgrade of the provider version below 2.0.0 is not permissible. 

lets downgrade the provider version to 1.8.0

```bash
# Terraform Provider

terraform {
    required_version = "~> 1.0.0"
    required_providers {
        aws = {
           source  = "hashicorp/aws"
           version =  ">= 1.8.0"
    }
    # Random Provider
        random = {
           source = "hashicorp/random"
           version = "3.1.0"
    }
}
}
```

Ass expected, it uses the dependency lock file. This means the provider is locked to specific version.

```bash
:~/Iac-on-AWS-with-Terraform/dependency_lock_file$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Reusing previous version of hashicorp/random from the dependency lock file
- Using previously-installed hashicorp/aws v3.53.0
- Using previously-installed hashicorp/random v3.1.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### Override the dependency lock file

Use the -**upgrade** flag to override the dependency lock filet

```bash
terraform init -upgarde
```

### output

```bash
:~/Iac-on-AWS-with-Terraform/dependency_lock_file$ terraform init -upgrade

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/random versions matching "3.1.0"...
- Finding hashicorp/aws versions matching ">= 1.8.0"...
- Using previously-installed hashicorp/random v3.1.0
- Using previously-installed hashicorp/aws v3.53.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```