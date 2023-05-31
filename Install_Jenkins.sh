#!/bin/bash


log_datetime="\n~~~`date`~~~"
echo -e "$log_datetime: Creating Jenkins working folder as $HOME/Jenkins"
mkdir $HOME/Jenkins

cd $HOME/Jenkins

echo -e "$log_datetime: Installing Jenkins set up.... on `pwd`\n"
sleep 3


sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#yum install java-11-openjdk
amazon-linux-extras install java-openjdk11
yum install jenkins

systemctl enable jenkins
systemctl start jenkins

echo -e "$log_datetime: ########END OF SCRIPT- $0 ##########"
