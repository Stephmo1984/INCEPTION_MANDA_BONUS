


# # Créer le répertoire de données
# RUN mkdir -p /data && chown -R redis:redis /data

# # Exposer le port Redis (par défaut 6379)
# EXPOSE 6379

# # Lancer Redis avec la configuration personnalisée
# ENTRYPOINT [ "redis-server", "/etc/redis/redis.conf" ]



# CMD ["redis-server", "--protected-mode", "no"]

FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y 

RUN apt install -y vim iputils-ping

RUN apt install -y redis-server
COPY /conf/redis.conf /etc/redis/

# # Créer le répertoire de données
RUN mkdir -p /data && chown -R redis:redis /data
# Exposer le port Redis (par défaut 6379)
EXPOSE 6379

CMD ["redis-server",  "--protected-mode", "no"]
