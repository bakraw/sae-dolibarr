# SAE51 - projet 3 : Installation d’un ERP/CRM

## 1 Préparation du projet

### 1-1 Le projet

Pour ce projet, nous sommes les responsables informatique d'une entrepirse XXX. Dans ce sénario, la direction souhaite migrer
d’une solution ERP/CRM externalisée vers une solution d'herbergement en interne, basée sur le progiciel ”Dolibarr”.

La direction à exporter ces données actuel en format CSV. Ce fichier comprend les informations sur les fichiers clients, fournisseurs, factures, commandes et autres information. 
De plus la direction nous confie un cahier des charges.

Ce cahier des charges comrpend l'étude de la mise en place d'un Dolibarr fonctionnel sur un serveur d'édié de l'entrepise. Ce qui nous demandera de gêrer l'installation, 
l'import et la sauvegarde des données en cas d'incident. Ce qui sera donc notre plan de reprise d'activiter. 


### 1-2 Les objectifs 

Pour réaliser la demande de la direction et donc remplir notre cahier des charges.

- Il nous faudra créer un script qui va automatiser l'installation de dolibarr avec les différents outils dont il a besoin et que nous avions besoin pour ce projet 
- Nous devions aussi penser à la sauvegarde des données qui un des aspects spéciaux du projet.
- Afin de pouvoir lançée sans problèmes nos différents script, nous allions dockerisée notre projets. 


### 1-3 Fichier CSV 

Pour ce projet, nous aurion bession d'information qui pourrion simuler les informations tipiques d'une entreprise. Pour sa, nous avions générer des informations par une IA avec des paramêtres divers, comme le nom de la sociéter, leurs type de relation avec notre entreprise, l'adresse, le code postal, la ville, le pays et les coordonnées de l'entrepris. 
Et nous obtenons, le tableaux suivant : 

| Type        | Nom                     | Adresse                  | Code Postal | Ville        | Pays         | Téléphone         | Email                          |
|-------------|-------------------------|--------------------------|-------------|--------------|--------------|-------------------|--------------------------------|
| Client      | Société Alpha            | 12 Rue des Fleurs         | 75000       | Paris        | France       | +33 1 23 45 67 89  | contact@alpha.fr               |
| Client      | Compagnie Beta           | 21 Boulevard des Nations  | 69000       | Lyon         | France       | +33 4 67 89 10 11  | support@beta.com               |
| Client      | InnovTech GmbH           | 15 Hauptstrasse           | 10115       | Berlin       | Allemagne    | +49 30 12345678    | info@innovtech.de              |
| Client      | Green Energy Ltd         | 10 Oxford Street          | W1D 1NN     | Londres      | Royaume-Uni  | +44 20 7946 0958   | sales@greenenergy.co.uk        |
| Client      | Vision Global Corp       | 2401 Broadway             | 10024       | New York     | États-Unis   | 12 125 550 198     | global@visioncorp.us           |
| Fournisseur | FourniturePro            | 45 Rue des Artisans       | 13000       | Marseille    | France       | +33 4 12 34 56 78  | contact@fournipro.fr           |
| Fournisseur | Matériaux Direct         | 78 Avenue des Bâtisseurs  | 34000       | Montpellier  | France       | +33 6 45 78 12 34  | commande@materiauxdirect.fr    |
| Fournisseur | Global Import Srl        | 33 Via Roma               | 20121       | Milan        | Italie       | +39 02 1234567     | import@globalimport.it         |
| Fournisseur | Technosupply Ltd         | 1200 Yonge Street         | M4T 1W1     | Toronto      | Canada       | 14 165 551 234     | order@technosupply.ca          |
| Client      | Créations Lumière SARL   | 8 Rue de la République    | 69007       | Lyon         | France       | +33 9 87 65 43 21  | support@crealumiere.fr         |
| Client      | Entreprise de Construction| 23 Boulevard Pasteur      | 33000       | Bordeaux     | France       | +33 5 56 78 12 34  | info@constructeur.com          |
| Client      | Mercado Solutions S.A.   | Calle Gran Via 56         | 28013       | Madrid       | Espagne      | +34 91 123 4567    | contact@mercadosolutions.es    |



