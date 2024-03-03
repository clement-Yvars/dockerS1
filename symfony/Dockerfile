FROM phangwilly/composer:v1.0

# Installation des dépendances nécessaires
RUN apk update && \
    apk add --no-cache php-ctype php-dom php-xml php-xmlwriter php-tokenizer php-json php-iconv php-mbstring php-openssl php-pdo php-pdo_mysql php-pdo_pgsql php-pdo_sqlite php-phar php-posix php-session php-simplexml php-xmlreader php-zip

RUN composer require symfony/maker-bundle --dev

RUN composer require symfony/orm-pack

# Définir le répertoire de travail dans le conteneur sur le projet Symfony
WORKDIR /var/www/html/project

# Exposer le port sur lequel le serveur web sera accessible
EXPOSE 8000

# Commande pour démarrer le serveur web PHP intégré
# CMD ["php", "-S", "0.0.0.0:8000"]