# PULL Debian Buster image
FROM debian:buster

# Install nginx and openssl
RUN apt -y update && apt -y install nginx openssl

# Create the folder for ssl certificate
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed ssl certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/ssl/cert.pem -keyout /etc/nginx/ssl/key.pem -subj "/C=FR/ST=Charente/L=Angouleme/O=42/CN=smortemo.42.fr/UID=smortemo";

# Replace nginx configuration file
RUN rm -f /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Create the folder to enable nginx to start
RUN mkdir -p /run/nginx

# Expose the port
EXPOSE 443

# Run the nginx server in background
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