## 2 Découverte des élèments clés 

Dans se projet, nous avions découvert plusieurs notions comme ERP et CRM mais aussi le progiciel dolibarr. 

### 2-1 ERP & CRM

#### ERP (Enterprise Resource Planning)

Un ERP, ou progiciel de gestion intégré en français, est un logiciel destiné à centraliser et gérer tous les processus et informations d’une entreprise dans une seule base de données. Cela permet une gestion unifiée de plusieurs fonctions essentielles, comme :

- Les finances : comptabilité, facturation, suivi des dépenses et revenus.
- La gestion des stocks et de la production : suivi des stocks, planification de la production, gestion des achats et des ventes.
- Les ressources humaines : gestion de la paie, des congés, des absences et des données des employés.
- L'objectif principal d'un ERP est d'améliorer la collaboration et l'efficacité au sein de l'entreprise en éliminant les silos d'informations, en permettant à tous les départements de travailler avec les mêmes données actualisées.

#### CRM (Customer Relationship Management)

Un CRM, ou gestion de la relation client, est un système centré sur la gestion des interactions avec les clients et les prospects. Il aide les entreprises à suivre et à gérer chaque point de contact client, depuis les premiers échanges commerciaux jusqu’au support après-vente. Les principales fonctions d'un CRM incluent :

- La gestion des contacts : centralisation des informations de clients et prospects.
- Le suivi des opportunités commerciales : gestion des devis, des commandes et des potentiels clients.
- L'automatisation du marketing et des ventes : suivi des campagnes marketing et des pipelines de ventes.
- Le CRM vise à améliorer la satisfaction client et à accroître les ventes en assurant une communication personnalisée et un suivi attentif des besoins et des attentes des clients.

### 2-2 Dolibarr 

Dolibarr est un logiciel open-source de gestion d’entreprise, qui combine les fonctionnalités d’un ERP (Enterprise Resource Planning) et d’un CRM (Customer Relationship Management). Conçu principalement pour les petites et moyennes entreprises (PME), il propose une solution intégrée pour gérer différents aspects d’une organisation : clients, fournisseurs, facturation, stocks, et bien plus encore.
Dolibarr présente des avantages importants : 

#### Points forts

- Gratuit et open source : Solution économique et personnalisable.
- Modulaire : Activez seulement les fonctionnalités dont vous avez besoin.
- Facile à utiliser : Interface simple, adaptée aux petites entreprises.
- Installation rapide : Peut être installé en local ou sur serveur, compatible avec plusieurs systèmes.
- Bonne communauté : Aide et documentation disponibles, plus des extensions pour enrichir le logiciel.

#### Points faibles

- Limité pour les grandes entreprises : Pas idéal pour des besoins complexes.
- Performances : Peut ralentir avec beaucoup de données.
- Fonctions de comptabilité et CRM basiques : Nécessite parfois des modules supplémentaires.
- Support payant : Assistance directe limitée si vous n'avez pas d'expert interne.
- Interface simple : Moins moderne que d'autres ERP.

Ce logiciel est excellente pour les petites entreprises avec des besoins de gestion basiques, mais limité pour les grandes entreprises ou des besoins très spécifiques.

## 3 Scripts du projets 

Pour ce projet, nous avons fait divers codes et scripts qui font divers tâche. Comme le docker-compose qui créer les conteneurs, l'install qui permet d'installer les dockers à partir de rien. Le script d'import qui permet d'importer les fichiers sur le dolibarr et le script backup qui permet de faire des sauvegarde. 

### 3-1 Docker-compose

Pour commencer, on va parler du docker-compose. 

```
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
      - ./data.csv:/docker-entrypoint-initdb.d/data.csv
      - ./import-data.sql:/import-data.sql
    ports:
      - "3306:3306"
    networks:
      - dolibarr-network
```
- **Services** : 
Cette section définit les conteneurs Docker nécessaires à votre application. Il y a deux services : mariadb et dolibarr.

