#!/bin/bash
sudo systemctl start nginx
cd /usr/local/wops-demo-web-app
sudo npm install
sudo npm start