apt update
echo mysql-server-5.7 mysql-server/root_password password root | debconf-set-selections
echo mysql-server-5.7 mysql-server/root_password_again password root | debconf-set-selections
apt-get -y install mysql-server-5.7
ufw allow mysql
systemctl start mysql