- **Service mariadb** :
C'est un conteneur qui exécute une base de données MariaDB.

- **Image : mariadb:latest** :
Cela spécifie que le conteneur doit utiliser l'image officielle MariaDB dans sa dernière version.

- **Container Name : dolibarr-db** :
Nom attribué au conteneur pour le distinguer.

- **Environment** :
Variables d'environnement pour configurer MariaDB.

- **MYSQL_ROOT_PASSWORD** :
Mot de passe pour l'utilisateur root.

- **MYSQL_DATABASE** : 
Nom de la base de données qui sera automatiquement créée.

- **MYSQL_USER et MYSQL_PASSWORD** :
Un utilisateur non-root et ses credentials pour se connecter à la base.

- **Volumes** :
**./data.csv:/docker-entrypoint-initdb.d/data.csv**
Ce fichier est monté dans le conteneur. S'il contient des données, MariaDB peut l'utiliser pour initialiser la base.

**./import-data.sql:/import-data.sql**
Un script SQL, probablement pour importer des données ou configurer la base.

- **Ports** :
3306:3306 signifie que le port 3306 (utilisé par MariaDB) du conteneur est mappé au port 3306 de l'hôte.

- **Networks** :
Le conteneur est connecté à un réseau Docker nommé dolibarr-network.


```
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
```
- **Service dolibarr** :
Ce conteneur exécute l'application Dolibarr, un ERP/CRM open source. 

- **Image** : dolibarr/dolibarr:latest
L'image officielle de Dolibarr dans sa dernière version.

- **Container Name** : dolibarr-app
Nom attribué au conteneur.

- **Ports** :
8080:80 signifie que le port 80 (par défaut pour HTTP) du conteneur est mappé au port 8080 de l'hôte.

- **Environment** :
Variables d'environnement pour configurer Dolibarr.

- **DOLI_DB_HOST** :
Nom d'hôte du service MariaDB (ici mariadb, qui correspond au nom du service).

- **DOLI_DB_USER, DOLI_DB_PASSWORD, DOLI_DB_NAME** :
Identifiants de connexion à la base de données.

- **depends_on** :
Indique que ce conteneur dépend du service mariadb. Docker Compose s'assurera que mariadb est démarré avant dolibarr.

- **Volumes** :
dolibarr_data:/var/www/html/documents
Les documents générés ou utilisés par Dolibarr seront stockés dans ce volume persistant.

- **Networks** :
Le conteneur est connecté au réseau dolibarr-network.

```
volumes:
  db_data:
  dolibarr_data:
```
- **Volumes** :
Les volumes Docker permettent de persister des données même si le conteneur est recréé.

- **db_data** :
Utilisé pour persister les données de la base MariaDB.

- **dolibarr_data** :
Stocke les fichiers de Dolibarr.

```
networks:
  dolibarr-network:
    driver: bridge
```

- **Networks** :
Le réseau dolibarr-network utilise le pilote bridge. Cela permet aux conteneurs d'interagir entre eux sur un réseau virtuel isolé.

        
### 3-2 Install

```
#!/bin/bash

# Vérifier la présence du fichier docker-compose.yml
if [ ! -f "docker-compose.yml" ]; then
  echo "Fichier docker-compose.yml non trouvé. Création du fichier..."

  # Créer le fichier docker-compose.yml pour Dolibarr et MariaDB
  cat <<EOL > docker-compose.yml
```
Vérification du fichier docker-compose.yml:

Le script vérifie si un fichier nommé docker-compose.yml existe dans le répertoire courant.

**Si absent** : il crée un fichier docker-compose.yml qui configure deux services :
- **MariaDB** : La base de données.
- **Dolibarr** : L'application ERP/CRM.
- 
Les services sont configurés pour fonctionner ensemble sur un réseau Docker personnalisé appelé dolibarr-network.
```
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
```
**Fichier déjà présenter dans la partie docker-compose.yml.** 
```
# Lancer Docker Compose
echo "Lancement de Dolibarr et MariaDB avec Docker Compose..."
docker-compose up -d --build
```
Démarrage des services: 

