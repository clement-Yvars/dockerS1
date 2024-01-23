FROM alpine

RUN apk update && apk --no-cache add \
    php \
    php-session \
    php-pdo \
    php-pdo_pgsql \
    php-json

ENV ADMINER_VERSION=4.8.1
ADD https://www.adminer.org/static/download/${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php /var/www/adminer/index.php

VOLUME /var/www/adminer

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/adminer"]