apt -y install software-properties-common
apt -y update
apt -y install python-pip
pip install paramiko PyYAML Jinja2 httplib2 six apache-libcloud google-auth
pip install git+https://github.com/ansible/ansible.git@stable-2.7

gcloud services enable sqladmin.googleapis.com
# enable SQL API
gcloud services enable iam.googleapis.com
# enable creditional API
f=`gcloud iam service-accounts list --filter=Compute`
serviceaccount=${f##* }
echo $serviceaccount
gcloud iam service-accounts keys create ~/key.json --key-file-type=json --iam-account $serviceaccount

if [ ! -e ~/.ssh/id_rsa.pub ];then
  echo RSA key not exists, generating RSA key.
  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa # Generate an SSH key if not exists.
else
  echo RSA key already exists
fi

gcloud compute config-ssh --ssh-key-file=~/.ssh/id_rsa # To upload SSH key.

httprule=`gcloud compute firewall-rules list --filter="name~'default-allow-http'" --format=json`
if [ "$httprule" = "[]" ];then
  gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server
  echo "Successfully created the firewall rules."
else
  echo "Firewall rule for allow http already exists."
fi

httpsrule=`gcloud compute firewall-rules list --filter="name~'default-allow-https'" --format=json`
if [ "$httpsrule" = "[]" ];then
  gcloud compute firewall-rules create default-allow-https --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:443 --source-ranges=0.0.0.0/0 --target-tags=https-server
  echo "Successfully created the firewall rules."
else
  echo "Firewall rule for allow https already exists."
fi

echo "Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  LogLevel ERROR" > ~/.ssh/config

database="mwdb"

ansible-playbook ~/2018_Group_8/safetyandsecurity/main.yml --extra-vars "database_name=$database"

echo -e "\033[44;37mAnd we have a backup of our database:\033[0m"
gcloud sql backups list --instance $database