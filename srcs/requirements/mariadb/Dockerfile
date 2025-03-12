# PULL Debian Buster image
FROM debian:buster

# Expose the port
EXPOSE 3306

# Install mariadb
RUN apt update -y \
 && apt install -y mariadb-client mariadb-server

# Create the folder and give the right to enable mysqld start
# RUN mkdir -p /var/run/mysqld/
# RUN chown -R mysql:mysql /var/run/mysqld/
# RUN chmod -R 777 /var/run/mysqld/

# Copy the script to install and initialize mariadb in the container
COPY ./tools/init-mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-mariadb.sh

# Launch the script at entry point to install and initialize mariadb database
ENTRYPOINT ["/usr/local/bin/init-mariadb.sh"]

# Start MySQL with option to allow connections from outside the container
CMD ["/usr/sbin/mysqld", "--bind-address=0.0.0.0"]
