
FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx
COPY ./html /var/www/html
COPY ./conf/setup.sh /
RUN chmod +x /setup.sh && /setup.sh
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

# # PULL Debian Buster image
# FROM debian:buster

# # Install nginx and openssl
# RUN apt -y update && apt -y install nginx


# # Replace nginx configuration file
# RUN rm -f /etc/nginx/nginx.conf
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# # Create the folder to enable nginx to start
# #RUN mkdir -p /run/nginx

# # Expose the port
# EXPOSE 80

# # Run the nginx server in background
# CMD ["/usr/sbin/nginx", "-g", "daemon off;"]



# # Utiliser l'image de base alpine
# FROM alpine:latest

# # Installer Nginx
# RUN apk update && apk add --no-cache nginx

# # Créer le répertoire pour les fichiers statiques
# RUN mkdir -p /var/www/html

# # Copier les fichiers statiques vers le conteneur
# COPY ./html/ /var/www/html/

# # Copier la configuration de Nginx
# COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# # Donner les bonnes permissions
# RUN chown -R nginx:nginx /var/www/html

# # Exposer le port 80
# EXPOSE 80

# # Lancer Nginx
# CMD ["nginx", "-g", "daemon off;"]


# # Utiliser l'image officielle Nginx
# FROM nginx:alpine

# # Supprimer la configuration par défaut de Nginx
# RUN rm /etc/nginx/conf.d/default.conf

# # Copier notre configuration Nginx personnalisée
# COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# # Exposer le port 80
# EXPOSE 80
