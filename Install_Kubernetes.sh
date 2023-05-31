#!/bin/bash


#Install Kubernetes:
#1. Install docker and start docker (systemctl start docker)
#2. Install Kubectl
log_datetime="\n~~~`date`~~~"
echo -e "$log_datetime: Creating DOCKER working folder as $HOME/Docker"
mkdir $HOME/Docker

cd $HOME/Docker

echo -e "$log_datetime: Installing Docker set up.... on `pwd`\n"
yum install docker -y
systemctl enable docker
systemctl start docker
service docker status
sleep 3

echo -e "$log_datetime: Creating Kubernetes working folder as $HOME/Kubernetes"
mkdir $HOME/Kubernetes

cd $HOME/Kubernetes

echo -e "$log_datetime: Installing Kubernetes set up.... on `pwd`\n"

echo -e "$log_datetime: Download the latest release"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

echo -e "$log_datetime: Make the kubectl binary executable"
chmod +x ./kubectl

echo -e "$log_datetime: Move the binary in to your PATH"
mv ./kubectl /usr/local/bin/kubectl

echo -e "$log_datetime: Check version"
kubectl version --client

echo -e "$log_datetime: Minikube install"

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& chmod +x minikube \
&& sudo mv minikube /usr/local/bin/

echo -e "$log_datetime: minikube version"

echo -e "$log_datetime: Start minikube with docker driver"

minikube start --driver=docker --force

echo -e "$log_datetime: Check status"
minikube status
kubectl get pods
kubectl get svc

echo -e "$log_datetime: ########### END OF SCRIPT- $0 ##########"
