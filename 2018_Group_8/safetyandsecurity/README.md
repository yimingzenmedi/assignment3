# Assignment2

## Safety and Security

In this part, we will do several things to make our web security and data safety.

* Daily database backup;
* Set up anonymous user permissions in MediaWiki;
* Use reCAPTCHA v2 to avoid bots or scripts signing up;
* HTTPS(SSL/TLS) encryption (with a self-signed ceritificatation)
* Access control of database

First, we use the two simple instances to show the reCAPTCHA 

1. Create manager instance(if you have already had one, ignore it).

   ```gcloud beta compute instances create manager-instance --zone=australia-southeast1-b --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --scopes=https://www.googleapis.com/auth/cloud-platform --image=ubuntu-1604-xenial-v20180912 --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard```

1. Run this scripts.

   `sudo su`
 
   `cd ~`

   `apt -y install unzip`

   `unzip ~/2018_Group_8_task3.zip`

   `bash ~/2018_Group_8/safetyandsecurity/install.sh`

1. Then, open the browser, and click "Create account", you can see the reCAPTCHA