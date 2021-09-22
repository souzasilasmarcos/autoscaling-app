#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
echo 'Piloto biruta' > /var/www/html/index.html
service httpd start

sudo apt-get install -y stress-ng

# sudo stress-ng --cpu 32 --timeout 180 --metrics-brief

# subida de aplicacao em container

docker push 374120343751.dkr.ecr.sa-east-1.amazonaws.com/sample-nodejs-app:latest

docker run -p 80:3000 sample-nodejs-app