# OVERIDE VARIABLES during terraform plan and or terraform apply
### For the planning stage, change the variables for instance and count

```terraform plan -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3"```

### For the apply stage, change the variables for the instance and count
```terraform apply -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3"```

### Generate output plan 

```terraform plan -var="ec2_instance_type=t3.medium" -var="ec2_instance_count=3"  -out change.plan```

### Apply the plan with changed variables

```terraform apply change.plan```

| Note: variable overriding add the new values to the default value
| i.e if the default value is 1 with supply value of 3, the output will be 4