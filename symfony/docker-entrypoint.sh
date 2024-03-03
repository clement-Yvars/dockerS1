#!/bin/bash

# Exécuter la commande Composer
/usr/bin/php8 /usr/local/bin/composer install

# Vérifier le code de retour de la commande Composer
composer_exit_code=$?

# Si la commande Composer a réussi, arrêter le conteneur
if [ "$composer_exit_code" -eq 0 ]; then
  echo "Composer install succeeded. Stopping the container."
  exit 0
else
  echo "Composer install failed."
  exit "$composer_exit_code"
fi