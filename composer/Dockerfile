# Utiliser Alpine Linux comme image de base
FROM phangwilly/php:v1.0

#Installation de composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
        && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
        && php -r "unlink('composer-setup.php');"

# Créer un répertoire
WORKDIR /var/www/html

# Copier les fichiers PHP du répertoire actuel vers le répertoire dans le conteneur
COPY . /var/www/html

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

# Exposer le port
EXPOSE 9000

# ENTRYPOINT ["/docker-entrypoint.sh"]
# CMD ["composer"]
