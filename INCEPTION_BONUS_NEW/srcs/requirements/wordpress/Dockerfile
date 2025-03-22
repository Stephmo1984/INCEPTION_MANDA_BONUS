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

# Install Wordpress CLI to configure Wordpress site and create users in the script
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy the script to update wordpress config file
COPY ./tools/update-wp-config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/update-wp-config.sh

# Launch the script at entry point to update wordpress config file
ENTRYPOINT ["/usr/local/bin/update-wp-config.sh"]

# Expose the port
EXPOSE 9000

# Run php-fpm command in background
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]

