#!/bin/bash
cd /var/www/html

if [ ! -d wp-admin ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  ./wp-cli.phar core download --allow-root
fi

if [ ! -f wp-config.php ]; then
  ./wp-cli.phar config create \
  --dbname=$DB_NAME \
  --dbuser=$DB_USER\
  --dbpass=$db_password \
  --dbhost=$DB_HOST \
  --allow-root
fi

if ! ./wp-cli.phar core is-installed --allow-root; then
  ./wp-cli.phar core install \
  --url= $DOMAIN_NAME \
  --title=inception \
  --admin_user=$ADMIN \
  --admin_password=$(cat /run/secrets/db_root_password) \
  --admin_email=$ADMIN_EMAIL \
  --allow-root \

  ./wp-cli.phar user create $USER $USER_EMAIL \
    --role=subscriber \
    --user_pass=$(cat /run/secrets/db_password) \ 
    --allow-root
fi


sleep 10

mkdir -p /run/php

php-fpm7.4 -F