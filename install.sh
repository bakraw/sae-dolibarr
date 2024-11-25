#!/bin/bash

# Vérifier la présence du fichier docker-compose.yml
if [ ! -f "docker-compose.yml" ]; then
  echo "Fichier docker-compose.yml non trouvé. Création du fichier..."

  # Créer le fichier docker-compose.yml pour Dolibarr et MariaDB
  cat <<EOL > docker-compose.yml

version: '3'

services:
  mariadb:
    image: mariadb:latest
    container_name: dolibarr-db
    environment:
      - MYSQL_ROOT_PASSWORD=rootpassword
      - MYSQL_DATABASE=dolibarr
      - MYSQL_USER=dolibarr_user
      - MYSQL_PASSWORD=dolibarr_password
    volumes:
      - ./import-data.sql:/import-data.sql
      - ./data.csv:/docker-entrypoint-initdb.d/data.csv
    ports:
      - "3306:3306"
    networks:
      - dolibarr-network

  dolibarr:
    image: dolibarr/dolibarr:latest
    container_name: dolibarr-app
    ports:
      - "8080:80"
    environment:
      - DOLI_DB_HOST=mariadb
      - DOLI_DB_USER=dolibarr_user
      - DOLI_DB_PASSWORD=dolibarr_password
      - DOLI_DB_NAME=dolibarr
    depends_on:
      - mariadb
    volumes:
      - dolibarr_data:/var/www/html/documents
    networks:
      - dolibarr-network

volumes:
  db_data:
  dolibarr_data:

networks:
  dolibarr-network:
    driver: bridge

EOL
  echo "Fichier docker-compose.yml créé avec succès."
else
  echo "Fichier docker-compose.yml trouvé. Utilisation du fichier existant."
fi

# Lancer Docker Compose
echo "Lancement de Dolibarr et MariaDB avec Docker Compose..."
docker-compose up -d --build

# Attendre la création des tables par Dolibarr
echo "En attente de la création des conteneurs..."
sleep 30

# Exécuter le script SQL d'import
echo "Import des données..."
docker exec dolibarr-db sh -c "su && service mariadb start && mariadb -u'dolibarr_user' -p'dolibarr_password' < /import-data.sql"

# Attendre la création des conteneurs et l'initialisation de la base de données
echo "En attente de l'initialisation des conteneurs..."
sleep 30

# Activer les modules "Tiers" et "Fournisseurs"
echo "Activation des modules Tiers et Fournisseurs..."
docker exec dolibarr-db sh -c "mariadb -u'dolibarr_user' -p'dolibarr_password' dolibarr -e \"
  UPDATE llx_const SET value='1' WHERE name='MAIN_MODULE_SOCIETE' AND entity=1;
  INSERT INTO llx_const (name, value, type, visible, entity) 
  VALUES 
  ('MAIN_MODULE_SOCIETE', '1', 'chaine', 1, 1) 
  ON DUPLICATE KEY UPDATE value='1';
\""
docker exec dolibarr-db sh -c "mariadb -u'dolibarr_user' -p'dolibarr_password' dolibarr -e \"
  UPDATE llx_const SET value='1' WHERE name='MAIN_MODULE_FOURNISSEUR' AND entity=1;
  INSERT INTO llx_const (name, value, type, visible, entity) 
  VALUES 
  ('MAIN_MODULE_FOURNISSEUR', '1', 'chaine', 1, 1) 
  ON DUPLICATE KEY UPDATE value='1';
\""


# Attendre la création des conteneurs et l'initialisation de la base de données
echo "En attente de l'initialisation des conteneurs..."
sleep 5

# Activer uniquement les modules "Clients" et "Fournisseurs"
echo "Activation des modules Clients et Fournisseurs..."
docker exec dolibarr-db sh -c "mariadb -u'dolibarr_user' -p'dolibarr_password' dolibarr -e \"
  INSERT INTO llx_const (name, value, type, visible, entity) VALUES
  ('MAIN_MODULE_SOCIETE', '1', 'chaine', 1, 1)
  ON DUPLICATE KEY UPDATE value='1';
\""

echo "Installation terminée. Dolibarr est disponible sur http://localhost:8080"
