#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
echo 'Piloto biruta' > /var/www/html/index.html
service httpd start

sudo apt-get install -y stress-ng

sudo apt  install docker.io

# sudo stress-ng --cpu 32 --timeout 180 --metrics-brief

# subida de aplicacao em aplicacao web acesso via ALB
