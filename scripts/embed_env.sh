#!/bin/bash

# SSMからパラメータを取得（例: /myapp/env/MESSAGE というキー）
MESSAGE=$(aws ssm get-parameter --name "/MESSAGE" --with-decryption --query "Parameter.Value" --output text --region ap-northeast-1)

# HTMLファイルのコピーをテンプレートとして編集
cp /var/www/html/index.html /var/www/html/index.html.bak

# プレースホルダー __MESSAGE__ を環境変数の値で置き換え
sed -i "s|__MESSAGE__|$MESSAGE|g" /var/www/html/index.html
