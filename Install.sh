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
      - ./import-data.sql:/docker-entrypoint-initdb.d/import-data.sql
      - ./data.csv:/docker-entrypoint-initdb.d/data.csv
      - ./attendre-dolibarr.sh:/docker-entrypoint-initdb.d/attendre-dolibarr.sh
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
docker-compose up -d

echo "Installation terminée. Dolibarr est disponible sur http://localhost:8080"