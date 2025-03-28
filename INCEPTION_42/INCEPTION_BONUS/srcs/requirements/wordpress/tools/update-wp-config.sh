#!/bin/sh

sleep 10

if [ -f /var/www/wordpress/wp-config.php ]
then
	echo "✅ Worpress config file already exists"
else
	echo "🚧  Modify config wordpress wp-config.php "

	sed -i "s/database_name_here/$MYSQL_DATABASE_NAME/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/username_here/$MYSQL_USER_NAME/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/password_here/$MYSQL_USER_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/localhost/$MYSQL_DATABASE_HOST/g" /var/www/wordpress/wp-config-sample.php
	cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
	
	cd /var/www/wordpress
	
	echo "🚧 Init WordPress with CLI"	
	wp core install --url=$DOMAIN_NAME \
	--title=$WORDPRESS_TITLE \
	--admin_user=$WORDPRESS_ADMIN_USER \
	--admin_password=$WORDPRESS_ADMIN_PASSWORD \
	--admin_email=$WORDPRESS_ADMIN_EMAIL \
	--allow-root
	
	wp user create $WORDPRESS_USER \
	$WORDPRESS_USER_EMAIL \
	--role=author \
	--user_pass=$WORDPRESS_USER_PASSWORD \
	--allow-root
fi

chown root:root /var/www/wordpress/wp-content

# --------------- FOR REDIS-CACHE BONUS --------------------------
echo "🚧 WORDPRESS UPDATE FOR REDIS_CACHE"

cd /var/www/wordpress

wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp redis enable --allow-root

chown -R www-data:www-data /var/www/html

echo "✅ WORDPRESS UPDATED FOR REDIS_CACHE"
# ------------------------------------------------------------------

exec "$@"
