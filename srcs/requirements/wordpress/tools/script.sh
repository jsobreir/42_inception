#!/bin/bash
set -ex

if [ ! -f /var/www/html/wp-config.php ]; then
  mv /tmp/wp-config.php /var/www/html/
  chown www-data:www-data /var/www/html/wp-config.php
fi
# Download wp-cli.phar if not present and WordPress core if not installed
if [ ! -f /usr/local/bin/wp ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -d wp-admin ]; then
  wp core download --allow-root
fi

# Create wp-config.php if it doesn't exist
if [ ! -f wp-config.php ]; then
  wp config create \
  --dbname="$WORDPRESS_DB_NAME" \
  --dbuser="$WORDPRESS_DB_USER" \
  --dbpass="$WORDPRESS_DB_PASSWORD" \
  --dbhost="$WORDPRESS_DB_HOST" \
  --allow-root
fi

# Install WordPress if not already installed
if ! wp core is-installed --allow-root; then
  wp core install \
  --url="$DOMAIN_NAME" \
  --title="inception" \
  --admin_user="$WORDPRESS_ADMIN_USER" \
  --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
  --admin_email="$WORDPRESS_ADMIN_EMAIL" \
  --allow-root # Added --allow-root back

  wp user create "$WORDPRESS_DB_USER" "$WORDPRESS_DB_USER_EMAIL" \
    --role="$WORDPRESS_ROLE" \
    --user_pass="$WORDPRESS_DB_PASSWORD" \
    --allow-root # Added --allow-root back
fi

mkdir -p /run/php
chown www-data:www-data /run/php

exec "$@"