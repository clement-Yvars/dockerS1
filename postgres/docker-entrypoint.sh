#!/bin/sh
set -e

# Fonction pour initialiser la base de données avec les variables d'environnement
initialize_database() {
    # Initialisation de la base de données PostgreSQL
    su-exec postgres initdb -D /var/lib/postgresql/data

    # Création du répertoire pour le fichier de verrouillage
    mkdir -p /run/postgresql
    chown -R postgres:postgres /run/postgresql

    # Démarrage du serveur PostgreSQL
    su-exec postgres pg_ctl -D /var/lib/postgresql/data -o "-c listen_addresses='localhost'" -w start

    # Création de l'utilisateur et de la base de données avec les variables d'environnement
    su-exec postgres psql --command "CREATE USER $POSTGRES_USER WITH SUPERUSER PASSWORD '$POSTGRES_PASSWORD';"
    su-exec postgres createdb -O $POSTGRES_USER $POSTGRES_DB
}

# Exécutez la fonction d'initialisation seulement si la base de données n'est pas déjà initialisée
if [ ! -s /var/lib/postgresql/data/PG_VERSION ]; then
    initialize_database
fi

# Copiez les fichiers de configuration PostgreSQL
cp /postgresql.conf /var/lib/postgresql/data/postgresql.conf
chown postgres:postgres /var/lib/postgresql/data/postgresql.conf

# Autorisez les connexions locales/distantes sans mot de passe
echo "host all  all all trust" >> /var/lib/postgresql/data/pg_hba.conf

# Démarrage du serveur PostgreSQL
exec su-exec postgres postgres -D /var/lib/postgresql/data -c config_file=/var/lib/postgresql/data/postgresql.conf