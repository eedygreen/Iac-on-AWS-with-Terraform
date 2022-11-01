#!/bin/bash

# This script is used to create provisioners for terraform-workspace/provisioners

echo "Hint: Use space to separate the provisioners' names"
IFS=' ' read -p "Enter the provisioners' names or press ctr + c to quit: " -ra file_name

echo "You entered: ${file_name[@]}"

quit()
{
    exit
}

workspace_exists()
{
    provisioners=( $(terraform workspace list) )
    default=*
    exist_provisioner=()
    for values in "${provisioners[@]}"
    do
        [[ "$values" != * ]] && exist_provisioner+=("$default") || exist_provisioner+=("$values")
    done
    provisioners=("${exist_provisioner[@]}")
    unset exist_provisioner

    for i in "${provisioners[@]}"
    do
        for k in "${file_name[@]}"
        do
            [[ $i == $k ]] && echo "Provisioner $k already exists" && quit
        done
        [[ $i == "$1" ]] && return 0
    done
}

workspace_exists

echo "Creating provisioners ${file_name[@]} ..."

create_provisioners(){
    echo "...Creating terraform worspace for provisioner ${fine_name[@]}"

    for i in ${file_name[@]}
    do
        $(terraform workspace new $i)
    done
}
create_provisioners
quit