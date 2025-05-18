#!/bin/bash

MESSAGE=$(aws ssm get-parameter --name "/MESSAGE" --with-decryption --query "Parameter.Value" --output text --region ap-northeast-1)
cp /var/www/html/index.html /var/www/html/index.html.bak
sed -i "s|__MESSAGE__|$MESSAGE|g" /var/www/html/index.html
