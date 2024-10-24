#!/bin/bash

# Attendre que la table llx_societe soit crée par Dolibarr
until echo "SHOW TABLES LIKE 'llx_societe'" | mysql -h mariadb -u dolibarr_user -pdolibarr_password dolibarr | grep "llx_societe"; do
  echo "EN attente de la création de la BDD par Dolibarr..."
  sleep 5
done

# Exécuter le script SQL d'importation une fois que la BDD est prête
mysql -h mariadb -u dolibarr_user -p dolibarr_password dolibarr < /docker-entrypoint-initdb.d/import-data.sql
