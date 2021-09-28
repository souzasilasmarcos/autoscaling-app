q#!/bin/bash

REGION="sa-east-1"
ACCOUNT_NUMBER=374120343751

sudo apt-get update

sudo apt install docker.io -y

# sudo stress-ng --cpu 32 --timeout 180 --metrics-brief
# subida de aplicacao em aplicacao web acesso via ALB

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com

docker tag sample-nodejs-app:latest $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/sample-nodejs-app:latest

docker pull $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/sample-nodejs-app:latest

docker push $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/sample-nodejs-app:latest

docker run -p 80:3000 $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/sample-nodejs-app
