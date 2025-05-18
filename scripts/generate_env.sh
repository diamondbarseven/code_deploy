#!/bin/bash
set -e

# AWS CLIが使える環境が前提
export URL_IMPORT_FF_API=$(aws ssm get-parameter --name "URL_IMPORT_FF_API" --with-decryption --query "Parameter.Value" --output text --region ap-northeast-1)
export S3_BUCKET_FULFILLMENT=$(aws ssm get-parameter --name "S3_BUCKET_FULFILLMENT" --with-decryption --query "Parameter.Value" --output text --region ap-northeast-1)

# config ディレクトリがなければ作成
mkdir -p /var/www/html/config

cat << EOF > /var/www/html/config/environments.php
<?php
/**
 * Setting for fulfillment
 */
define('URL_IMPORT_FF_API', '${URL_IMPORT_FF_API}');
define('S3_BUCKET_FULFILLMENT', '${S3_BUCKET_FULFILLMENT}');
EOF
