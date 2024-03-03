# Utiliser votre image custom PHP comme image de base
FROM phangwilly/php:v1.0

# Mettre à jour les paquets et installer les dépendances nécessaires pour Adminer
RUN apk update && \
        apk add --no-cache php-mysqli php-pdo php-pdo_mysql php-pdo_pgsql php-pdo_sqlite php-session \
        && rm -rf /var/cache/apk/*

# Télécharger la dernière version d'Adminer
ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/html/index.php

# Attribuer les droits d'utilisateur pour le serveur web
RUN chown -R nobody.nobody /var/www/html

# Exposer le port sur lequel le serveur web PHP intégré sera accessible
EXPOSE 8080

# Commande pour démarrer le serveur web PHP intégré et servir Adminer
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]