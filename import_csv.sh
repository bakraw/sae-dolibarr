#!/bin/bash

# Paramètres de connexion à la base de données
DB_HOST="localhost"
DB_PORT="3306"  # Port local de MariaDB exposé (s'il est mappé en dehors du conteneur Docker)
DB_USER="dolibarr_user"
DB_PASSWORD="dolibarr_password"
DB_NAME="dolibarr"

# Vérifiez que le fichier CSV existe dans le dossier courant
if [ ! -f "data.csv" ]; then
  echo "Erreur : Le fichier data.csv est manquant."
  exit 1
fi

# Copier le fichier CSV dans le conteneur MariaDB pour l'import
docker cp data.csv dolibarr-db:/var/lib/mysql/data.csv

# Import des data (clients et fournisseurs) depuis le fichier data.csv
echo "Importation des data depuis data.csv..."
docker exec -i dolibarr-db mysql -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" <<EOF
LOAD DATA LOCAL INFILE '/var/lib/mysql/data.csv'
INTO TABLE llx_societe
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nom, adresse, telephone, email, type)
SET fk_societe_type = CASE
  WHEN type = 'client' THEN 1
  WHEN type = 'fournisseur' THEN 2
  ELSE NULL
END;
EOF

# Suppression du fichier CSV du conteneur après import
docker exec -i dolibarr-db rm /var/lib/mysql/data.csv

echo "Importation terminée."
