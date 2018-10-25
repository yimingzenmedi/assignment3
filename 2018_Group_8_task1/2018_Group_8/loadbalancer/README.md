# Group 8 Assignment 2

## Load Balancer

1. Create manager instance.

   ```gcloud beta compute instances create manager-instance --zone=australia-southeast1-b --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --scopes=https://www.googleapis.com/auth/cloud-platform --image=ubuntu-1604-xenial-v20180912 --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard```

1. Run this scripts.

   `sudo su`
 
   `cd ~`

   `apt -y install unzip`

   `unzip ~/2018_Group_8_task1.zip`

   `bash ~/2018_Group_8/loadbalancer/install.sh`
