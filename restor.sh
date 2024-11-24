#!/bin/bash

# Configuration
APP_CONTAINER="dolibarr-app"    # Conteneur qui contient `mysql` (client)
DB_CONTAINER="dolibarr-db"      # Conteneur de la base de données
DB_NAME="dolibarr"              # Nom de la base de données
DB_USER="dolibarr_user"         # Nom d'utilisateur MySQL
DB_PASS="dolibarr_password"     # Mot de passe MySQL
BACKUP_DIR="./backups"          # Répertoire des sauvegardes
LATEST_DB_BACKUP=$(ls -t $BACKUP_DIR/dolibarr_db_backup_*.sql | head -n 1)  # Dernière sauvegarde DB
LATEST_MODULES_BACKUP=$(ls -t $BACKUP_DIR/dolibarr_modules_backup_*.tar | head -n 1)  # Dernière sauvegarde des modules

# Vérification de la dernière sauvegarde de base de données
if [ -z "$LATEST_DB_BACKUP" ]; then
    echo "Aucune sauvegarde de base de données trouvée dans le répertoire $BACKUP_DIR"
    exit 1
fi

# Vérification de la dernière sauvegarde des modules
if [ -z "$LATEST_MODULES_BACKUP" ]; then
    echo "Aucune sauvegarde des modules trouvée dans le répertoire $BACKUP_DIR"
    exit 1
fi

echo "### Début de la restauration ###"

# Recréation des conteneurs
echo "Recréation des conteneurs..."
docker-compose down
docker-compose up -d

# Attente du démarrage des conteneurs
echo "Attente du démarrage des conteneurs..."
sleep 20

# Désactivation des contraintes de clé étrangère
echo "Désactivation des contraintes de clé étrangère..."
docker exec -i "$DB_CONTAINER" mysql -u"$DB_USER" -p"$DB_PASS" -e "SET FOREIGN_KEY_CHECKS = 0;"

# Restauration de la base de données
echo "Restauration de la base de données depuis $LATEST_DB_BACKUP..."
docker exec -i "$DB_CONTAINER" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$LATEST_DB_BACKUP"

# Réactivation des contraintes de clé étrangère
echo "Réactivation des contraintes de clé étrangère..."
docker exec -i "$DB_CONTAINER" mysql -u"$DB_USER" -p"$DB_PASS" -e "SET FOREIGN_KEY_CHECKS = 1;"

# Vérification de la réussite de la restauration de la base de données
if [ $? -eq 0 ]; then
    echo "Restauration de la base de données réussie."
else
    echo "Erreur lors de la restauration de la base de données."
    exit 1
fi

# Restauration des modules Dolibarr (volume)
echo "Restauration des modules Dolibarr depuis $LATEST_MODULES_BACKUP..."
docker exec -i "$APP_CONTAINER" tar -xvf - -C /var/www/html/custom < "$LATEST_MODULES_BACKUP"

# Vérification de la réussite de la restauration des modules
if [ $? -eq 0 ]; then
    echo "Restauration des modules réussie."
else
    echo "Erreur lors de la restauration des modules."
    exit 1
fi

echo "### Fin de la restauration ###"
