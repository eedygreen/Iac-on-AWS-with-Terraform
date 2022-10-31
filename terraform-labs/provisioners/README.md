# Provisioners

### Terraform provisioners are used to execute commands

## Directory Structure

*Scripts*
- select_provisioners
- create_provisioners

| use the select_provisioner script to switch
| use the create_provisioner script to create workspace

Terraform file
- main.tf
- file_provisioner
- remote_provisioner


### Connection
you can ssh into the instance using the connection defined with the public ip

`ssh -i "/home/ubuntu/file.txt" ubuntu@public_ip`

check the destination file
`cat file.txt`

after second conection 

`ls` to view the number files created