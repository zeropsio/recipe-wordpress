#!/bin/sh
if ! mysql -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" -h"$WORDPRESS_DB_HOST" -e "SHOW DATABASES LIKE '$WORDPRESS_DB_NAME';" | grep -q "$WORDPRESS_DB_NAME"; then
  mysql -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" -h"$WORDPRESS_DB_HOST" -e "CREATE DATABASE \`$WORDPRESS_DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
else
  echo "Database $WORDPRESS_DB_NAME already exists. Skipping."
fi

if ! $(wp core is-installed --allow-root); then
  wp core install --allow-root --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL"
else
  echo "Wordpres core already installed."
fi

wp theme activate twentytwentyfour
