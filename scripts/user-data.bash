#!/bin/bash

## Install Code Deploy Agent
apt update
apt install ruby-full -y
apt install wget
cd ~
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
systemctl start codedeploy-agent


# Install Node.js Runtime
cd ~
curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs -y

# Install and Configure Nginx
apt install nginx -y 
unlink /etc/nginx/sites-enabled/default
touch /etc/nginx/sites-available/reverse-proxy.conf
echo "server {
        listen 80;
        listen [::]:80;
        location / {
                    proxy_pass http://127.0.0.1:3000;
  }
}"  > /etc/nginx/sites-available/reverse-proxy.conf

ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
systemctl restart nginx
