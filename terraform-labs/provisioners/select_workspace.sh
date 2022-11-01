#!/bin/bash

# This script is used to select provisioners for terraform workspace/provisioners

IFS= read -rp "Enter the provisioner's name or press ctr +c to quit: " name 

echo "You entered: $name"

current_workspace()
{
     workspace=( $(terraform workspace show) )
     echo "Current workspace is $workspace"
     if [[ $workspace == "$name" ]]
     then
         echo "You are already in $name workspace"
         exit
     fi
}

current_workspace

echo "Selecting workspace $name ..."

select_workspace()
{
    terraform workspace select $name
}

quit()
{
    exit
}

select_workspace
quit
