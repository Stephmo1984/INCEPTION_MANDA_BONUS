# FROM debian:bullseye
# RUN apt-get update -y && apt-get upgrade -y
# RUN apt-get install -y redis-server

# RUN rm /etc/redis/redis.conf

# COPY ./conf/redis.conf /etc/redis/redis.conf


# ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]

# FROM debian:buster

# # Mise à jour du système et installation de Redis
# RUN apt-get update -y && apt-get upgrade -y && \
#     apt-get install -y redis-server && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# # Copier le fichier de configuration Redis personnalisé
# COPY ./conf/redis.conf /etc/redis/redis.conf

# # Créer le répertoire de données
# RUN mkdir -p /data && chown -R redis:redis /data

# # Exposer le port Redis (par défaut 6379)
# EXPOSE 6379

# # Lancer Redis avec la configuration personnalisée
# ENTRYPOINT [ "redis-server", "/etc/redis/redis.conf" ]

# FROM debian:buster

# RUN apt-get update -y && \
#     apt-get install -y redis && \
#     apt-get install -y redis-server

# RUN sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
# RUN echo 'maxmemory 256mb' >> /etc/redis/redis.conf && \ 
#    echo 'maxmemory-policy allkeys-lru' >> /etc/redis/redis.conf


# RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf

# EXPOSE 6379

# CMD ["redis-server", "--protected-mode", "no"]

FROM debian:buster

RUN apt-get update && apt-get upgrade -y 

RUN apt install -y vim iputils-ping

RUN apt install -y redis-server
COPY /conf/redis.conf /etc/redis/

CMD ["redis-server",  "--protected-mode", "no"]
