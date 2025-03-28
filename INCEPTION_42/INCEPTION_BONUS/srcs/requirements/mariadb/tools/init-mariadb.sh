#!/bin/bash

echo "➡️ Initializing MySQL database"

service mariadb start;

# WAIT MY SQL IS READY
until mysqladmin ping --silent; do
    echo "⏳ Waiting for MySQL to be ready"
    sleep 3
done

# CREATE DATABASE WITH msql IF NOT EXIST ALREADY
if [ -d "/var/lib/mysql/$MYSQL_DATABASE_NAME" ]; then
    echo "✅ Database '$MYSQL_DATABASE_NAME' already exists."
else
    echo "🚧  Creating database '$MYSQL_DATABASE_NAME'"
    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;"
    
    echo "🚧  Creating user '$MYSQL_USER_NAME'"
    mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
    
    echo "🚧  Granting privileges"
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER_NAME'@'%';"
    
	echo "🚧  alter user root"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
   
    mysql -e "FLUSH PRIVILEGES;"
fi

# STOP MySQL TO RESTART WITH CMD
echo " Stopping MySQL service"

mysqladmin shutdown -u root

exec "$@"