Le script utilise la commande ```docker-compose up -d --build``` pour :
Construire les images Docker si nécessaire.
Démarrer les conteneurs de Dolibarr et MariaDB en arrière-plan.
```
# Attendre la création des tables par Dolibarr
echo "En attente de la création des conteneurs..."
sleep 20

# Exécuter le script SQL d'import
echo "Import des données..."
docker exec dolibarr-db sh -c "su && service mariadb start && mariadb -u'dolibarr_user' -p'dolibarr_password' < /import-data.sql"


```
Importation des données initiales : 

Une fois les conteneurs démarrés, le script :
Attend 20 secondes ```sleep 20``` pour que les conteneurs soient prêts.
Exécute un fichier SQL **import-data.sql** dans le conteneur MariaDB pour importer des données dans la base Dolibarr.
```

# Attendre la création des conteneurs et l'initialisation de la base de données
echo "En attente de l'initialisation des conteneurs..."
sleep 20


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
```
Activation des modules Dolibarr : 

Attente 20 nouvelles secondes ```sleep 20``` pour que les conteneurs soient prêts.
Après l'importation des données, le script :
Active **deux modules Dolibarr** : Tiers et Fournisseurs.

Cela se fait en **exécutant des commandes SQL dans MariaDB** pour modifier les paramètres internes de Dolibarr.

```

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
```
Activation des modules Dolibarr : 

Attente 5 nouvelles secondes ```sleep 5``` pour que les conteneurs soient prêts.

Exécution dans le conteneur Docker :

**docker exec dolibarr-db:** Lance une commande à l'intérieur du conteneur nommé dolibarr-db (le conteneur MariaDB).

**sh -c**: Exécute un shell dans le conteneur.

Connexion à MariaDB :

**mariadb** : Commande pour interagir avec la base de données MariaDB.
**-u'dolibarr_user'** : Se connecte avec l’utilisateur dolibarr_user.
**-p'dolibarr_password'**: Utilise le mot de passe dolibarr_password.
**dolibarr**: Spécifie qu’on travaille avec la base de données dolibarr.

Commande SQL pour activer le module :

**Table utilisée** : llx_const, qui stocke les paramètres de configuration de Dolibarr.

Insertion ou mise à jour :

Si un paramètre avec ```name='MAIN_MODULE_SOCIETE'``` (module des Clients) existe, il est mis à jour pour activer ce module ```value='1'```.
Sinon, un nouveau paramètre est créé.

Colonnes importantes :
**name**: Le nom du paramètre, ici ```MAIN_MODULE_SOCIETE``` pour activer le module Clients.
**value**: Définit l’état du module (1 pour activé).
**type**: Le type de valeur, ici chaine (chaîne de caractères).
**visible**: Rend le module visible dans l’interface de Dolibarr (1).
**entity**: Applique cette configuration à l’entité 1 (l’entité par défaut dans Dolibarr).

```
echo "Installation terminée. Dolibarr est disponible sur http://localhost:8080"
```
Message final:

Une fois tout configuré, le script affiche un message indiquant que Dolibarr est prêt et accessible à l'adresse : http://localhost:8080.


### 3-3 Import_csv

```
#!/bin/bash

# Paramètres de connexion à la base de données
DB_HOST="localhost"
DB_PORT="3306"  # Port local de MariaDB exposé (s'il est mappé en dehors du conteneur Docker)
DB_USER="dolibarr_user"
DB_PASSWORD="dolibarr_password"
DB_NAME="dolibarr"
```

Paramètres de connexion :

Le script définit les informations nécessaires pour se connecter à la base de données :

