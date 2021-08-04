# provider.tf

## Terraform Providers Block

**required_providers block**

The required_providers downloads all the plugins that is required and does not need required_version. The required_version is the terraform cli which is independent on required_providers.

```bash
terraform {
required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}
```

### Apply the configuration

```bash
terraform iniit
```

### Output

```bash
:~/Documents/terraform$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 3.0"...
- Installing hashicorp/aws v3.52.0...
- Installed hashicorp/aws v3.52.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### Multiple providers can be added using the **terraform random provider**

```bash
terraform {
required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
        # use random provider
        random = {
            source = "hashicorp/random"
            version = "3.1.0"
    }
    }
}
```

### Validate the configuration

```bash
terraform validate
```

### Output

```bash
:~/Documents/terraform$ terraform validate
Success! The configuration is valid.
```

### Initialize the configuration with random provider

```bash
terraform init
```

### Output: There are two providers, 3.10. and 3.52.0

```bash
terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Finding hashicorp/random versions matching "3.1.0"...
- Using previously-installed hashicorp/aws v3.52.0
- Installing hashicorp/random v3.1.0...
- Installed hashicorp/random v3.1.0 (signed by HashiCorp)

Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Check the downloaded plugins

```bash
:~/Documents/terraform$ ls .terraform/providers/registry.terraform.io/hashicorp/
aws/    random/
:~/Documents/terraform$ #ls .terraform/providers/registry.terraform.io/hashicorp/aws/3.52.0/linux_amd64/terraform-provider-aws_v3.52.0_x5
:~/Documents/terraform$ #ls .terraform/providers/registry.terraform.io/hashicorp/random/3.1.0/linux_amd64/terraform-provider-random_v3.1.0_x5
```

## Upgrade and Downgrade of terraform plugins

```bash
terraform init -upgrade
```

Upgrading the previous versions

```bash
terraform {
required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.2, < 3.7"
        }
        # use random provider
        random = {
            source = "hashicorp/random"
            version = "3.1.0"
    }
    }
}
```

Apply the changes

```bash
terraform init -upgrade
```

### Output

```bash
:~/Documents/terraform$ terraform init -upgrade
Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 3.2, < 3.7.0"...
- Finding hashicorp/random versions matching "3.1.0"...
- Installing hashicorp/aws v3.6.0...
- Installed hashicorp/aws v3.6.0 (signed by HashiCorp)
- Using previously-installed hashicorp/random v3.1.0

Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### Upgraded

```bash
:~/Documents/terraform$ ls .terraform/providers/registry.terraform.io/hashicorp/random/3.1.0/linux_amd64/terraform-provider-random_v3.1.0_x5 
:~/Documents/terraform$ ls .terraform/providers/registry.terraform.io/hashicorp/aws/
3.52.0  3.6.0
```

Note: there are two (3.52.0 & 3.6.0) versions currently on aws provider directory. One of the version specified was lower than the current version. Since the variance is greater than the previous version, it upgraded the plugin to 3.6.0. Let see whats happen when I change ~> 3.2 < 3.6 to ~> 3.7, < 3.9

```bash
terraform {
  required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.7, < 3.9"
        }
        # use random provider
        random = {
            source = "hashicorp/random"
            version = "3.1.0"
    }
    }

}
```

```bash
# apply the changes

terraform init -upgrade
```

```bash
:~/Documents/terraform$ terraform init -upgrade

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/random versions matching "3.1.0"...
- Finding hashicorp/aws versions matching "~> 3.7, < 3.9.0"...
- Using previously-installed hashicorp/random v3.1.0
- Installing hashicorp/aws v3.8.0...
- Installed hashicorp/aws v3.8.0 (signed by HashiCorp)

Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

**Terraform upgraded to 3.8.0**

```bash
:~/Documents/terraform$ ls .terraform/providers/registry.terraform.io/hashicorp/aws/
3.52.0  3.6.0  3.8.0
```

### Downgrade

```bash
terraform {
  required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.3, < 3.4"
        }
        # use random provider
        random = {
            source = "hashicorp/random"
            version = "3.1.0"
    }
    }

}
```

**Apply the changes**

```bash
terraform init -upgrade
```

**Output**

```bash
:~/Documents/terraform$ terraform init -upgrade

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/random versions matching "3.1.0"...
- Finding hashicorp/aws versions matching "~> 3.3, < 3.4.0"...
- Installing hashicorp/aws v3.3.0...
- Installed hashicorp/aws v3.3.0 (signed by HashiCorp)
- Using previously-installed hashicorp/random v3.1.0

Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Downgraded to 3.3

```bash
:~/Documents/terraform$ ls .terraform/providers/registry.terraform.io/hashicorp/aws/
3.3.0  3.52.0  3.6.0  3.8.0
```

**Note: There are multiple terraform provider versions** 

 What current version is in use?  - The last upgraded version

use the command below to verify

```bash
terraform --version
```

### Output

```bash
:~/Documents/terraform$ terraform --version
Terraform v1.0.3
on linux_amd64
+ provider registry.terraform.io/hashicorp/aws v3.3.0
+ provider registry.terraform.io/hashicorp/random v3.1.0
```