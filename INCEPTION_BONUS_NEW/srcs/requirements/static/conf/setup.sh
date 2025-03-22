#!/bin/bash

cat <<EOF > /etc/nginx/nginx.conf
events {}
http {
    include /etc/nginx/mime.types;

    server {
        listen 8080;
        root /var/www/html;
        server_name smortemo.42.fr;
        index index.html;
    }
}
EOF