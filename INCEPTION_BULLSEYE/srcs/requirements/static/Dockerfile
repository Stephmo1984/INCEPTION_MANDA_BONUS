
# FROM debian:bullseye
# RUN apt-get update -y && apt-get upgrade -y
# RUN apt-get install -y nginx
# COPY ./html /var/www/html
# COPY ./conf/setup.sh /
# RUN chmod +x /setup.sh && /setup.sh
# ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

FROM debian:bullseye

# Installer Nginx sans les fichiers inutiles
RUN apt-get update -y && apt-get install -y nginx --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Copier le contenu statique
COPY ./html /var/www/html

# Copier le fichier de configuration Nginx
COPY ./conf/setup.sh /
RUN chmod +x /setup.sh && /setup.sh

# Lancer Nginx en mode premier plan
CMD ["nginx", "-g", "daemon off;"]
