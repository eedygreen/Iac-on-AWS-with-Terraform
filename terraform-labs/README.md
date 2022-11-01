# Remote State

You’ve learned a lot about state so far. You’ve learned that Terraform state is a mapping of infrastructure resources in a Terraform project. You’ve learned that this state is kept by Terraform in a local file, but it can also be saved remotely. You also learned how to inspect state, and import resources into Terraform.

There are some situations when you may have to manipulate state. You may need to move a resource from one address to another. Or, you may want to move resources from one place to another within your configuration. In this lesson, you will learn several techniques for manipulating state in cases like this.

Specifically, in this lab you will get some practice working with these commands:

terraform plan/apply -replace="<ADDRESS>" - force Terraform to replace a resource. Can use during plan and apply to see see how it will affect your configuration.
terraform untaint - removes the tainted flag on a resource.
terraform mv - move a resource to a new address within the Terraform state file.
terraform rm - remove a resource from Terraform state.
terraform state replace-provider - move a project's resources to a new provider.
Let’s get into it!

The Replace Command
Some cloud resources can become degraded, or failed. For example, an EC2 instance can become unresponsive for a number of reasons. Terraform might detect this automatically during a plan or apply by reading the resource state.

However, you may detect there is a problem before Terraform does. If you do, you can use the terraform plan/apply -replace=”” flag to inform Terraform that the resource needs to be replaced.

Note: the terraform taint command is the predecessor to the terraform plan/apply -replace=”” command. However, the taint command has been deprecated as of Terraform v0.15.2. The reason why terraform taint was deprecated is because it allowed multiple users to make new plans against a tainted object that may conflict with each other.

Here’s how to use the terraform plan/apply -replace=”” command:

# first, create a plan 
$ terraform plan -replace="aws_instance.web_server"

...output

# then, apply the plan
$ terraform apply -replace="aws_instance.web_server"

...output
The Untaint Command
While the terraform taint command has been deprecated, Terraform can still mark resources as tainted on its own. If Terraform fails to complete a multi-step create action, and doesn’t know the accurate state of the resource, it will make the resource as tainted.

Whatever the case, if you do find that a resource is marked as tainted incorrectly, you can use the terraform untaint command to correct the situation.

$ terraform untaint [options] address

..output
The Move Command
We know that Terraform state tracks where things are via an address space. There may be situations that you want to move resources to different address locally in the state file. For example:

You want to change the name of a resource block.
You want to move a resource into a module.
Let’s work through an example. Let’s say that you have a server with the current address of aws_instance.web_server. You realize you made a mistake; this is actually the application server. You want the address to be aws_instance.app_server.

To make this correction, you can run this command:

$ terraform state mv aws_instance.web_server aws_instance.app_server

...output
The Remove Command
There may be times that you want Terraform to forget about something. Maybe a resource failed, and you no longer need it. Maybe a resource was accidentally deleted, and you wish to start over. Maybe you just don’t want the resource to be managed by Terraform.

Whatever the case, you can use the terraform state rm command to get the job done.

# command format
$ terraform state rm [options] ADDRESS

# command example
$ terraform state rm aws_instance.web_server
This command will just remove the resource from state. If you still have the resource block in your configuration files, and run a plan or apply, the resource will be created again. Be aware of naming conflicts; if you remove a resource that still exists, and then run apply, you could have remote naming conflict.

The Replace Provider Command
This terraform state replace-provider command is used to change the source of a provider in a project. There are a couple use cases for this:

You are upgrading Terraform and need to update the provider as well. Some Terraform version upgrades will require this step.
You are going to use a different version of the provider.
# the command format
$ terraform state replace-provider [options] FROM_PROVIDER_FQN TO_PROVIDER_FQN

# example command (per terraform.io docs)
$ terraform state replace-provider hashicorp/aws registry.acme.corp/acme/aws