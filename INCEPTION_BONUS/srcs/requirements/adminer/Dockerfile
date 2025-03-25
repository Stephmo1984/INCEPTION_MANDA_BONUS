# # SPECIFIES DISTRIBUTION
# FROM debian:buster

# # UPDATE AND INSTALLATION
# RUN apt-get update 
# RUN apt install -y adminer 

# # COPY THE CONF FILE 
# COPY ./conf/000-default.conf /etc/apache2/sites-available/
# RUN echo 'ServerName adminer' >> /etc/apache2/apache2.conf

# # START AND CONF 
# RUN service apache2 start && a2enconf adminer.conf 

# ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget php php-mysqli
COPY ./tools/setup.sh /setup.sh
RUN chmod +x /setup.sh && /setup.sh
ENTRYPOINT [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/html" ]