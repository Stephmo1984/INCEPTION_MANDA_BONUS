#!/bin/sh

echo "➡️ Initializing FTP"

# CREATE USER FTP
adduser --disabled-password --gecos "" $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

# GIVE RIGHT TO USER FOR WORDPRESS FILE
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/wordpress

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER

# for user $FTP_USER (1000) 
chown -R 1000:1000 /home/$FTP_USER/wordpress

echo "✅ FTP "
exec "$@"
