#!/bin/bash

REGION="sa-east-1"
ACCOUNT_NUMBER=374120343751

sudo apt install docker.io -y
sudo usermod -a -G docker ubuntu

# sudo stress-ng --cpu 32 --timeout 180 --metrics-brief
# subida de aplicacao em aplicacao web acesso via ALB

sudo aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID --profile default
sudo aws configure set --profile default
aws configure set aws_secret_access_key $AWS_ACCESS_KEY_SECRET --profile default
sudo aws configure set region $REGION --profile default
sudo aws configure set output $OUTPUT --profile default

sudo aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com
sudo docker tag sample-nodejs-app:latest $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/sample-nodejs-app:latest
sudo docker pull $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/sample-nodejs-app:latest
sudo docker push $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/sample-nodejs-app:latest
sudo docker run -p 80:3000 $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/sample-nodejs-app