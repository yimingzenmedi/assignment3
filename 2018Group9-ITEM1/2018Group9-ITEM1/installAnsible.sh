#!/bin/sh
echo -e "\n\n" | gcloud compute config-ssh --ssh-key-file=.ssh/id_rsa
apt update
apt-get install -y software-properties-common
echo -e "\n" | apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible
apt-get install -y python-pip
pip install apache-libcloud
mv ~/2018Group9-ITEM1/2018_Group_9 ./
mv ~/2018Group9-ITEM1/task3.yml ./
mv ~/2018Group9-ITEM1/task3_test.yml ./
export ANSIBLE_HOST_KEY_CHECKING=False