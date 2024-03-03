FROM alpine:3.15

RUN echo "http://mirrors.aliyun.com/alpine/v3.15/community" >> /etc/apk/repositories

# Installez PostgreSQL et les outils nécessaires
RUN apk --no-cache add postgresql postgresql-contrib libc6-compat su-exec

# Copiez le script d'entrée
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Copiez le fichier de configuration PostgreSQL
COPY postgresql.conf /postgresql.conf

# Autorisez l'exécution du script
RUN chmod +x /docker-entrypoint.sh

# Exposez le port par défaut de PostgreSQL
EXPOSE 5432

# Définissez le script d'entrée comme point d'entrée du conteneur
ENTRYPOINT ["/docker-entrypoint.sh"]