#!/bin/bash

# This script is used to create workspace for terraform-workspace/workspace

echo "Hint: Use space to separate the workspace' names"
IFS= read -p "Enter the workspace' names or press ctr + c to quit: " -ra file_name

echo "You entered: ${file_name[@]}"

quit()
{
    exit
}

workspace_exists()
{
    workspace=( $(terraform workspace list) )
    default=*
    exist_workspace=()
    for values in "${workspace[@]}"
    do
        [[ "$values" != * ]] && exist_workspace+=("$default") || exist_workspace+=("$values")
    done
    workspace=("${exist_workspace[@]}")
    unset exist_workspace

    for i in "${workspace[@]}"
    do
        for k in "${file_name[@]}"
        do
            [[ $i == $k ]] && echo "Provisioner $k already exists" && quit
        done
        [[ $i == "$1" ]] && return 0
    done
}

workspace_exists

echo "Creating workspace ${file_name[@]} ..."

create_workspace(){
    echo "...Creating terraform worspace ${fine_name[@]}"

    for i in ${file_name[@]}
    do
        $(terraform workspace new $i)
    done
}
create_workspace
quit