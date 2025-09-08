#!/bin/bash
# Update system and install nginx
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Hello from Auto Scaling NGINX Server</h1>" > /var/www/html/index.html