**DB_HOST** : Adresse de l'hôte MariaDB (ici localhost).
**DB_PORT** : Port MariaDB (par défaut, 3306).
**DB_USER** : Nom d'utilisateur pour accéder à la base.
**DB_PASSWORD** : Mot de passe correspondant.
**DB_NAME** : Nom de la base de données (ici dolibarr).
```
# Vérifiez que le fichier CSV existe dans le dossier courant
if [ ! -f "data.csv" ]; then
  echo "Erreur : Le fichier data.csv est manquant."
  exit 1
fi
```
Vérification de la présence du fichier CSV :

Avant de continuer, le script vérifie que le fichier data.csv est présent dans le répertoire courant. Si ce fichier est manquant, le script affiche une erreur et s’arrête.

```
# Copier le fichier CSV dans le conteneur MariaDB pour l'import
docker cp data.csv dolibarr-db:/var/lib/mysql/data.csv
```
Copie du fichier CSV dans le conteneur Docker :

Le script utilise la commande docker cp pour transférer le fichier CSV vers le conteneur MariaDB à l'emplacement /var/lib/mysql/data.csv.
```
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
```
Message informatif :

**echo "Importation des data depuis data.csv..."** : Affiche un message dans la console pour informer que l'importation est en cours.

**docker exec -i dolibarr-db mysql -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" <<EOF** : 

Cette commande exécute mysql à l'intérieur du conteneur Docker dolibarr-db.

-i : Maintient l'entrée standard ouverte pour transmettre la commande SQL.
Les arguments passés au client mysql :
-u"$DB_USER" : Spécifie l'utilisateur de la base (ex. dolibarr_user).
-p"$DB_PASSWORD" : Fournit le mot de passe associé à cet utilisateur.
"$DB_NAME" : Indique le nom de la base cible (ici dolibarr).


**LOAD DATA LOCAL INFILE '/var/lib/mysql/data.csv'** :
 
