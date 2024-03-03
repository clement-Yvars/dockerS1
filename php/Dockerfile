# Utiliser Alpine Linux comme image de base
FROM alpine:latest

# Mettre à jour les paquets et installer PHP
RUN apk update && \
    apk add --no-cache php php-cli php-json php-fpm php-opcache \
    php-phar \
    php-iconv \
    php-mbstring \
    php-openssl \
    && rm -rf /var/cache/apk/*

# Créer un répertoire
WORKDIR /var/www/html

# Copier les fichiers PHP du répertoire actuel vers le répertoire dans le conteneur
COPY . /var/www/html

# Exposer le port
EXPOSE 9000