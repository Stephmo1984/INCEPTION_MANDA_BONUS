# PULL Debian Buster image
FROM debian:buster

# Définir le port FTP
EXPOSE 21 30000-30009

# Installer vsftpd
RUN apt update && apt install -y vsftpd \
    && apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copier le fichier de configuration vsftpd
COPY ./tools/vsftpd.conf /etc/vsftpd.conf

# Copier le script d'initialisation
COPY ./tools/init-ftp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-ftp.sh

# Créer le répertoire utilisateur
RUN mkdir -p /home/$FTP_USER/wordpress \
    && chmod -R 755 /home/$FTP_USER \
    && chown -R nobody:nogroup /home/$FTP_USER/wordpress

# Lancer le serveur FTP
ENTRYPOINT ["/usr/local/bin/init-ftp.sh"]
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]


#ENTRYPOINT [ "/setup.sh" ]

# FROM debian:buster

# RUN apt update -y

# RUN apt install vsftpd -y

# COPY ./tools/script.sh /

# CMD ["/script.sh"]