Charge les données du fichier CSV situé dans le chemin /var/lib/mysql/data.csv (chemin à l'intérieur du conteneur MariaDB).

**INTO TABLE llx_societe** : Indique que les données doivent être insérées dans la table llx_societe.
**FIELDS TERMINATED BY ','** : Spécifie que les colonnes dans le CSV sont séparées par des virgules (,).
**ENCLOSED BY '"'** : Indique que les valeurs textuelles dans le fichier sont entourées de guillemets (").
**LINES TERMINATED BY '\n'** : Indique que chaque ligne dans le CSV se termine par un retour à la ligne (\n).
**IGNORE 1 ROWS **: Ignore la première ligne du fichier CSV, généralement utilisée pour les en-têtes (noms des colonnes).

**(nom, adresse, telephone, email, type)**

Les colonnes du fichier CSV sont associées aux colonnes correspondantes dans la table :

nom, adresse, telephone, email → Colonnes de la table llx_societe.
type → Colonne spéciale utilisée pour distinguer les clients des fournisseurs.

**SET fk_societe_type = CASE**
**WHEN type = 'client' THEN 1**
**WHEN type = 'fournisseur' THEN 2**

```
SET fk_societe_type = CASE
  WHEN type = 'client' THEN 1
  WHEN type = 'fournisseur' THEN 2
  ELSE NULL
END;

```
**fk_societe_type** : Colonne dans la table qui indique le type de société.

Utilisation de la commande CASE pour attribuer une valeur à cette colonne en fonction de la valeur dans le champ type du CSV :

**  WHEN type = 'client' THEN 1** : Si type = 'client' → fk_societe_type est défini à 1.
** WHEN type = 'fournisseur' THEN 2** : Si type = 'fournisseur' → fk_societe_type est défini à 2.
** ELSE NULL ** : Si type ne correspond à aucun des cas, la colonne est remplie par NULL.

**END;**

Fin de commande. 

**EOF**

 Fin de la commande SQL :
 
 Cette ligne marque la fin de la commande SQL transmise au client mysql

```
# Suppression du fichier CSV du conteneur après import
docker exec -i dolibarr-db rm /var/lib/mysql/data.csv

```
Suppression du fichier CSV après import :

Une fois l'importation terminée, le script supprime le fichier CSV du conteneur pour éviter d'occuper inutilement de l’espace.
```

echo "Importation terminée."
```
Message final :

Le script affiche un message indiquant que l'importation est terminée avec succès.

### Save & Restor : 

#### Save : 
```

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
```
Configuration des variables : 

**APP_CONTAINER** : Nom du conteneur Docker exécutant l’application Dolibarr.
**DB_CONTAINER** : Nom du conteneur Docker exécutant la base de données MariaDB.
**DB_NAME** : Nom de la base de données utilisée par Dolibarr (ex. dolibarr).
**DB_USER et DB_PASS** : Identifiants MySQL pour accéder à la base.
**BACKUP_DIR** : Répertoire local où les sauvegardes seront stockées (par défaut ./backups).
**DATE** : Horodatage au format YYYY-MM-DD_HH-MM-SS, pour différencier les fichiers de sauvegarde.
**DB_BACKUP_FILE** : Chemin et nom du fichier de sauvegarde pour la base de données.
**MODULES_BACKUP_FILE** : Chemin et nom du fichier de sauvegarde pour les modules Dolibarr.

```
# Création du dossier de sauvegarde si nécessaire
mkdir -p "$BACKUP_DIR"
```
Création du répertoire de sauvegarde : 

Vérifie que le dossier de sauvegarde existe, et le crée si nécessaire.

```
echo "### Début de la sauvegarde ###"
```
Début du processus de sauvegarde : 

Affiche un message informant que le processus de sauvegarde commence.

```

# Sauvegarde de la base de données
echo "Sauvegarde de la base de données..."
sudo docker exec "$APP_CONTAINER" mysqldump -h"$DB_CONTAINER" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$DB_BACKUP_FILE"
```

Sauvegarde de la base de données : 

Exécute la commande **mysqldump** depuis le conteneur de l'application Dolibarr pour sauvegarder la base de données :

**-h"$DB_CONTAINER"** : Spécifie l'hôte de la base (le conteneur MariaDB).
**-u"$DB_USER" et -p"$DB_PASS"** : Utilise les identifiants pour se connecter.
**"$DB_NAME"** : Sauvegarde uniquement cette base.

Le résultat est redirigé dans le fichier défini par **DB_BACKUP_FILE**.

```
if [ $? -eq 0 ]; then
    echo "Sauvegarde de la base de données réussie : $DB_BACKUP_FILE"
else
    echo "Erreur lors de la sauvegarde de la base de données."
    exit 1
fi
```
Vérification :

Si la commande réussit ($? -eq 0), un message de succès est affiché avec le chemin de sauvegarde.
Sinon, un message d'erreur est affiché, et le script s'arrête (exit 1).

```
# Sauvegarde des modules Dolibarr
echo "Sauvegarde des modules Dolibarr..."
sudo docker exec "$APP_CONTAINER" tar -cf - -C /var/www/html/custom . > "$MODULES_BACKUP_FILE"
```
Sauvegarde des modules Dolibarr :

Cette commande archive les modules personnalisés (répertoire custom) de Dolibarr :

-**cf - ** : Crée une archive sans fichier intermédiaire.
-**C /var/www/html/custom .** : Change le répertoire courant dans le conteneur avant d'archiver.

Le résultat est redirigé vers le fichier défini par **MODULES_BACKUP_FILE**.

```
if [ $? -eq 0 ]; then
    echo "Sauvegarde des modules réussie : $MODULES_BACKUP_FILE"
else
    echo "Erreur lors de la sauvegarde des modules."
    exit 1
fi
```
Vérification :

Si la commande réussit ($? -eq 0), un message de succès est affiché avec le chemin de sauvegarde.
Sinon, un message d'erreur est affiché, et le script s'arrête (exit 1).
```
echo "### Fin de la sauvegarde ###"
```
 Message de fin : 

 Affiche un message pour indiquer que la procédure de sauvegarde est terminée.

#### Restor :

```
#!/bin/bash

# Configuration
APP_CONTAINER="dolibarr-app"    # Conteneur qui contient `mysql` (client)
DB_CONTAINER="dolibarr-db"      # Conteneur de la base de données
DB_NAME="dolibarr"              # Nom de la base de données
DB_USER="dolibarr_user"         # Nom d'utilisateur MySQL
DB_PASS="dolibarr_password"     # Mot de passe MySQL
BACKUP_DIR="./backups"          # Répertoire des sauvegardes
LATEST_DB_BACKUP=$(ls -t $BACKUP_DIR/dolibarr_db_backup_*.sql | head -n 1)  # Dernière sauvegarde DB
LATEST_MODULES_BACKUP=$(ls -t $BACKUP_DIR/dolibarr_modules_backup_*.tar | head -n 1)


```
Configuration initiale :

Nom des conteneurs :

**APP_CONTAINER** : Conteneur exécutant l'application Dolibarr.
**DB_CONTAINER** : Conteneur exécutant la base de données MariaDB.

Informations sur la base de données :

**DB_NAME** : Nom de la base de données à restaurer.
**DB_USER et DB_PASS** : Identifiants pour accéder à la base.

Répertoire de sauvegarde :

**BACKUP_DIR** : Répertoire contenant les sauvegardes.
**LATEST_DB_BACKUP** : Recherche du fichier de sauvegarde le plus récent dans le répertoire de sauvegarde, basé sur la date (fichier SQL).
**LATEST_MODULES_BACKUP** :  Recherche du fichier de sauvegarde le plus récent dans le répertoire de sauvegarde, afin de récuperer les modules.

```

# Vérification de la dernière sauvegarde
if [ -z "$LATEST_DB_BACKUP" ]; then
    echo "Aucune sauvegarde de base de données trouvée dans le répertoire $BACKUP_DIR"
    exit 1
fi

# Vérification de la dernière sauvegarde des modules
if [ -z "$LATEST_MODULES_BACKUP" ]; then
    echo "Aucune sauvegarde des modules trouvée dans le répertoire $BACKUP_DIR"
    exit 1
fi
```
Vérification de la dernière sauvegarde : 

Le script vérifie si un fichier de sauvegarde est présent dans le répertoire de sauvegarde. Si aucun fichier n'est trouvé, un message d'erreur est affiché et le script s'arrête (exit 1).

```
echo "### Début de la restauration ###"
```
Message de début : 

Affiche un message pour signaler que le processus de restauration commence.

```
# Recréation des conteneurs
echo "Recréation des conteneurs..."
docker-compose down
docker-compose up -d
```
Recréation des conteneurs Docker : 

**docker-compose down** : Arrête et supprime les conteneurs existants.
**docker-compose up -d** : Recréé les conteneurs définis dans le fichier docker-compose.yml (y compris Dolibarr et MariaDB) et les démarre en mode détaché (-d).
```
# Attente du démarrage des conteneurs
echo "Attente du démarrage des conteneurs..."
sleep 20
```
Attente du démarrage des conteneurs : 

Le script attend 20 secondes pour s'assurer que les conteneurs ont eu le temps de démarrer correctement.

```
# Désactivation des contraintes de clé étrangère
echo "Désactivation des contraintes de clé étrangère..."
docker exec -i "$DB_CONTAINER" mysql -u"$DB_USER" -p"$DB_PASS" -e "SET FOREIGN_KEY_CHECKS = 0;"
```
Désactivation des contraintes de clé étrangère :

Avant de restaurer la base de données, le script désactive les contraintes de clé étrangère dans MariaDB avec la commande SQL SET FOREIGN_KEY_CHECKS = 0;. Cela permet d'éviter des erreurs si les tables sont restaurées dans un ordre incorrect (les clés étrangères peuvent empêcher l'insertion de données si elles dépendent d'autres tables).

```
# Restauration de la base de données
echo "Restauration de la base de données depuis $LATEST_DB_BACKUP..."
docker exec -i "$DB_CONTAINER" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$LATEST_DB_BACKUP"
```
Restauration de la base de données : 

Le fichier de sauvegarde le plus récent (LATEST_DB_BACKUP) est restauré dans la base de données dolibarr via la commande mysql.
< "$LATEST_DB_BACKUP" : Redirige le fichier SQL vers la commande mysql pour l'importer dans la base de données.
```
# Réactivation des contraintes de clé étrangère
echo "Réactivation des contraintes de clé étrangère..."
docker exec -i "$DB_CONTAINER" mysql -u"$DB_USER" -p"$DB_PASS" -e "SET FOREIGN_KEY_CHECKS = 1;"
```
Réactivation des contraintes de clé étrangère

Une fois la restauration terminée, les contraintes de clé étrangère sont réactivées pour garantir l'intégrité référentielle des données.

```
# Vérification de la réussite de la restauration
if [ $? -eq 0 ]; then
    echo "Restauration de la base de données réussie."
else
    echo "Erreur lors de la restauration de la base de données."
    exit 1
fi
```

Vérification de la réussite de la restauration

Après la restauration, le script vérifie si la commande précédente s'est exécutée avec succès en vérifiant la valeur de retour ($?).

Si la restauration est réussie, un message de confirmation est affiché. Sinon, un message d'erreur est affiché et le script s'arrête.

```
# Restauration des modules Dolibarr (volume)
echo "Restauration des modules Dolibarr depuis $LATEST_MODULES_BACKUP..."
docker exec -i "$APP_CONTAINER" tar -xvf - -C /var/www/html/custom < "$LATEST_MODULES_BACKUP"
```
Restauration des modules Dolibarr : 

Le script restaure ensuite les modules Dolibarr en extrayant l'archive TAR de la dernière sauvegarde et en la copiant dans le répertoire approprié dans le conteneur Dolibarr :

Cette commande utilise tar pour extraire les fichiers dans le répertoire /var/www/html/custom du conteneur dolibarr-app.

```
# Vérification de la réussite de la restauration des modules
if [ $? -eq 0 ]; then
    echo "Restauration des modules réussie."
else
    echo "Erreur lors de la restauration des modules."
    exit 1
fi

```
Vérification de la réussite de la restauration des modules :

Si la commande de restauration des modules échoue, le script affiche un message d'erreur et s'arrête.
```
echo "### Fin de la restauration ###"

```
Message de fin

Le script affiche un message indiquant la fin du processus de restauration.


## 4 Bilan du projet

Dans cette partie, on va faire une conclusion de notre projet et de nos différents point de vu avec les momments faibles et les momments forts puis nos avis sur le projet. 

### 4-2 momment fort 

Pour les moments fort, nous avions : 

- La recherche d'information sur les différents outils utiliser
- le script d'installation était plutôt simple a faire (sauf la partie avec les modules )
- Les premières étapes du projet était plutôt simple à faire.

### 4-3 momment faible

Pour les moments faible, nous avions : 

- la création du système de sauvegarde qui était plutôt dure à réaliser (save.sh et restor.sh) 
- l'iniation des modules mis dans le script installation

### 4-4 Nos avis 

Baptiste : 

<écrit ton avis sur le projet ici>

Léo : 

Je m'excuse de mon absence, j'essayerai d'être le plus complet ici par rapport à mon avis. 

Même si le projet a mal commencé, il était plutôt intéressant dans son ensemble. Cela nous a permis de découvrir comment manier et utiliser Dolibarr, mais aussi comment réaliser un système de sauvegarde. Bien qu’au début, il était plutôt simple. Mais cela s'est bien corcé quand nous avions touché à comment sauvegarder, mais aussi comment utiliser dolibarr afin d'activer les modules. 

De plus, je voudrais faire une remarque : j'ai essayé de faire le système de sauvegarde (même si la semaine était plutôt problématique par rapport à ma santé), il est possible que le programme fonctionne à moitié ou soit fonctionne.  

Je sais que mon avis personnel est plutôt court mais j'ai essayé de faire ce document le plus complet afin de présenter le projet.
