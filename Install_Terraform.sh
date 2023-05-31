#!/bin/bash


log_datetime="\n~~~`date`~~~"
echo -e "$log_datetime: Creating Terraform working folder as $HOME/Terraform"
mkdir $HOME/Terraform

cd $HOME/Terraform

echo -e "$log_datetime: Installing TERRAFORM set up.... on `pwd`\n"
sleep 3

sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

echo -e "$log_datetime: Checking terraform version to validate proper installation\n"
terraform -v

echo -e "$log_datetime: TERRAFORM installation completed by using $0 on  `hostname -f` at `date`.\n"
echo -e "$log_datetime: ######END of script $0#######"
