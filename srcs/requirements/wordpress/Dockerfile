# PULL Debian Buster image
FROM debian:buster

# Install dependencies
RUN apt -y update \
 && apt -y install wget \
 && apt -y install unzip \
 && apt -y install php7.3 \
 && apt -y install php-fpm \
 && apt -y install php-mysql

# Define work directory
WORKDIR /var/www/

# Download latest version of wordpress (zipped)
RUN wget https://fr.wordpress.org/latest-fr_FR.zip

# Unzip wordpress compressed file
RUN unzip latest-fr_FR.zip

# Remove wordpress compressed file
RUN rm -f latest-fr_FR.zip

# Update php-fpm configuration file to listen on port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

# Create the folder to enable php start
RUN mkdir -p /run/php

# Expose the port
EXPOSE 9000

# Run php-fpm command in background
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]

