#!/bin/bash

# Configuration
APP_CONTAINER="dolibarr-app"    # Conteneur Dolibarr
DB_CONTAINER="dolibarr-db"      # Conteneur MariaDB
DB_NAME="dolibarr"              # Nom de la base de données
DB_USER="dolibarr_user"         # Nom d'utilisateur MySQL
DB_PASS="dolibarr_password"     # Mot de passe MySQL
BACKUP_DIR="./backups"          # Répertoire de sauvegarde
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
DB_BACKUP_FILE="$BACKUP_DIR/dolibarr_db_backup_$DATE.sql"
MODULES_BACKUP_FILE="$BACKUP_DIR/dolibarr_modules_backup_$DATE.tar"

# Création du dossier de sauvegarde si nécessaire
mkdir -p "$BACKUP_DIR"

echo "### Début de la sauvegarde ###"

# Sauvegarde de la base de données
echo "Sauvegarde de la base de données..."
sudo docker exec "$APP_CONTAINER" mysqldump -h"$DB_CONTAINER" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$DB_BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Sauvegarde de la base de données réussie : $DB_BACKUP_FILE"
else
    echo "Erreur lors de la sauvegarde de la base de données."
    exit 1
fi

# Sauvegarde des modules Dolibarr
echo "Sauvegarde des modules Dolibarr..."
sudo docker exec "$APP_CONTAINER" tar -cf - -C /var/www/html/custom . > "$MODULES_BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Sauvegarde des modules réussie : $MODULES_BACKUP_FILE"
else
    echo "Erreur lors de la sauvegarde des modules."
    exit 1
fi

echo "### Fin de la sauvegarde ###"

