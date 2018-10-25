#!/bin/sh
echo -e "\n\n" | gcloud compute config-ssh --ssh-key-file=.ssh/id_rsa
apt update
apt-get install -y software-properties-common
echo -e "\n" | apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible
apt-get install -y python-pip
pip install apache-libcloud
pip install git+https://github.com/ansible/ansible.git@stable-2.7
mv ~/2018Group9-ITEM3/2018_Group_9 ./
mv ~/2018Group9-ITEM3/task3_backup.yml ./
mv ~/2018Group9-ITEM3/task3_rollback.yml ./
export ANSIBLE_HOST_KEY_CHECKING=False
