#!/bin/bash

# if input parameter opperation is equal to install then run this code
if [ $1 == "install" ]
then
    # Run terraform init
    cd ./terraform
    terraform init --upgrade
    # Run terraform plan
    terraform plan -out=plan.out
    # Run terraform apply
    terraform apply -auto-approve plan.out
    ip_address=$(cat ip.txt)
    cat $ip_address
    cd ..

# else if the command is destroy then run this code
elif [ $1 == "destroy" ]
then
    # Run terraform destroy
    cd ./terraform
    terraform destroy -auto-approve
    cd ..
fi
