#!/bin/sh

# Initialize MySQL database installation
mysql_install_db

# Start MySQL service
service mysql start

if [ -d "var/lib/mysql/$MYSQL_DATABASE_NAME" ]
then
	echo "Database already exists"
else

# Secure installation of MySQL
mysql_secure_installation << _EOF_

Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
n
Y
Y
_EOF_

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;"

mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER_NAME'@'%';"

mysql -e "FLUSH PRIVILEGES;"

fi

# Stop MySQL service
service mysql stop

exec "$@"

