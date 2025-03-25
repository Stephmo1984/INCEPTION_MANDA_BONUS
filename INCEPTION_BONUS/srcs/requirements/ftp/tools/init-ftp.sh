#!/bin/sh

# Créer l'utilisateur FTP
adduser --disabled-password --gecos "" $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

# Donner les droits au dossier WordPress
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/wordpress

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER

echo "✅ FTP Server is running..."
exec "$@"
