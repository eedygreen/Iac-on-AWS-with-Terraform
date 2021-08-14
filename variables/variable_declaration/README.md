# OVERIDE VARIABLES with terraform plan and or terraform apply
### For the planning stage, change the variables for instance and count

```terraform plan -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3"```

### For the apply stage, change the variables for the instance and count
```terraform apply -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3"```

### Generate output plan 

```terraform plan -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3"  -out change.plan```

### Apply the plan with changed variables

```terraform apply change.plan```

# OVERIDE VARIABLES WITH ENVIRONMENTAL VARIABLES
```export TF_VAR_ec2_instance_type=t3.medium```
```export TF_VAR_ec2_instance_count=1```

**Test the exported variables**
```echo $TF_VAR_ec2_instance_type, $TF_VAR_ec2_instance_count```

### Unset the enviromental variables
```unset TF_VAR_ec2_instance_type=t3.medium```
```unset TF_VAR_ec2_instance_count=1```

# VARIABLE DECLARATION, check the variables.tf file

# terraform.tfvars overides other variables, such as the one in variables.tf file
- If the terraform.tfvars file is present terraform auto-load it and overide the default values from variable.tf file.

- Other names with *.tfvars requires explicit argument when terraform planning and or applying. e.g web.tfvars, dev.tfvars, stage.tfvars, prod.tfvars
```terraform plan -var-file="dev.tfvars"```
```terraform apply -var-file="dev.tfvars"```

# Auto Load Input variables with .auto.tfvars
- .auto.tfvars is loaded during the configuraiton and overides any other variable file, including terraform.tfvars. With this the var-file command line argument is not required. The above var files can be named as the following; web.auto.tfvars, dev.auto.tfvars, stage.auto.tfvars, prod.auto.tfvars.
```terraform init```
```terraform plan```
```terraform apply```
